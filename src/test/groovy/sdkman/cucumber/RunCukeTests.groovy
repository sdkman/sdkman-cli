package sdkman.cucumber

import cucumber.api.CucumberOptions
import cucumber.api.junit.Cucumber
import org.junit.runner.RunWith

@RunWith(Cucumber)
@CucumberOptions(
	format=["pretty", "html:build/reports/cucumber"],
	strict=true,
	features=["src/test/cucumber"],
	glue=["src/test/groovy/sdkman/steps"],
	tags=["~@manual", "~@review"]
)
class RunCukeTests {}
