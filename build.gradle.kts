import com.jfrog.bintray.gradle.BintrayExtension.PackageConfig
import com.jfrog.bintray.gradle.BintrayExtension.VersionConfig
import com.jfrog.bintray.gradle.tasks.RecordingCopyTask
import groovy.util.ConfigSlurper
import java.util.Date
import org.apache.tools.ant.filters.ReplaceTokens
import org.gradle.api.tasks.testing.logging.TestExceptionFormat.FULL

plugins {
	groovy
	id("com.jfrog.bintray") version "1.8.4"
}

internal val userHome = System.getProperty("user.home")
internal val installBinDir by extra {"${userHome}/.sdkman/bin"}
internal val installSrcDir by extra {"${userHome}/.sdkman/src"}

internal val environment by extra {
	if (hasProperty("env")) {
		val env: String by project
		env
	}
	else {
		"local"
	}
}

println("Environment is set to: ${environment}")

internal val config by extra {ConfigSlurper(environment).parse(file("config.groovy").toURI().toURL())}

internal val buildNumber           by extra {System.getenv("TRAVIS_BUILD_NUMBER") ?: "0"}
internal val sdkmanCliBuildVersion by extra {"${config["sdkmanCliVersion"]}+${buildNumber}"}

repositories.jcenter()

dependencies {
	testImplementation("com.github.tomakehurst", "wiremock",         "2.25.1") {
		exclude(module = "junit")
	}
	testImplementation("io.cucumber",            "cucumber-groovy",  "4.7.1")
	testImplementation("io.cucumber",            "cucumber-junit",   "4.7.4")
	testImplementation("io.cucumber",            "gherkin",          "5.2.0")
	testImplementation("junit",                  "junit",            "4.13")
	testImplementation("org.codehaus.groovy",    "groovy",           "2.4.19")
	testImplementation("org.codehaus.groovy",    "groovy-json",      "2.4.19")
	testImplementation("org.codehaus.groovy",    "groovy-templates", "2.4.19")
	testImplementation("org.slf4j",              "slf4j-api",        "1.7.30")
	testImplementation("org.slf4j",              "slf4j-simple",     "1.7.30")
	testImplementation("org.spockframework",     "spock-core",       "1.3-groovy-2.4") {
		exclude(module = "groovy-all")
	}
}

internal val prepareScripts by tasks.registering(Copy::class) {
	from("src/main/bash")
	into("build/scripts")
	include("**/*")
	filter(
		mutableMapOf(
			"tokens" to
			mutableMapOf(
				"SDKMAN_VERSION"        to sdkmanCliBuildVersion,
				"SDKMAN_CANDIDATES_API" to config["candidatesApi"]
			)
		),
		ReplaceTokens::class.java
	)
}

tasks.test.configure {
	dependsOn(prepareScripts)
	testLogging.exceptionFormat = FULL
}

internal val assembleArchive by tasks.registering(Zip::class) {
	dependsOn(prepareScripts)
	archiveAppendix.set("cli")
	archiveVersion .set(sdkmanCliBuildVersion)
	from("build/scripts")
	include("*.sh*")
}

tasks.assemble.configure {
	dependsOn(assembleArchive)
}

internal val cleanInstallInit by tasks.registering(Delete::class) {
	delete(installBinDir)
}

internal val cleanInstallModules by tasks.registering(Delete::class) {
	delete(installSrcDir)
}

internal val installInit by tasks.registering(Copy::class) {
	dependsOn(cleanInstallInit, prepareScripts)
	from("build/scripts")
	into(installBinDir)
	include("sdkman-init.sh")
}

internal val installModules by tasks.registering(Copy::class) {
	dependsOn(cleanInstallModules, prepareScripts)
	from("build/scripts")
	into(installSrcDir)
	include("sdkman-*.sh")
	exclude("sdkman-init.sh")
}

internal val install by tasks.registering {
	dependsOn(installInit, installModules)
}

bintray {
	user    = System.getenv("BINTRAY_USERNAME")
	key     = System.getenv("BINTRAY_API_KEY")
	publish = true
	filesSpec(closureOf<RecordingCopyTask> {
		from("build/distributions")
		into(".")
	})
	pkg(closureOf<PackageConfig> {
		repo     = "generic"
		name     = "sdkman-cli"
		userOrg  = "sdkman"
		setLicenses("Apache-2.0")
		vcsUrl   = "https://github.com/sdkman/sdkman-cli.git"
		version(closureOf<VersionConfig> {
			name     = sdkmanCliBuildVersion
			desc     = "Binary zip distribution of SDKMAN bash client."
			released = Date().toString()
		})
	})
}
