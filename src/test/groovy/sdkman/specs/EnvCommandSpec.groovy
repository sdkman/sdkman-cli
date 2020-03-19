package sdkman.specs

import sdkman.support.SdkmanEnvSpecification
import spock.lang.Unroll

class EnvCommandSpec extends SdkmanEnvSpecification {
    def setup() {
        bash = sdkmanBashEnvBuilder
                .withVersionCache("x.y.z")
                .withOfflineMode(true)
                .build()
        bash.start()
        bash.execute("source $bootstrapScript")
    }

    def "should use the candidates contained in .sdkmanrc"() {
        given:
        new FileTreeBuilder(candidatesDirectory).with {
            "grails" {
                "2.1.0" {}
            }
            "groovy" {
                "2.4.1" {}
            }
        }

        new File(bash.workDir, '.sdkmanrc').text = sdkmanrc

        when:
        bash.execute("sdk env")

        then:
        verifyAll(bash.output) {
            contains("Using groovy version 2.4.1 in this shell.")
            contains("Using grails version 2.1.0 in this shell.")
        }

        where:
        sdkmanrc << ["grails=2.1.0\ngroovy=2.4.1", "grails=2.1.0\ngroovy=2.4.1\n"]
    }

    def "should issue an error if .sdkmanrc contains malformed candidate entries"() {
        given:
        new File(bash.workDir, '.sdkmanrc').text = "groovy 2.4.1"

        when:
        bash.execute("sdk env")

        then:
        verifyAll(bash) {
            status > 0
            output.contains("Invalid candidate format!")
        }
    }
}