# SDKMAN! CLI
### The Software Development Kit Manager Command Line Interface

[![Backers on Open Collective](https://opencollective.com/sdkman/backers/badge.svg)](#backers) 
[![Sponsors on Open Collective](https://opencollective.com/sdkman/sponsors/badge.svg)](#sponsors)
[![Discord](https://img.shields.io/discord/1245471991117512754)](https://discord.gg/y9mVJYVyu4)

SDKMAN is a tool for managing parallel Versions of multiple Software Development Kits on any Unix-based system. It provides a convenient command-line interface for installing, switching, removing, and listing Candidates.

See documentation on the [SDKMAN! website](https://sdkman.io).

## NOTICE

**We are rewriting all the commands for SDKMAN! in [Rust](https://www.rust-lang.org/) under a [new project](https://github.com/sdkman/sdkman-cli-native) that supplements this one. Only bug fixes to supporting code will be
accepted in this project. As a result, no further enhancements will be accepted on the commands in this project, and the commands here will be phased out in due course. This project will eventually form a lightweight
wrapper/launcher for the replacement Rust commands.**

## Installation

Open your favourite terminal and enter the following:

    $ curl -s https://get.sdkman.io | bash

If the environment needs tweaking for SDKMAN to be installed, the installer will prompt you accordingly and ask you to restart.

## Running the Cucumber Features

All SDKMAN's BDD tests describing the CLI behaviour are written in Cucumber and can be found under `src/test/resources/features`. These can be run with Gradle by running the following command:

    $ ./gradlew test

To perform development, you will need to have a JDK 11 installed which can be obtained by running the following after installing SDKMAN:

    $ sdk env install

## Contributors

This project exists thanks to all the people who contribute. 
<a href="https://github.com/sdkman/sdkman-cli/graphs/contributors"><img src="https://opencollective.com/sdkman/contributors.svg?width=890&button=false" /></a>


## Backers

Thank you to all our backers! [[Become a backer](https://opencollective.com/sdkman#backer)]

<a href="https://opencollective.com/sdkman#backers" target="_blank"><img src="https://opencollective.com/sdkman/backers.svg?width=890"></a>


## Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website. [[Become a sponsor](https://opencollective.com/sdkman#sponsor)]

<a href="https://opencollective.com/sdkman/sponsor/0/website" target="_blank"><img src="https://opencollective.com/sdkman/sponsor/0/avatar.svg"></a>
<a href="https://opencollective.com/sdkman/sponsor/1/website" target="_blank"><img src="https://opencollective.com/sdkman/sponsor/1/avatar.svg"></a>
<a href="https://opencollective.com/sdkman/sponsor/2/website" target="_blank"><img src="https://opencollective.com/sdkman/sponsor/2/avatar.svg"></a>
<a href="https://opencollective.com/sdkman/sponsor/3/website" target="_blank"><img src="https://opencollective.com/sdkman/sponsor/3/avatar.svg"></a>
<a href="https://opencollective.com/sdkman/sponsor/4/website" target="_blank"><img src="https://opencollective.com/sdkman/sponsor/4/avatar.svg"></a>
<a href="https://opencollective.com/sdkman/sponsor/5/website" target="_blank"><img src="https://opencollective.com/sdkman/sponsor/5/avatar.svg"></a>
<a href="https://opencollective.com/sdkman/sponsor/6/website" target="_blank"><img src="https://opencollective.com/sdkman/sponsor/6/avatar.svg"></a>
<a href="https://opencollective.com/sdkman/sponsor/7/website" target="_blank"><img src="https://opencollective.com/sdkman/sponsor/7/avatar.svg"></a>
<a href="https://opencollective.com/sdkman/sponsor/8/website" target="_blank"><img src="https://opencollective.com/sdkman/sponsor/8/avatar.svg"></a>
<a href="https://opencollective.com/sdkman/sponsor/9/website" target="_blank"><img src="https://opencollective.com/sdkman/sponsor/9/avatar.svg"></a>
