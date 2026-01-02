# Contributing to SDKMAN! CLI

Thank you for your interest in contributing to SDKMAN! CLI. We greatly value the feedback and contributions of our users.

## Important Notice

**This project is in maintenance mode.** We are only accepting bug fixes at this time, as SDKMAN! CLI is being rewritten in Rust. New features and enhancements will not be accepted.

## Code of Conduct

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to info@sdkman.io.

## How to Contribute

### Before You Start

We distinguish between:
- **Bug Reports**: Issues with existing functionality
- **Support Requests**: Questions about usage

We prefer to have a conversation on [SDKMAN Discord](https://discord.gg/y9mVJYVyu4) before creating new issues if you're unsure how to categorize your request. Join our Help channel to discuss.

### Reporting Bugs

1. **Search existing issues** to avoid duplicates
2. **Use the issue template** when creating a new issue via our [GitHub Issue Tracker](https://github.com/sdkman/sdkman-cli/issues/new)
3. **Provide detailed information** including:
   - Steps to reproduce the issue
   - Expected behavior
   - Actual behavior
   - Your environment (OS, shell, Java version)
   - Relevant logs or error messages

**Note:** Issues that don't follow the template may be closed.

### Submitting Pull Requests

Pull requests are always welcome but must follow these guidelines:

#### Prerequisites

1. **Link to an issue**: Every PR must reference a valid GitHub issue
2. **Discuss first**: Talk about your proposed fix on Discord or in the issue before starting work
3. **Keep it small**: Small, focused PRs are strongly preferred over large changes
4. **Include tests**: Each PR should include passing tests that prove its validity (where feasible)

#### Development Setup

1. **Install required tools**:
   ```bash
   sdk env install  # Install JDK 11 from .sdkmanrc
   sdk env          # Switch to correct SDK versions
   ```

2. **Verify your setup**:
   ```bash
   ./gradlew test
   ```

#### Development Workflow

1. **Fork the repository** and create a new branch from `master`
2. **Make your changes** following our code standards
3. **Write or update tests** to cover your changes
4. **Run the test suite** to ensure everything passes:
   ```bash
   ./gradlew test
   ```
5. **Commit your changes** using clear, descriptive commit messages
6. **Push to your fork** and submit a pull request

#### Pull Request Guidelines

- Fill in the PR template completely
- Link back to the GitHub issue by replacing `#XXX` with the issue number
- Ensure all tests pass
- Keep commits focused and atomic
- Write clear commit messages in imperative mood (e.g., "fix user login bug")
- Be responsive to feedback during code review

#### Testing Requirements

- All bug fixes must include a test that would have caught the bug
- Tests should follow the existing Cucumber BDD pattern
- Tests should cover both happy path and edge cases
- Run `./gradlew test` to verify all tests pass

### Code Standards

- Follow the existing code style in bash scripts
- Use meaningful variable and function names
- Add comments for complex logic
- Avoid introducing new dependencies without discussion
- Ensure backward compatibility

### Getting Help

- Join our [Discord server](https://discord.gg/y9mVJYVyu4) for questions
- Check existing issues and discussions
- Read the documentation in the repository

## Project Structure

- `src/main/bash/` - Core bash scripts implementing SDKMAN commands
- `src/test/groovy/` - Groovy test code using Spock framework
- `src/test/resources/features/` - Cucumber feature files (BDD tests)

## Recognition

Contributors will be recognized in our release notes and commit history. We appreciate your efforts to make SDKMAN! better!

## Questions?

If you have questions about contributing, feel free to ask on [Discord](https://discord.gg/y9mVJYVyu4) or open a discussion on GitHub.
