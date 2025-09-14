# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

SDKMAN! CLI is a bash-based command-line tool for managing parallel versions of multiple Software Development Kits on Unix-based systems. The project is primarily written in bash scripts with Groovy/Spock for testing using Cucumber BDD tests.

**Important**: This project is in maintenance mode. Only bug fixes are accepted as the project is being rewritten in Rust under a new project. No new enhancements to existing commands will be accepted.

## Development Environment

- Requires JDK 11 (specified in `.sdkmanrc`)
- Uses Gradle 8.0.1 for build management
- Run `sdk env install` to install the correct JDK version
- Run `sdk env` to switch to the appropriate SDK versions

## Build and Test Commands

### Core Commands
- `./gradlew test` - Run all Cucumber BDD tests
- `./gradlew clean` - Clean build artifacts
- `./gradlew build` - Build the project

### Running Specific Tests
- Tests can be run with tags: use `@manual` and `@review` tags to exclude certain tests
- Individual feature files can be run by specifying the feature file path
- Environment can be set via `env` property (local/beta/stable) - defaults to local

### Development Setup
Before starting development, ensure the correct Java version:
```bash
sdk env install  # Install JDK from .sdkmanrc
sdk env          # Switch to correct SDK versions
```

## Architecture

### Code Structure
- `src/main/bash/` - Core bash scripts implementing SDKMAN commands
  - `sdkman-main.sh` - Main entry point and command routing
  - `sdkman-init.sh` - Environment initialization and platform detection
  - Individual command scripts (e.g., `sdkman-install.sh`, `sdkman-list.sh`)
- `src/test/groovy/` - Groovy test code using Spock framework
- `src/test/resources/features/` - Cucumber feature files (BDD tests)

### Core Components
- **Command Router**: `sdkman-main.sh` handles command aliases and routing
- **Environment Setup**: `sdkman-init.sh` manages platform detection and configuration
- **Modular Commands**: Each SDKMAN command is implemented in its own bash script
- **API Integration**: Commands interact with SDKMAN API for candidate information

### Testing Strategy
- **Cucumber BDD Tests**: Primary testing approach using Gherkin feature files
- **Spock Unit Tests**: Some Groovy unit tests for specific components
- Tests cover both happy path and edge cases
- Mock external dependencies using WireMock
- Test environment uses bash process execution

### Configuration
- `.sdkmanrc` file specifies required Java version (11.0.17-tem)
- Environment-specific API endpoints configured in `build.gradle`:
  - **local**: `http://localhost:8080/2` (for development)
  - **beta**: `https://beta.sdkman.io/2`
  - **stable**: `https://api.sdkman.io/2` (production)
- Pass environment via `-Penv=<environment>` to gradle commands

## Key Files
- `build.gradle` - Main build configuration with test dependencies
- `src/main/bash/sdkman-main.sh` - Command entry point and routing
- `src/test/groovy/sdkman/cucumber/RunCukeTests.groovy` - Cucumber test runner
- `src/test/resources/features/` - BDD feature specifications

## Testing Guidelines
- All features should have Cucumber tests covering happy and unhappy paths
- Tests should be written before implementation (TDD approach)
- Use `@manual` and `@review` tags to exclude certain tests from automation
- Mock external API calls using WireMock stubs