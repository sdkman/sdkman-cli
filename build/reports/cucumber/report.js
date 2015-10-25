$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("broadcast.feature");
formatter.feature({
  "line": 1,
  "name": "Broadcast",
  "description": "",
  "id": "broadcast",
  "keyword": "Feature"
});
formatter.before({
  "duration": 145558072,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 419154221,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 6376926,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103240893,
  "status": "passed"
});
formatter.scenario({
  "line": 8,
  "name": "A command is issued with no prior Broadcast received",
  "description": "",
  "id": "broadcast;a-command-is-issued-with-no-prior-broadcast-received",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 9,
  "name": "no prior Broadcast was received",
  "keyword": "Given "
});
formatter.step({
  "line": 10,
  "name": "a new Broadcast \"This is a LIVE Broadcast!\" with id \"12345\" is available",
  "keyword": "And "
});
formatter.step({
  "line": 11,
  "name": "I enter \"sdk version\"",
  "keyword": "When "
});
formatter.step({
  "line": 12,
  "name": "I see \"This is a LIVE Broadcast!\"",
  "keyword": "Then "
});
formatter.match({
  "location": "broadcast_steps.groovy:6"
});
formatter.result({
  "duration": 1151383,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is a LIVE Broadcast!",
      "offset": 17
    },
    {
      "val": "12345",
      "offset": 53
    }
  ],
  "location": "broadcast_steps.groovy:11"
});
formatter.result({
  "duration": 24135581,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk version",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 102481425,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is a LIVE Broadcast!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 1548159,
  "status": "passed"
});
formatter.write("\nOutput: \n\nThis is a LIVE Broadcast!\nSDKMAN x.y.z\n\n\n");
formatter.after({
  "duration": 4812791,
  "status": "passed"
});
formatter.before({
  "duration": 4611715,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 47318690,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 4193915,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 104404415,
  "status": "passed"
});
formatter.scenario({
  "line": 14,
  "name": "A command is issued where the prior Broadcast was different to the Live one",
  "description": "",
  "id": "broadcast;a-command-is-issued-where-the-prior-broadcast-was-different-to-the-live-one",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 15,
  "name": "a prior Broadcast \"This is an OLD Broadcast!\" with id \"12344\" was issued",
  "keyword": "Given "
});
formatter.step({
  "line": 16,
  "name": "a new Broadcast \"This is a LIVE Broadcast!\" with id \"12345\" is available",
  "keyword": "And "
});
formatter.step({
  "line": 17,
  "name": "I enter \"sdk version\"",
  "keyword": "When "
});
formatter.step({
  "line": 18,
  "name": "I see \"This is a LIVE Broadcast!\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "This is an OLD Broadcast!",
      "offset": 19
    },
    {
      "val": "12344",
      "offset": 55
    }
  ],
  "location": "broadcast_steps.groovy:16"
});
formatter.result({
  "duration": 457523,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is a LIVE Broadcast!",
      "offset": 17
    },
    {
      "val": "12345",
      "offset": 53
    }
  ],
  "location": "broadcast_steps.groovy:11"
});
formatter.result({
  "duration": 19631166,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk version",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 101136221,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is a LIVE Broadcast!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 121788,
  "status": "passed"
});
formatter.write("\nOutput: \n\nThis is a LIVE Broadcast!\nSDKMAN x.y.z\n\n\n");
formatter.after({
  "duration": 2815164,
  "status": "passed"
});
formatter.before({
  "duration": 3141765,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 43020448,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 4404080,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 110393954,
  "status": "passed"
});
formatter.scenario({
  "line": 20,
  "name": "A command is issued where the prior Broadcast was the same as the Live one",
  "description": "",
  "id": "broadcast;a-command-is-issued-where-the-prior-broadcast-was-the-same-as-the-live-one",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 21,
  "name": "a prior Broadcast \"This is a LIVE Broadcast!\" with id \"12345\" was issued",
  "keyword": "Given "
});
formatter.step({
  "line": 22,
  "name": "a new Broadcast \"This is a LIVE Broadcast!\" with id \"12345\" is available",
  "keyword": "And "
});
formatter.step({
  "line": 23,
  "name": "I enter \"sdk version\"",
  "keyword": "When "
});
formatter.step({
  "line": 24,
  "name": "I do not see \"This is a LIVE Broadcast!\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "This is a LIVE Broadcast!",
      "offset": 19
    },
    {
      "val": "12345",
      "offset": 55
    }
  ],
  "location": "broadcast_steps.groovy:16"
});
formatter.result({
  "duration": 229278,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is a LIVE Broadcast!",
      "offset": 17
    },
    {
      "val": "12345",
      "offset": 53
    }
  ],
  "location": "broadcast_steps.groovy:11"
});
formatter.result({
  "duration": 21832097,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk version",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 101226690,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is a LIVE Broadcast!",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 203652,
  "status": "passed"
});
formatter.write("\nOutput: \n\nSDKMAN x.y.z\n\n\n");
formatter.after({
  "duration": 1590502,
  "status": "passed"
});
formatter.before({
  "duration": 3479501,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 44638586,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 5412444,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103104988,
  "status": "passed"
});
formatter.scenario({
  "line": 26,
  "name": "A Broadcast command recalls a prior Broadcast",
  "description": "",
  "id": "broadcast;a-broadcast-command-recalls-a-prior-broadcast",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 27,
  "name": "a prior Broadcast \"This is an OLD Broadcast!\" with id \"12344\" was issued",
  "keyword": "Given "
});
formatter.step({
  "line": 28,
  "name": "a new Broadcast \"This is an OLD Broadcast!\" with id \"12344\" is available",
  "keyword": "And "
});
formatter.step({
  "line": 29,
  "name": "I enter \"sdk broadcast\"",
  "keyword": "When "
});
formatter.step({
  "line": 30,
  "name": "I see \"This is an OLD Broadcast!\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "This is an OLD Broadcast!",
      "offset": 19
    },
    {
      "val": "12344",
      "offset": 55
    }
  ],
  "location": "broadcast_steps.groovy:16"
});
formatter.result({
  "duration": 286122,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is an OLD Broadcast!",
      "offset": 17
    },
    {
      "val": "12344",
      "offset": 53
    }
  ],
  "location": "broadcast_steps.groovy:11"
});
formatter.result({
  "duration": 18101566,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk broadcast",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 101218451,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is an OLD Broadcast!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 85071,
  "status": "passed"
});
formatter.write("\nOutput: \n\nThis is an OLD Broadcast!\n\n\n");
formatter.after({
  "duration": 1389721,
  "status": "passed"
});
formatter.before({
  "duration": 3294952,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 36996692,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 3385911,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103299182,
  "status": "passed"
});
formatter.scenario({
  "line": 32,
  "name": "A Broadcast command is issued with no prior Broadcast received",
  "description": "",
  "id": "broadcast;a-broadcast-command-is-issued-with-no-prior-broadcast-received",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 33,
  "name": "no prior Broadcast was received",
  "keyword": "Given "
});
formatter.step({
  "line": 34,
  "name": "a new Broadcast \"This is a LIVE Broadcast!\" with id \"12345\" is available",
  "keyword": "And "
});
formatter.step({
  "line": 35,
  "name": "I enter \"sdk broadcast\"",
  "keyword": "When "
});
formatter.step({
  "line": 36,
  "name": "I see \"This is a LIVE Broadcast!\"",
  "keyword": "Then "
});
formatter.match({
  "location": "broadcast_steps.groovy:6"
});
formatter.result({
  "duration": 142076,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is a LIVE Broadcast!",
      "offset": 17
    },
    {
      "val": "12345",
      "offset": 53
    }
  ],
  "location": "broadcast_steps.groovy:11"
});
formatter.result({
  "duration": 14721670,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk broadcast",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 101014718,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is a LIVE Broadcast!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 81169,
  "status": "passed"
});
formatter.write("\nOutput: \n\nThis is a LIVE Broadcast!\nThis is a LIVE Broadcast!\n\n\n");
formatter.after({
  "duration": 1347198,
  "status": "passed"
});
formatter.uri("command_line_interop.feature");
formatter.feature({
  "line": 1,
  "name": "Command Line Interop",
  "description": "",
  "id": "command-line-interop",
  "keyword": "Feature"
});
formatter.before({
  "duration": 3611518,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 36076036,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 6287092,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102069118,
  "status": "passed"
});
formatter.scenario({
  "line": 8,
  "name": "Enter sdk",
  "description": "",
  "id": "command-line-interop;enter-sdk",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 9,
  "name": "I enter \"sdk\"",
  "keyword": "When "
});
formatter.step({
  "line": 10,
  "name": "I see \"Usage: sdk \u003ccommand\u003e [candidate] [version]\"",
  "keyword": "Then "
});
formatter.step({
  "line": 11,
  "name": "I see \"sdk offline \u003cenable|disable\u003e\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "sdk",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100488629,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Usage: sdk \u003ccommand\u003e [candidate] [version]",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 57877,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk offline \u003cenable|disable\u003e",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 43412,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\n");
formatter.after({
  "duration": 2025961,
  "status": "passed"
});
formatter.before({
  "duration": 2936411,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 34558348,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 3647647,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101701238,
  "status": "passed"
});
formatter.scenario({
  "line": 13,
  "name": "Ask for help",
  "description": "",
  "id": "command-line-interop;ask-for-help",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 14,
  "name": "I enter \"sdk help\"",
  "keyword": "When "
});
formatter.step({
  "line": 15,
  "name": "I see \"Usage: sdk \u003ccommand\u003e [candidate] [version]\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "sdk help",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100471141,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Usage: sdk \u003ccommand\u003e [candidate] [version]",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 58470,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\n");
formatter.after({
  "duration": 2087056,
  "status": "passed"
});
formatter.before({
  "duration": 3818845,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 31449527,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 3405814,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102912278,
  "status": "passed"
});
formatter.scenario({
  "line": 17,
  "name": "Enter an invalid Command",
  "description": "",
  "id": "command-line-interop;enter-an-invalid-command",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 18,
  "name": "I enter \"sdk goopoo grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 19,
  "name": "I see \"Invalid command: goopoo\"",
  "keyword": "Then "
});
formatter.step({
  "line": 20,
  "name": "I see \"Usage: sdk \u003ccommand\u003e [candidate] [version]\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "sdk goopoo grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100432662,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Invalid command: goopoo",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 90413,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Usage: sdk \u003ccommand\u003e [candidate] [version]",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 95291,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nInvalid command: goopoo\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\n");
formatter.after({
  "duration": 2308872,
  "status": "passed"
});
formatter.before({
  "duration": 3070349,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 28999626,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 3212841,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103206899,
  "status": "passed"
});
formatter.scenario({
  "line": 22,
  "name": "Enter an invalid Candidate",
  "description": "",
  "id": "command-line-interop;enter-an-invalid-candidate",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 23,
  "name": "I enter \"sdk install groffle\"",
  "keyword": "When "
});
formatter.step({
  "line": 24,
  "name": "I see \"Stop! groffle is not a valid candidate.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install groffle",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 101032830,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! groffle is not a valid candidate.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 111364,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nStop! groffle is not a valid candidate.\n\n\n");
formatter.after({
  "duration": 1464556,
  "status": "passed"
});
formatter.uri("current_candidate.feature");
formatter.feature({
  "line": 1,
  "name": "Current Candidate",
  "description": "",
  "id": "current-candidate",
  "keyword": "Feature"
});
formatter.before({
  "duration": 3876910,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 21015727,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 3994349,
  "status": "passed"
});
formatter.scenario({
  "line": 7,
  "name": "Display current candidate version in use",
  "description": "",
  "id": "current-candidate;display-current-candidate-version-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 8,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 9,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 10,
  "name": "I enter \"sdk current grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 11,
  "name": "I see \"Using grails version 1.3.9\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 7998703,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101838960,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk current grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100441081,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 1.3.9",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 60469,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nUsing grails version 1.3.9\n\n\n");
formatter.after({
  "duration": 897924,
  "status": "passed"
});
formatter.before({
  "duration": 2735679,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 21959270,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 3426606,
  "status": "passed"
});
formatter.scenario({
  "line": 13,
  "name": "Display current candidate version when none is in use",
  "description": "",
  "id": "current-candidate;display-current-candidate-version-when-none-is-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 14,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed but not default",
  "keyword": "Given "
});
formatter.step({
  "line": 15,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 16,
  "name": "I enter \"sdk current grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 17,
  "name": "I see \"Not using any version of grails\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 1039475,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103404520,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk current grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100454164,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Not using any version of grails",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 59698,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nNot using any version of grails\n\n\n");
formatter.after({
  "duration": 1328074,
  "status": "passed"
});
formatter.before({
  "duration": 3352095,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 36793292,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 3512026,
  "status": "passed"
});
formatter.scenario({
  "line": 19,
  "name": "Display current candidate versions when none is specified and none is in use",
  "description": "",
  "id": "current-candidate;display-current-candidate-versions-when-none-is-specified-and-none-is-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 20,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed but not default",
  "keyword": "Given "
});
formatter.step({
  "line": 21,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 22,
  "name": "I enter \"sdk current\"",
  "keyword": "When "
});
formatter.step({
  "line": 23,
  "name": "I see \"No candidates are in use\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 695997,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103301511,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk current",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100374382,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "No candidates are in use",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 58818,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nNo candidates are in use\n\n\n");
formatter.after({
  "duration": 849779,
  "status": "passed"
});
formatter.before({
  "duration": 2848867,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 26074523,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 3558054,
  "status": "passed"
});
formatter.scenario({
  "line": 25,
  "name": "Display current candidate versions when none is specified and one is in use",
  "description": "",
  "id": "current-candidate;display-current-candidate-versions-when-none-is-specified-and-one-is-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 26,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 27,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 28,
  "name": "I enter \"sdk current\"",
  "keyword": "When "
});
formatter.step({
  "line": 29,
  "name": "I see \"Using:\"",
  "keyword": "Then "
});
formatter.step({
  "line": 30,
  "name": "I see \"grails: 2.1.0\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 957888,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101672841,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk current",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100346517,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using:",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 61753,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails: 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 37349,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nUsing:\ngrails: 2.1.0\n\n\n");
formatter.after({
  "duration": 938559,
  "status": "passed"
});
formatter.before({
  "duration": 2718850,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 19383362,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2156124,
  "status": "passed"
});
formatter.scenario({
  "line": 32,
  "name": "Display current candidate versions when none is specified and multiple are in use",
  "description": "",
  "id": "current-candidate;display-current-candidate-versions-when-none-is-specified-and-multiple-are-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 33,
  "name": "the candidate \"groovy\" version \"2.0.5\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 34,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "And "
});
formatter.step({
  "line": 35,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 36,
  "name": "I enter \"sdk current\"",
  "keyword": "When "
});
formatter.step({
  "line": 37,
  "name": "I see \"Using:\"",
  "keyword": "Then "
});
formatter.step({
  "line": 38,
  "name": "I see \"grails: 2.1.0\"",
  "keyword": "And "
});
formatter.step({
  "line": 39,
  "name": "I see \"groovy: 2.0.5\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 870972,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 1267878,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101899384,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk current",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100426193,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using:",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 344066,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails: 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 88482,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy: 2.0.5",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 58657,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nUsing:\ngroovy: 2.0.5\ngrails: 2.1.0\n\n\n");
formatter.after({
  "duration": 1818121,
  "status": "passed"
});
formatter.uri("flush.feature");
formatter.feature({
  "line": 1,
  "name": "Flush",
  "description": "",
  "id": "flush",
  "keyword": "Feature"
});
formatter.before({
  "duration": 3361058,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 29581539,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2758315,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101850724,
  "status": "passed"
});
formatter.scenario({
  "line": 8,
  "name": "Flush omitting the Qualifier",
  "description": "",
  "id": "flush;flush-omitting-the-qualifier",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 9,
  "name": "I enter \"sdk flush\"",
  "keyword": "When "
});
formatter.step({
  "line": 10,
  "name": "I see \"Stop! Please specify what you want to flush.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "sdk flush",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100429551,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! Please specify what you want to flush.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 72232,
  "status": "passed"
});
formatter.write("\nOutput: \n\nStop! Please specify what you want to flush.\n\n\n");
formatter.after({
  "duration": 1319529,
  "status": "passed"
});
formatter.before({
  "duration": 4134765,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 20895578,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 3650624,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101891498,
  "status": "passed"
});
formatter.scenario({
  "line": 12,
  "name": "Clear out the Candidate List",
  "description": "",
  "id": "flush;clear-out-the-candidate-list",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 13,
  "name": "the candidate \"grails\" is known locally",
  "keyword": "Given "
});
formatter.step({
  "line": 14,
  "name": "I enter \"sdk flush candidates\"",
  "keyword": "When "
});
formatter.step({
  "line": 15,
  "name": "no candidates are know locally",
  "keyword": "Then "
});
formatter.step({
  "line": 16,
  "name": "I see \"Candidates have been flushed.\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    }
  ],
  "location": "flush_steps.groovy:5"
});
formatter.result({
  "duration": 2176640,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk flush candidates",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100625198,
  "status": "passed"
});
formatter.match({
  "location": "flush_steps.groovy:9"
});
formatter.result({
  "duration": 140966,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Candidates have been flushed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 57626,
  "status": "passed"
});
formatter.write("\nOutput: \n\nCandidates have been flushed.\n\n\n");
formatter.after({
  "duration": 1320490,
  "status": "passed"
});
formatter.before({
  "duration": 2945130,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 22774183,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1825668,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101483971,
  "status": "passed"
});
formatter.scenario({
  "line": 18,
  "name": "Clear out an uninitialised Candidate List",
  "description": "",
  "id": "flush;clear-out-an-uninitialised-candidate-list",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 19,
  "name": "I enter \"sdk flush candidates\"",
  "keyword": "Given "
});
formatter.step({
  "line": 20,
  "name": "I enter \"sdk flush candidates\"",
  "keyword": "When "
});
formatter.step({
  "line": 21,
  "name": "I see \"No candidate list found so not flushed.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "sdk flush candidates",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100434044,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk flush candidates",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100414916,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "No candidate list found so not flushed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 52624,
  "status": "passed"
});
formatter.write("\nOutput: \n\nNo candidate list found so not flushed.\n\n\n");
formatter.after({
  "duration": 966933,
  "status": "passed"
});
formatter.before({
  "duration": 3105484,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 18112050,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1876346,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101498040,
  "status": "passed"
});
formatter.scenario({
  "line": 23,
  "name": "Clean up the current Broadcast",
  "description": "",
  "id": "flush;clean-up-the-current-broadcast",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 24,
  "name": "a prior Broadcast \"This is an old broadcast\" with id \"12344\" was issued",
  "keyword": "Given "
});
formatter.step({
  "line": 25,
  "name": "I enter \"sdk flush broadcast\"",
  "keyword": "When "
});
formatter.step({
  "line": 26,
  "name": "no broadcast message can be found",
  "keyword": "Then "
});
formatter.step({
  "line": 27,
  "name": "I see \"Broadcast has been flushed.\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "This is an old broadcast",
      "offset": 19
    },
    {
      "val": "12344",
      "offset": 54
    }
  ],
  "location": "broadcast_steps.groovy:16"
});
formatter.result({
  "duration": 220286,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk flush broadcast",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100404921,
  "status": "passed"
});
formatter.match({
  "location": "flush_steps.groovy:13"
});
formatter.result({
  "duration": 160844,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Broadcast has been flushed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 57062,
  "status": "passed"
});
formatter.write("\nOutput: \n\nBroadcast has been flushed.\n\n\n");
formatter.after({
  "duration": 823744,
  "status": "passed"
});
formatter.before({
  "duration": 2452378,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 23183763,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 3813123,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101845213,
  "status": "passed"
});
formatter.scenario({
  "line": 29,
  "name": "Clean up an uninitialised Broadcast",
  "description": "",
  "id": "flush;clean-up-an-uninitialised-broadcast",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 30,
  "name": "the broadcast has been flushed",
  "keyword": "Given "
});
formatter.step({
  "line": 31,
  "name": "I enter \"sdk flush broadcast\"",
  "keyword": "When "
});
formatter.step({
  "line": 32,
  "name": "I see \"No prior broadcast found so not flushed.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "flush_steps.groovy:33"
});
formatter.result({
  "duration": 4510920,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk flush broadcast",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100361245,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "No prior broadcast found so not flushed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 85282,
  "status": "passed"
});
formatter.write("\nOutput: \n\nNo prior broadcast found so not flushed.\n\n\n");
formatter.after({
  "duration": 1604665,
  "status": "passed"
});
formatter.before({
  "duration": 3393701,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 27266489,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2487491,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102127309,
  "status": "passed"
});
formatter.scenario({
  "line": 34,
  "name": "Clean up the last known Remote Version",
  "description": "",
  "id": "flush;clean-up-the-last-known-remote-version",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 35,
  "name": "a prior version \"x.y.z\" was detected",
  "keyword": "Given "
});
formatter.step({
  "line": 36,
  "name": "I enter \"sdk flush version\"",
  "keyword": "When "
});
formatter.step({
  "line": 37,
  "name": "no version token can be found",
  "keyword": "Then "
});
formatter.step({
  "line": 38,
  "name": "I see \"Version Token has been flushed.\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "x.y.z",
      "offset": 17
    }
  ],
  "location": "flush_steps.groovy:38"
});
formatter.result({
  "duration": 438760,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk flush version",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100384015,
  "status": "passed"
});
formatter.match({
  "location": "flush_steps.groovy:43"
});
formatter.result({
  "duration": 914610,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Version Token has been flushed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 67623,
  "status": "passed"
});
formatter.write("\nOutput: \n\nVersion Token has been flushed.\n\n\n");
formatter.after({
  "duration": 1008383,
  "status": "passed"
});
formatter.before({
  "duration": 3148319,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 26442920,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2342058,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102877959,
  "status": "passed"
});
formatter.scenario({
  "line": 40,
  "name": "Clean up an uninitialised last known Remote Version",
  "description": "",
  "id": "flush;clean-up-an-uninitialised-last-known-remote-version",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 41,
  "name": "the Remote Version has been flushed",
  "keyword": "Given "
});
formatter.step({
  "line": 42,
  "name": "I enter \"sdk flush version\"",
  "keyword": "When "
});
formatter.step({
  "line": 43,
  "name": "I see \"No prior Remote Version found so not flushed.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "flush_steps.groovy:47"
});
formatter.result({
  "duration": 165240,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk flush version",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100381455,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "No prior Remote Version found so not flushed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 77587,
  "status": "passed"
});
formatter.write("\nOutput: \n\nNo prior Remote Version found so not flushed.\n\n\n");
formatter.after({
  "duration": 1047539,
  "status": "passed"
});
formatter.before({
  "duration": 5004266,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 24475045,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2902329,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103478918,
  "status": "passed"
});
formatter.scenario({
  "line": 45,
  "name": "Clear out the cached Archives",
  "description": "",
  "id": "flush;clear-out-the-cached-archives",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 46,
  "name": "the archive \"grails-1.3.9.zip\" has been cached",
  "keyword": "Given "
});
formatter.step({
  "line": 47,
  "name": "I enter \"sdk flush archives\"",
  "keyword": "When "
});
formatter.step({
  "line": 48,
  "name": "no archives are cached",
  "keyword": "Then "
});
formatter.step({
  "line": 49,
  "name": "I see \"1 archive(s) flushed\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails-1.3.9.zip",
      "offset": 13
    }
  ],
  "location": "flush_steps.groovy:17"
});
formatter.result({
  "duration": 231686,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk flush archives",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100363775,
  "status": "passed"
});
formatter.match({
  "location": "flush_steps.groovy:21"
});
formatter.result({
  "duration": 499867,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "1 archive(s) flushed",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 57753,
  "status": "passed"
});
formatter.write("\nOutput: \n\n1 archive(s) flushed, freeing 4.0K\t/tmp/sdkman-1286/.sdkman/archives.\n\n\n");
formatter.after({
  "duration": 791409,
  "status": "passed"
});
formatter.before({
  "duration": 2589468,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 17571191,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1634137,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101262834,
  "status": "passed"
});
formatter.scenario({
  "line": 51,
  "name": "Clear out the temporary space",
  "description": "",
  "id": "flush;clear-out-the-temporary-space",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 52,
  "name": "the file \"res-1.2.0.zip\" in temporary storage",
  "keyword": "Given "
});
formatter.step({
  "line": 53,
  "name": "I enter \"sdk flush temp\"",
  "keyword": "When "
});
formatter.step({
  "line": 54,
  "name": "no \"res-1.2.0.zip\" file is present in temporary storage",
  "keyword": "Then "
});
formatter.step({
  "line": 55,
  "name": "I see \"1 archive(s) flushed\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "res-1.2.0.zip",
      "offset": 10
    }
  ],
  "location": "flush_steps.groovy:25"
});
formatter.result({
  "duration": 226994,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk flush temp",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100397763,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "res-1.2.0.zip",
      "offset": 4
    }
  ],
  "location": "flush_steps.groovy:29"
});
formatter.result({
  "duration": 217310,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "1 archive(s) flushed",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 41300,
  "status": "passed"
});
formatter.write("\nOutput: \n\n1 archive(s) flushed, freeing 4.0K\t/tmp/sdkman-1286/.sdkman/tmp.\n\n\n");
formatter.after({
  "duration": 745433,
  "status": "passed"
});
formatter.uri("forced_offline_mode.feature");
formatter.feature({
  "line": 1,
  "name": "Forced Offline Mode",
  "description": "",
  "id": "forced-offline-mode",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2587082,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 3,
      "value": "#offline modes"
    }
  ],
  "line": 5,
  "name": "Enter an invalid offline mode",
  "description": "",
  "id": "forced-offline-mode;enter-an-invalid-offline-mode",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "offline mode is disabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 8,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 9,
  "name": "I enter \"sdk offline grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 10,
  "name": "I see \"Stop! grails is not a valid offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:54"
});
formatter.result({
  "duration": 4719866,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2500005,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101373652,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk offline grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100336397,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails is not a valid offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 52613,
  "status": "passed"
});
formatter.write("\nOutput: \n\nSDKMAN can\u0027t reach the internet so going offline. Re-enable online with:\n\n  $ sdk offline disable\n\n\nStop! grails is not a valid offline mode.\n\n\n");
formatter.after({
  "duration": 964979,
  "status": "passed"
});
formatter.before({
  "duration": 3430903,
  "status": "passed"
});
formatter.scenario({
  "line": 12,
  "name": "Issue Offline command without qualification",
  "description": "",
  "id": "forced-offline-mode;issue-offline-command-without-qualification",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 13,
  "name": "offline mode is disabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 14,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 15,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 16,
  "name": "I enter \"sdk offline\"",
  "keyword": "When "
});
formatter.step({
  "line": 17,
  "name": "I see \"Stop! Specify a valid offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:54"
});
formatter.result({
  "duration": 5132575,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1507457,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102020667,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk offline",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100369514,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! Specify a valid offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 55448,
  "status": "passed"
});
formatter.write("\nOutput: \n\nSDKMAN can\u0027t reach the internet so going offline. Re-enable online with:\n\n  $ sdk offline disable\n\n\nStop! Specify a valid offline mode.\n\n\n");
formatter.after({
  "duration": 855903,
  "status": "passed"
});
formatter.before({
  "duration": 2665637,
  "status": "passed"
});
formatter.scenario({
  "line": 19,
  "name": "Enable Offline Mode with internet reachable",
  "description": "",
  "id": "forced-offline-mode;enable-offline-mode-with-internet-reachable",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 20,
  "name": "offline mode is disabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 21,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 22,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 23,
  "name": "I enter \"sdk offline enable\"",
  "keyword": "When "
});
formatter.step({
  "line": 24,
  "name": "I see \"Forced offline mode enabled.\"",
  "keyword": "Then "
});
formatter.step({
  "line": 25,
  "name": "I do not see \"OFFLINE MODE ENABLED!\"",
  "keyword": "And "
});
formatter.step({
  "line": 26,
  "name": "I enter \"sdk install grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 27,
  "name": "I see \"Stop! grails 2.1.0 is not available in offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:54"
});
formatter.result({
  "duration": 5076941,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1999440,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101164465,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk offline enable",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100352680,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Forced offline mode enabled.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 56726,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "OFFLINE MODE ENABLED!",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 39959,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100352819,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails 2.1.0 is not available in offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 53456,
  "status": "passed"
});
formatter.write("\nOutput: \n\nStop! grails 2.1.0 is not available in offline mode.\n\n\n");
formatter.after({
  "duration": 1200432,
  "status": "passed"
});
formatter.before({
  "duration": 2496851,
  "status": "passed"
});
formatter.scenario({
  "line": 29,
  "name": "Disable Offline Mode with internet reachable",
  "description": "",
  "id": "forced-offline-mode;disable-offline-mode-with-internet-reachable",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 30,
  "name": "offline mode is enabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 31,
  "name": "the candidate \"grails\" version \"2.1.0\" is available for download",
  "keyword": "And "
});
formatter.step({
  "line": 32,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 33,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 34,
  "name": "I enter \"sdk offline disable\"",
  "keyword": "When "
});
formatter.step({
  "line": 35,
  "name": "I see \"Online mode re-enabled!\"",
  "keyword": "Then "
});
formatter.step({
  "line": 36,
  "name": "I enter \"sdk install grails 2.1.0\" and answer \"Y\"",
  "keyword": "When "
});
formatter.step({
  "line": 37,
  "name": "I see \"Done installing!\"",
  "keyword": "Then "
});
formatter.step({
  "line": 38,
  "name": "the candidate \"grails\" version \"2.1.0\" is installed",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:63"
});
formatter.result({
  "duration": 4463668,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 16195411,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 5557444,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101575390,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk offline disable",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100307347,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Online mode re-enabled!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 61049,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 2.1.0",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 47
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 101191333,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Done installing!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 60780,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:10"
});
formatter.result({
  "duration": 240499,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\u003chtml\u003e\n\u003chead\u003e\n\u003cmeta http-equiv\u003d\"Content-Type\" content\u003d\"text/html; charset\u003dISO-8859-1\"/\u003e\n\u003ctitle\u003eError 404 NOT_FOUND\u003c/title\u003e\n\u003c/head\u003e\n\u003cbody\u003e\u003ch2\u003eHTTP ERROR 404\u003c/h2\u003e\n\u003cp\u003eProblem accessing /__files/broadcast/latest. Reason:\n\u003cpre\u003e    NOT_FOUND\u003c/pre\u003e\u003c/p\u003e\u003chr /\u003e\u003ci\u003e\u003csmall\u003ePowered by Jetty://\u003c/small\u003e\u003c/i\u003e\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\u003cbr/\u003e                                                \n\n\u003c/body\u003e\n\u003c/html\u003e\n\nDownloading: grails 2.1.0\n\n  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current\n                                 Dload  Upload   Total   Spent    Left  Speed\n\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\n\r100   541  100   541    0     0   120k      0 --:--:-- --:--:-- --:--:--  120k\n\nInstalling: grails 2.1.0\nDone installing!\n\nDo you want grails 2.1.0 to be set as default? (Y/n): \nSetting grails 2.1.0 as default.\n\n\n");
formatter.after({
  "duration": 1022367,
  "status": "passed"
});
formatter.before({
  "duration": 2796087,
  "status": "passed"
});
formatter.scenario({
  "line": 40,
  "name": "Disable Offline Mode with internet unreachable",
  "description": "",
  "id": "forced-offline-mode;disable-offline-mode-with-internet-unreachable",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 41,
  "name": "offline mode is enabled with unreachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 42,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 43,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 44,
  "name": "I enter \"sdk offline disable\"",
  "keyword": "When "
});
formatter.step({
  "line": 45,
  "name": "I see \"Online mode re-enabled!\"",
  "keyword": "Then "
});
formatter.step({
  "line": 46,
  "name": "I enter \"sdk install grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 47,
  "name": "I see \"OFFLINE MODE ENABLED!\"",
  "keyword": "Then "
});
formatter.step({
  "line": 48,
  "name": "I see \"Stop! grails 2.1.0 is not available in offline mode.\"",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:72"
});
formatter.result({
  "duration": 132318,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 3335364,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103037520,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk offline disable",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100329228,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Online mode re-enabled!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 74862,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100304284,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "OFFLINE MODE ENABLED!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 113396,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails 2.1.0 is not available in offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 45448,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\u003d\u003d\u003d\u003d BROADCAST \u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n\nOFFLINE MODE ENABLED! Some functionality is now disabled.\n\n\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\nStop! grails 2.1.0 is not available in offline mode.\n\n\n");
formatter.after({
  "duration": 1783065,
  "status": "passed"
});
formatter.before({
  "duration": 3965241,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 50,
      "value": "#broadcast"
    }
  ],
  "line": 51,
  "name": "Recall a broadcast while Forced Offline",
  "description": "",
  "id": "forced-offline-mode;recall-a-broadcast-while-forced-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 52,
  "name": "offline mode is enabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 53,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 54,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 55,
  "name": "a prior Broadcast \"This is an OLD Broadcast!\" with id \"12344\" was issued",
  "keyword": "When "
});
formatter.step({
  "line": 56,
  "name": "I enter \"sdk broadcast\"",
  "keyword": "And "
});
formatter.step({
  "line": 57,
  "name": "I see \"This is an OLD Broadcast!\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:63"
});
formatter.result({
  "duration": 4661381,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2547136,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102969904,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is an OLD Broadcast!",
      "offset": 19
    },
    {
      "val": "12344",
      "offset": 55
    }
  ],
  "location": "broadcast_steps.groovy:16"
});
formatter.result({
  "duration": 303091,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk broadcast",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100420450,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is an OLD Broadcast!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 91921,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\u003d\u003d\u003d\u003d BROADCAST \u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n\nOFFLINE MODE ENABLED! Some functionality is now disabled.\n\n\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\nThis is an OLD Broadcast!\n\n\n");
formatter.after({
  "duration": 1608334,
  "status": "passed"
});
formatter.before({
  "duration": 2876346,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 59,
      "value": "#sdk version"
    }
  ],
  "line": 60,
  "name": "Determine the sdkman version while Forced Offline",
  "description": "",
  "id": "forced-offline-mode;determine-the-sdkman-version-while-forced-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 61,
  "name": "offline mode is enabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 62,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 63,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 64,
  "name": "I enter \"sdk version\"",
  "keyword": "When "
});
formatter.step({
  "line": 65,
  "name": "I see the current sdkman version",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:63"
});
formatter.result({
  "duration": 5070034,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1851494,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101548085,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk version",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100481633,
  "status": "passed"
});
formatter.match({
  "location": "command_line_interop_steps.groovy:27"
});
formatter.result({
  "duration": 236953,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\u003d\u003d\u003d\u003d BROADCAST \u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n\nOFFLINE MODE ENABLED! Some functionality is now disabled.\n\n\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\nSDKMAN x.y.z\n\n\n");
formatter.after({
  "duration": 1193681,
  "status": "passed"
});
formatter.before({
  "duration": 2703844,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 67,
      "value": "#list candidate version"
    }
  ],
  "line": 68,
  "name": "List candidate versions found while Forced Offline",
  "description": "",
  "id": "forced-offline-mode;list-candidate-versions-found-while-forced-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 69,
  "name": "offline mode is enabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 70,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 71,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 72,
  "name": "I enter \"sdk list grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 73,
  "name": "I see \"Offline Mode: only showing installed grails versions\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:63"
});
formatter.result({
  "duration": 5674158,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1872727,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101262658,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk list grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100329733,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Offline Mode: only showing installed grails versions",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 89544,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\u003d\u003d\u003d\u003d BROADCAST \u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n\nOFFLINE MODE ENABLED! Some functionality is now disabled.\n\n\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n------------------------------------------------------------\nOffline Mode: only showing installed grails versions\n------------------------------------------------------------\n                                                            \n   None installed!\n------------------------------------------------------------\n* - installed                                               \n\u003e - currently in use                                        \n------------------------------------------------------------\n\n\n");
formatter.after({
  "duration": 1095136,
  "status": "passed"
});
formatter.before({
  "duration": 2693467,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 75,
      "value": "#use version"
    }
  ],
  "line": 76,
  "name": "Use an uninstalled candidate version while Forced Offline",
  "description": "",
  "id": "forced-offline-mode;use-an-uninstalled-candidate-version-while-forced-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 77,
  "name": "offline mode is enabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 78,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "And "
});
formatter.step({
  "line": 79,
  "name": "the candidate \"grails\" version \"2.1.0\" is not installed",
  "keyword": "And "
});
formatter.step({
  "line": 80,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 81,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 82,
  "name": "I enter \"sdk use grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 83,
  "name": "I see \"Stop! grails 2.1.0 is not available in offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:63"
});
formatter.result({
  "duration": 5101857,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 1156129,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 494152,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1793398,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101295252,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100415851,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails 2.1.0 is not available in offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 62116,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\u003d\u003d\u003d\u003d BROADCAST \u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n\nOFFLINE MODE ENABLED! Some functionality is now disabled.\n\n\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\nStop! grails 2.1.0 is not available in offline mode.\n\n\n");
formatter.after({
  "duration": 962130,
  "status": "passed"
});
formatter.before({
  "duration": 2795942,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 85,
      "value": "#default version"
    }
  ],
  "line": 86,
  "name": "Set the default to an uninstalled candidate version while Forced Offline",
  "description": "",
  "id": "forced-offline-mode;set-the-default-to-an-uninstalled-candidate-version-while-forced-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 87,
  "name": "offline mode is enabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 88,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "And "
});
formatter.step({
  "line": 89,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 90,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 91,
  "name": "I enter \"sdk default grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 92,
  "name": "I see \"Stop! grails 2.1.0 is not available in offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:63"
});
formatter.result({
  "duration": 4937778,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 1596963,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2237697,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102774412,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk default grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100463400,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails 2.1.0 is not available in offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 75611,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\u003d\u003d\u003d\u003d BROADCAST \u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n\nOFFLINE MODE ENABLED! Some functionality is now disabled.\n\n\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\nStop! grails 2.1.0 is not available in offline mode.\n\n\n");
formatter.after({
  "duration": 1436477,
  "status": "passed"
});
formatter.before({
  "duration": 3617349,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 94,
      "value": "#install command"
    }
  ],
  "line": 95,
  "name": "Install a candidate version that is not installed while Forced Offline",
  "description": "",
  "id": "forced-offline-mode;install-a-candidate-version-that-is-not-installed-while-forced-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 96,
  "name": "offline mode is enabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 97,
  "name": "the candidate \"grails\" version \"2.1.0\" is not installed",
  "keyword": "And "
});
formatter.step({
  "line": 98,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 99,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 100,
  "name": "I enter \"sdk install grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 101,
  "name": "I see \"Stop! grails 2.1.0 is not available in offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:63"
});
formatter.result({
  "duration": 5773415,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 717832,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2403569,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103333036,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100360655,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails 2.1.0 is not available in offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 50087,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\u003d\u003d\u003d\u003d BROADCAST \u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n\nOFFLINE MODE ENABLED! Some functionality is now disabled.\n\n\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\nStop! grails 2.1.0 is not available in offline mode.\n\n\n");
formatter.after({
  "duration": 835455,
  "status": "passed"
});
formatter.before({
  "duration": 2765517,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 103,
      "value": "#uninstall command"
    }
  ],
  "line": 104,
  "name": "Uninstall a candidate version while Forced Offline",
  "description": "",
  "id": "forced-offline-mode;uninstall-a-candidate-version-while-forced-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 105,
  "name": "offline mode is enabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 106,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "And "
});
formatter.step({
  "line": 107,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 108,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 109,
  "name": "I enter \"sdk uninstall grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 110,
  "name": "the candidate \"grails\" version \"2.1.0\" is not installed",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:63"
});
formatter.result({
  "duration": 4185849,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 862895,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2165968,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101728770,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk uninstall grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100393542,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 330547,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\u003d\u003d\u003d\u003d BROADCAST \u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n\nOFFLINE MODE ENABLED! Some functionality is now disabled.\n\n\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n\nUnselecting grails 2.1.0...\n\nUninstalling grails 2.1.0...\n\n\n");
formatter.after({
  "duration": 1064374,
  "status": "passed"
});
formatter.before({
  "duration": 2463524,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 112,
      "value": "#current command"
    }
  ],
  "line": 113,
  "name": "Display the current version of a candidate while Forced Offline",
  "description": "",
  "id": "forced-offline-mode;display-the-current-version-of-a-candidate-while-forced-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 114,
  "name": "offline mode is enabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 115,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "And "
});
formatter.step({
  "line": 116,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 117,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 118,
  "name": "I enter \"sdk current grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 119,
  "name": "I see \"Using grails version 2.1.0\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:63"
});
formatter.result({
  "duration": 4066514,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 824636,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1604426,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101220807,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk current grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100330236,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 52370,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\u003d\u003d\u003d\u003d BROADCAST \u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n\nOFFLINE MODE ENABLED! Some functionality is now disabled.\n\n\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\nUsing grails version 2.1.0\n\n\n");
formatter.after({
  "duration": 874223,
  "status": "passed"
});
formatter.before({
  "duration": 3232278,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 121,
      "value": "#help command"
    }
  ],
  "line": 122,
  "name": "Request help while Forced Offline",
  "description": "",
  "id": "forced-offline-mode;request-help-while-forced-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 123,
  "name": "offline mode is enabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 124,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 125,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 126,
  "name": "I enter \"sdk help\"",
  "keyword": "When "
});
formatter.step({
  "line": 127,
  "name": "I see \"Usage: sdk \u003ccommand\u003e [candidate] [version]\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:63"
});
formatter.result({
  "duration": 4178108,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1591230,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101332195,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk help",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100390953,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Usage: sdk \u003ccommand\u003e [candidate] [version]",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 58488,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\u003d\u003d\u003d\u003d BROADCAST \u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n\nOFFLINE MODE ENABLED! Some functionality is now disabled.\n\n\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\n");
formatter.after({
  "duration": 1117910,
  "status": "passed"
});
formatter.before({
  "duration": 2459823,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 129,
      "value": "#selfupdate command"
    }
  ],
  "line": 130,
  "name": "Attempt self-update while Forced Offline",
  "description": "",
  "id": "forced-offline-mode;attempt-self-update-while-forced-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 131,
  "name": "offline mode is enabled with reachable internet",
  "keyword": "Given "
});
formatter.step({
  "line": 132,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 133,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 134,
  "name": "I enter \"sdk selfupdate\"",
  "keyword": "When "
});
formatter.step({
  "line": 135,
  "name": "I see \"This command is not available in offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:63"
});
formatter.result({
  "duration": 4626010,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2266423,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101401233,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk selfupdate",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100355919,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This command is not available in offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 50871,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\u003d\u003d\u003d\u003d BROADCAST \u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\n\nOFFLINE MODE ENABLED! Some functionality is now disabled.\n\n\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\u003d\nThis command is not available in offline mode.\n\n\n");
formatter.after({
  "duration": 802008,
  "status": "passed"
});
formatter.uri("idempotent_self_update.feature");
formatter.feature({
  "line": 1,
  "name": "Idempotent Self Update",
  "description": "",
  "id": "idempotent-self-update",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2617870,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 7,
  "name": "an available selfupdate",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 15551595,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2554677,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103943950,
  "status": "passed"
});
formatter.match({
  "location": "stub_steps.groovy:13"
});
formatter.result({
  "duration": 5395371,
  "status": "passed"
});
formatter.scenario({
  "line": 9,
  "name": "Attempt Self Update on an up to date system",
  "description": "",
  "id": "idempotent-self-update;attempt-self-update-on-an-up-to-date-system",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 10,
  "name": "I enter \"sdk selfupdate\"",
  "keyword": "When "
});
formatter.step({
  "line": 11,
  "name": "I see \"No update available at this time.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "sdk selfupdate",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 101667014,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "No update available at this time.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 86319,
  "status": "passed"
});
formatter.write("\nOutput: \n\nNo update available at this time.\n\n\n");
formatter.after({
  "duration": 953682,
  "status": "passed"
});
formatter.before({
  "duration": 3014782,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 7,
  "name": "an available selfupdate",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 16929741,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1521600,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101122588,
  "status": "passed"
});
formatter.match({
  "location": "stub_steps.groovy:13"
});
formatter.result({
  "duration": 4773233,
  "status": "passed"
});
formatter.scenario({
  "line": 13,
  "name": "Force Self Update on an up to date system",
  "description": "",
  "id": "idempotent-self-update;force-self-update-on-an-up-to-date-system",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 14,
  "name": "I enter \"sdk selfupdate force\"",
  "keyword": "When "
});
formatter.step({
  "line": 15,
  "name": "I see \"Successfully upgraded SDKMAN.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "sdk selfupdate force",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100321251,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Successfully upgraded SDKMAN.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 59911,
  "status": "passed"
});
formatter.write("\nOutput: \n\nSuccessfully upgraded SDKMAN.\n\n\n");
formatter.after({
  "duration": 778161,
  "status": "passed"
});
formatter.uri("install_candidate.feature");
formatter.feature({
  "line": 1,
  "name": "Install Candidate",
  "description": "",
  "id": "install-candidate",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2403421,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 15322113,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1528024,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101174877,
  "status": "passed"
});
formatter.scenario({
  "line": 8,
  "name": "Install a default Candidate",
  "description": "",
  "id": "install-candidate;install-a-default-candidate",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 9,
  "name": "the default \"grails\" candidate is \"2.1.0\"",
  "keyword": "Given "
});
formatter.step({
  "line": 10,
  "name": "I enter \"sdk install grails\" and answer \"Y\"",
  "keyword": "When "
});
formatter.step({
  "line": 11,
  "name": "I see \"Done installing!\"",
  "keyword": "Then "
});
formatter.step({
  "line": 12,
  "name": "the candidate \"grails\" version \"2.1.0\" is installed",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 13
    },
    {
      "val": "2.1.0",
      "offset": 35
    }
  ],
  "location": "stub_steps.groovy:8"
});
formatter.result({
  "duration": 12363401,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 41
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100442294,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Done installing!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 59543,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:10"
});
formatter.result({
  "duration": 92023,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nDownloading: grails 2.1.0\n\n  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current\n                                 Dload  Upload   Total   Spent    Left  Speed\n\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\n\r100   541  100   541    0     0   393k      0 --:--:-- --:--:-- --:--:--  393k\n\nInstalling: grails 2.1.0\nDone installing!\n\nDo you want grails 2.1.0 to be set as default? (Y/n): \nSetting grails 2.1.0 as default.\n\n\n");
formatter.after({
  "duration": 805391,
  "status": "passed"
});
formatter.before({
  "duration": 2490354,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 15534943,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2104529,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101252780,
  "status": "passed"
});
formatter.scenario({
  "line": 14,
  "name": "Install a specific Candidate",
  "description": "",
  "id": "install-candidate;install-a-specific-candidate",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 15,
  "name": "the candidate \"grails\" version \"1.3.9\" is available for download",
  "keyword": "And "
});
formatter.step({
  "line": 16,
  "name": "I enter \"sdk install grails 1.3.9\" and answer \"Y\"",
  "keyword": "When "
});
formatter.step({
  "line": 17,
  "name": "I see \"Done installing!\"",
  "keyword": "Then "
});
formatter.step({
  "line": 18,
  "name": "the candidate \"grails\" version \"1.3.9\" is installed",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 11385601,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 1.3.9",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 47
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100520114,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Done installing!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 62045,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:10"
});
formatter.result({
  "duration": 91972,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nDownloading: grails 1.3.9\n\n  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current\n                                 Dload  Upload   Total   Spent    Left  Speed\n\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\n\r100   541  100   541    0     0   430k      0 --:--:-- --:--:-- --:--:--  430k\n\nInstalling: grails 1.3.9\nDone installing!\n\nDo you want grails 1.3.9 to be set as default? (Y/n): \nSetting grails 1.3.9 as default.\n\n\n");
formatter.after({
  "duration": 879567,
  "status": "passed"
});
formatter.before({
  "duration": 2735524,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 14801452,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2746643,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102525467,
  "status": "passed"
});
formatter.scenario({
  "line": 20,
  "name": "Install a Candidate version that does not exist",
  "description": "",
  "id": "install-candidate;install-a-candidate-version-that-does-not-exist",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 21,
  "name": "the candidate \"grails\" version \"1.4.4\" is not available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 22,
  "name": "I enter \"sdk install grails 1.4.4\"",
  "keyword": "When "
});
formatter.step({
  "line": 23,
  "name": "I see \"Stop! 1.4.4 is not a valid grails version.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.4.4",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:22"
});
formatter.result({
  "duration": 3781874,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 1.4.4",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100447569,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! 1.4.4 is not a valid grails version.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 63822,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nStop! 1.4.4 is not a valid grails version.\n\n\n");
formatter.after({
  "duration": 768663,
  "status": "passed"
});
formatter.before({
  "duration": 2760699,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 16363621,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1541335,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 107731210,
  "status": "passed"
});
formatter.scenario({
  "line": 25,
  "name": "Install a Candidate version that is already installed",
  "description": "",
  "id": "install-candidate;install-a-candidate-version-that-is-already-installed",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 26,
  "name": "the candidate \"grails\" version \"1.3.9\" is available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 27,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "And "
});
formatter.step({
  "line": 28,
  "name": "I enter \"sdk install grails 1.3.9\"",
  "keyword": "When "
});
formatter.step({
  "line": 29,
  "name": "I see \"Stop! grails 1.3.9 is already installed.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 12695079,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 564361,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 1.3.9",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100342173,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails 1.3.9 is already installed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 83390,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nStop! grails 1.3.9 is already installed.\n\n\n");
formatter.after({
  "duration": 1480554,
  "status": "passed"
});
formatter.before({
  "duration": 2762800,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 14564568,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2170004,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101380329,
  "status": "passed"
});
formatter.scenario({
  "line": 31,
  "name": "Install a candidate and select to use it",
  "description": "",
  "id": "install-candidate;install-a-candidate-and-select-to-use-it",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 32,
  "name": "the candidate \"grails\" version \"2.1.0\" is available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 33,
  "name": "I enter \"sdk install grails 2.1.0\" and answer \"Y\"",
  "keyword": "When "
});
formatter.step({
  "line": 34,
  "name": "the candidate \"grails\" version \"2.1.0\" is installed",
  "keyword": "Then "
});
formatter.step({
  "line": 35,
  "name": "I see \"Done installing!\"",
  "keyword": "And "
});
formatter.step({
  "line": 36,
  "name": "I see \"Do you want grails 2.1.0 to be set as default? (Y/n)\"",
  "keyword": "And "
});
formatter.step({
  "line": 37,
  "name": "I see \"Setting grails 2.1.0 as default.\"",
  "keyword": "And "
});
formatter.step({
  "line": 38,
  "name": "the candidate \"grails\" version \"2.1.0\" should be the default",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 10803929,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 2.1.0",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 47
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100377370,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:10"
});
formatter.result({
  "duration": 104702,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Done installing!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 32301,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Do you want grails 2.1.0 to be set as default? (Y/n)",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 23431,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Setting grails 2.1.0 as default.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 38681,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:30"
});
formatter.result({
  "duration": 1353016,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nDownloading: grails 2.1.0\n\n  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current\n                                 Dload  Upload   Total   Spent    Left  Speed\n\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\n\r100   541  100   541    0     0  99302      0 --:--:-- --:--:-- --:--:-- 99302\n\nInstalling: grails 2.1.0\nDone installing!\n\nDo you want grails 2.1.0 to be set as default? (Y/n): \nSetting grails 2.1.0 as default.\n\n\n");
formatter.after({
  "duration": 1329089,
  "status": "passed"
});
formatter.before({
  "duration": 2558491,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 14515076,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1627809,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101240151,
  "status": "passed"
});
formatter.scenario({
  "line": 40,
  "name": "Install a candidate and select to use it automatically",
  "description": "",
  "id": "install-candidate;install-a-candidate-and-select-to-use-it-automatically",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 41,
  "name": "the candidate \"grails\" version \"2.1.0\" is available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 42,
  "name": "I have configured \"sdkman_auto_answer\" to \"true\"",
  "keyword": "And "
});
formatter.step({
  "line": 43,
  "name": "I enter \"sdk install grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 44,
  "name": "the candidate \"grails\" version \"2.1.0\" is installed",
  "keyword": "Then "
});
formatter.step({
  "line": 45,
  "name": "I see \"Done installing!\"",
  "keyword": "And "
});
formatter.step({
  "line": 46,
  "name": "I see \"Setting grails 2.1.0 as default.\"",
  "keyword": "And "
});
formatter.step({
  "line": 47,
  "name": "the candidate \"grails\" version \"2.1.0\" should be the default",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 14710118,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdkman_auto_answer",
      "offset": 19
    },
    {
      "val": "true",
      "offset": 43
    }
  ],
  "location": "installation_steps.groovy:78"
});
formatter.result({
  "duration": 497307,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 101224626,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:10"
});
formatter.result({
  "duration": 160064,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Done installing!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 82579,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Setting grails 2.1.0 as default.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 74881,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:30"
});
formatter.result({
  "duration": 232631,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nDownloading: grails 2.1.0\n\n  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current\n                                 Dload  Upload   Total   Spent    Left  Speed\n\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\n\r100   541  100   541    0     0  98381      0 --:--:-- --:--:-- --:--:-- 98381\n\nInstalling: grails 2.1.0\nDone installing!\n\n\nSetting grails 2.1.0 as default.\n\n\n");
formatter.after({
  "duration": 1035856,
  "status": "passed"
});
formatter.before({
  "duration": 3339831,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 20829631,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 3425348,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101264560,
  "status": "passed"
});
formatter.scenario({
  "line": 49,
  "name": "Install a candidate and do not select to use it",
  "description": "",
  "id": "install-candidate;install-a-candidate-and-do-not-select-to-use-it",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 50,
  "name": "the candidate \"grails\" version \"2.1.0\" is available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 51,
  "name": "I enter \"sdk install grails 2.1.0\" and answer \"n\"",
  "keyword": "When "
});
formatter.step({
  "line": 52,
  "name": "the candidate \"grails\" version \"2.1.0\" is installed",
  "keyword": "Then "
});
formatter.step({
  "line": 53,
  "name": "I see \"Done installing!\"",
  "keyword": "And "
});
formatter.step({
  "line": 54,
  "name": "I see \"Do you want grails 2.1.0 to be set as default? (Y/n)\"",
  "keyword": "And "
});
formatter.step({
  "line": 55,
  "name": "I do not see \"Setting grails 2.1.0 as default.\"",
  "keyword": "And "
});
formatter.step({
  "line": 56,
  "name": "the candidate \"grails\" version \"2.1.0\" should not be the default",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 14958925,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 2.1.0",
      "offset": 9
    },
    {
      "val": "n",
      "offset": 47
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100937741,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:10"
});
formatter.result({
  "duration": 136680,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Done installing!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 35521,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Do you want grails 2.1.0 to be set as default? (Y/n)",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 25015,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Setting grails 2.1.0 as default.",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 35210,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:36"
});
formatter.result({
  "duration": 1681668,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nDownloading: grails 2.1.0\n\n  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current\n                                 Dload  Upload   Total   Spent    Left  Speed\n\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\n\r100   541  100   541    0     0   104k      0 --:--:-- --:--:-- --:--:--  104k\n\nInstalling: grails 2.1.0\nDone installing!\n\nDo you want grails 2.1.0 to be set as default? (Y/n): \n\n");
formatter.after({
  "duration": 1018400,
  "status": "passed"
});
formatter.before({
  "duration": 5665312,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 19734269,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 3697939,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102811056,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 58,
      "value": "#revisit to redownload automatically"
    }
  ],
  "line": 59,
  "name": "Abort installation on download of a corrupt Candidate archive",
  "description": "",
  "id": "install-candidate;abort-installation-on-download-of-a-corrupt-candidate-archive",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 60,
  "name": "the candidate \"grails\" version \"1.3.6\" is available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 61,
  "name": "the archive for candidate \"grails\" version \"1.3.6\" is corrupt",
  "keyword": "And "
});
formatter.step({
  "line": 62,
  "name": "I enter \"sdk install grails 1.3.6\"",
  "keyword": "When "
});
formatter.step({
  "line": 63,
  "name": "I see \"Stop! The archive was corrupt and has been removed! Please try installing again.\"",
  "keyword": "Then "
});
formatter.step({
  "line": 64,
  "name": "the candidate \"grails\" version \"1.3.6\" is not installed",
  "keyword": "And "
});
formatter.step({
  "line": 65,
  "name": "the archive for candidate \"grails\" version \"1.3.6\" is removed",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.6",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 14424352,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 27
    },
    {
      "val": "1.3.6",
      "offset": 44
    }
  ],
  "location": "initialisation_steps.groovy:20"
});
formatter.result({
  "duration": 2545955,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 1.3.6",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100967742,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! The archive was corrupt and has been removed! Please try installing again.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 77009,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.6",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 348740,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 27
    },
    {
      "val": "1.3.6",
      "offset": 44
    }
  ],
  "location": "initialisation_steps.groovy:30"
});
formatter.result({
  "duration": 380909,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nDownloading: grails 1.3.6\n\n  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current\n                                 Dload  Upload   Total   Spent    Left  Speed\n\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\n\r100    31  100    31    0     0  13259      0 --:--:-- --:--:-- --:--:-- 13259\n\nStop! The archive was corrupt and has been removed! Please try installing again.\n\n\n");
formatter.after({
  "duration": 1078369,
  "status": "passed"
});
formatter.uri("list_candidate_versions.feature");
formatter.feature({
  "line": 1,
  "name": "List Candidate Versions",
  "description": "\nA dummy template to be served back that has the following information:\n* Candidate: grails\n* Current: 2.1.0\n* Versions: 2.1.0,2.1.1,2.1.2 (CSV)",
  "id": "list-candidate-versions",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2935775,
  "status": "passed"
});
formatter.background({
  "line": 8,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 9,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 10,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 16324051,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2341149,
  "status": "passed"
});
formatter.scenario({
  "line": 12,
  "name": "List an uninstalled available Version",
  "description": "",
  "id": "list-candidate-versions;list-an-uninstalled-available-version",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 13,
  "name": "I do not have a \"grails\" candidate installed",
  "keyword": "Given "
});
formatter.step({
  "line": 14,
  "name": "the candidate \"grails\" has a version list available",
  "keyword": "And "
});
formatter.step({
  "line": 15,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 16,
  "name": "I enter \"sdk list grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 17,
  "name": "I see \"Candidate: grails\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 17
    }
  ],
  "location": "installation_steps.groovy:39"
});
formatter.result({
  "duration": 7803413,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    }
  ],
  "location": "stub_steps.groovy:38"
});
formatter.result({
  "duration": 9320821,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103647689,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk list grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100332983,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Candidate: grails",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 70585,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nCandidate: grails; Versions: ; Current: \n\n\n");
formatter.after({
  "duration": 1361434,
  "status": "passed"
});
formatter.before({
  "duration": 5080865,
  "status": "passed"
});
formatter.background({
  "line": 8,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 9,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 10,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 16426881,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1673937,
  "status": "passed"
});
formatter.scenario({
  "line": 19,
  "name": "List an installed available Version not in use",
  "description": "",
  "id": "list-candidate-versions;list-an-installed-available-version-not-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 20,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed but not default",
  "keyword": "Given "
});
formatter.step({
  "line": 21,
  "name": "the candidate \"grails\" has a version list available",
  "keyword": "And "
});
formatter.step({
  "line": 22,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 23,
  "name": "I enter \"sdk list grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 24,
  "name": "I see \"Versions: 2.1.0\"",
  "keyword": "Then "
});
formatter.step({
  "line": 25,
  "name": "I do not see \"Current: 2.1.0\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 702771,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    }
  ],
  "location": "stub_steps.groovy:38"
});
formatter.result({
  "duration": 6527302,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101360030,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk list grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100327327,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Versions: 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 54584,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Current: 2.1.0",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 42869,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nCandidate: grails; Versions: 2.1.0; Current: \n\n");
formatter.after({
  "duration": 800411,
  "status": "passed"
});
formatter.before({
  "duration": 2748719,
  "status": "passed"
});
formatter.background({
  "line": 8,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 9,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 10,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 20683176,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2718895,
  "status": "passed"
});
formatter.scenario({
  "line": 27,
  "name": "List an installed available Version in use",
  "description": "",
  "id": "list-candidate-versions;list-an-installed-available-version-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 28,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 29,
  "name": "the candidate \"grails\" has a version list available",
  "keyword": "And "
});
formatter.step({
  "line": 30,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 31,
  "name": "I enter \"sdk list grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 32,
  "name": "I see \"Current: 2.1.0\"",
  "keyword": "Then "
});
formatter.step({
  "line": 33,
  "name": "I see \"Versions: 2.1.0\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 1127920,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    }
  ],
  "location": "stub_steps.groovy:38"
});
formatter.result({
  "duration": 7541572,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103820780,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk list grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100342315,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Current: 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 76988,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Versions: 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 53480,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nCandidate: grails; Versions: 2.1.0; Current: 2.1.0\n\n\n");
formatter.after({
  "duration": 1041054,
  "status": "passed"
});
formatter.before({
  "duration": 2868890,
  "status": "passed"
});
formatter.background({
  "line": 8,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 9,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 10,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 16274753,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1732376,
  "status": "passed"
});
formatter.scenario({
  "line": 35,
  "name": "List installed multiple Versions",
  "description": "",
  "id": "list-candidate-versions;list-installed-multiple-versions",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 36,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 37,
  "name": "the candidate \"grails\" version \"2.0.9\" is already installed but not default",
  "keyword": "And "
});
formatter.step({
  "line": 38,
  "name": "the candidate \"grails\" has a version list available",
  "keyword": "And "
});
formatter.step({
  "line": 39,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 40,
  "name": "I enter \"sdk list grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 41,
  "name": "I see \"Current: 2.1.0\"",
  "keyword": "Then "
});
formatter.step({
  "line": 42,
  "name": "I see \"Versions: 2.0.9,2.1.0\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 725214,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.0.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 471663,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    }
  ],
  "location": "stub_steps.groovy:38"
});
formatter.result({
  "duration": 5963568,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101397586,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk list grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100340737,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Current: 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 78166,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Versions: 2.0.9,2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 40684,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nCandidate: grails; Versions: 2.0.9,2.1.0; Current: 2.1.0\n\n\n");
formatter.after({
  "duration": 955948,
  "status": "passed"
});
formatter.before({
  "duration": 4060052,
  "status": "passed"
});
formatter.background({
  "line": 8,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 9,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 10,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 17266129,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1802466,
  "status": "passed"
});
formatter.scenario({
  "line": 44,
  "name": "List an installed local version not in use",
  "description": "",
  "id": "list-candidate-versions;list-an-installed-local-version-not-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 45,
  "name": "I have a local candidate \"grails\" version \"2.3-SNAPSHOT\" at \"/tmp/groovy-core\"",
  "keyword": "Given "
});
formatter.step({
  "line": 46,
  "name": "the candidate \"groovy\" version \"2.3-SNAPSHOT\" is already linked to \"/tmp/groovy-core\"",
  "keyword": "And "
});
formatter.step({
  "line": 47,
  "name": "the candidate \"groovy\" has a version list available",
  "keyword": "And "
});
formatter.step({
  "line": 48,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 49,
  "name": "I enter \"sdk list groovy\"",
  "keyword": "When "
});
formatter.step({
  "line": 50,
  "name": "I see \"Versions: 2.3-SNAPSHOT\"",
  "keyword": "Then "
});
formatter.step({
  "line": 51,
  "name": "I do not see \"Current: 2.3-SNAPSHOT\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 26
    },
    {
      "val": "2.3-SNAPSHOT",
      "offset": 43
    },
    {
      "val": "/tmp/groovy-core",
      "offset": 61
    }
  ],
  "location": "installation_steps.groovy:50"
});
formatter.result({
  "duration": 3107322,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.3-SNAPSHOT",
      "offset": 32
    },
    {
      "val": "/tmp/groovy-core",
      "offset": 68
    }
  ],
  "location": "installation_steps.groovy:66"
});
formatter.result({
  "duration": 1014082,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    }
  ],
  "location": "stub_steps.groovy:38"
});
formatter.result({
  "duration": 5451673,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101221578,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk list groovy",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100366292,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Versions: 2.3-SNAPSHOT",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 83669,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Current: 2.3-SNAPSHOT",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 75416,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nCandidate: groovy; Versions: 2.3-SNAPSHOT; Current: \n\n\n");
formatter.after({
  "duration": 1132024,
  "status": "passed"
});
formatter.before({
  "duration": 2675611,
  "status": "passed"
});
formatter.background({
  "line": 8,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 9,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 10,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 14181791,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1757465,
  "status": "passed"
});
formatter.scenario({
  "line": 53,
  "name": "List an installed local Version in use",
  "description": "",
  "id": "list-candidate-versions;list-an-installed-local-version-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 54,
  "name": "I have a local candidate \"groovy\" version \"2.2-SNAPSHOT\" at \"/tmp/groovy-core\"",
  "keyword": "Given "
});
formatter.step({
  "line": 55,
  "name": "the candidate \"groovy\" version \"2.2-SNAPSHOT\" is already linked to \"/tmp/groovy-core\"",
  "keyword": "And "
});
formatter.step({
  "line": 56,
  "name": "the candidate \"groovy\" version \"2.2-SNAPSHOT\" is the default",
  "keyword": "And "
});
formatter.step({
  "line": 57,
  "name": "the candidate \"groovy\" has a version list available",
  "keyword": "And "
});
formatter.step({
  "line": 58,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 59,
  "name": "I enter \"sdk list groovy\"",
  "keyword": "When "
});
formatter.step({
  "line": 60,
  "name": "I see \"Current: 2.2-SNAPSHOT\"",
  "keyword": "Then "
});
formatter.step({
  "line": 61,
  "name": "I see \"Versions: 2.2-SNAPSHOT\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 26
    },
    {
      "val": "2.2-SNAPSHOT",
      "offset": 43
    },
    {
      "val": "/tmp/groovy-core",
      "offset": 61
    }
  ],
  "location": "installation_steps.groovy:50"
});
formatter.result({
  "duration": 739396,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.2-SNAPSHOT",
      "offset": 32
    },
    {
      "val": "/tmp/groovy-core",
      "offset": 68
    }
  ],
  "location": "installation_steps.groovy:66"
});
formatter.result({
  "duration": 737544,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.2-SNAPSHOT",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:29"
});
formatter.result({
  "duration": 367900,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    }
  ],
  "location": "stub_steps.groovy:38"
});
formatter.result({
  "duration": 6571217,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101430842,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk list groovy",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100429961,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Current: 2.2-SNAPSHOT",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 75193,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Versions: 2.2-SNAPSHOT",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 42502,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nCandidate: groovy; Versions: 2.2-SNAPSHOT; Current: 2.2-SNAPSHOT\n\n\n");
formatter.after({
  "duration": 822699,
  "status": "passed"
});
formatter.uri("list_candidates.feature");
formatter.feature({
  "line": 1,
  "name": "List Candidates",
  "description": "",
  "id": "list-candidates",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2538720,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 15742655,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2127635,
  "status": "passed"
});
formatter.scenario({
  "line": 7,
  "name": "A List of Available Candidates can be viewed",
  "description": "",
  "id": "list-candidates;a-list-of-available-candidates-can-be-viewed",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 8,
  "name": "the system is bootstrapped",
  "keyword": "Given "
});
formatter.step({
  "line": 9,
  "name": "The candidate list is available",
  "keyword": "And "
});
formatter.step({
  "line": 10,
  "name": "I enter \"sdk list\"",
  "keyword": "When "
});
formatter.step({
  "line": 11,
  "name": "I see \"Candidate List\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101135154,
  "status": "passed"
});
formatter.match({
  "location": "stub_steps.groovy:46"
});
formatter.result({
  "duration": 3571144,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk list",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100375074,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Candidate List",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 53603,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nCandidate List\n\n\n");
formatter.after({
  "duration": 821616,
  "status": "passed"
});
formatter.uri("local_developement_versions.feature");
formatter.feature({
  "line": 1,
  "name": "Local Development Versions",
  "description": "",
  "id": "local-development-versions",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2472580,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 16743276,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2511606,
  "status": "passed"
});
formatter.scenario({
  "line": 7,
  "name": "Install a new local development version",
  "description": "",
  "id": "local-development-versions;install-a-new-local-development-version",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 8,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" is not available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 9,
  "name": "I have a local candidate \"groovy\" version \"2.1-SNAPSHOT\" at \"/tmp/groovy-core\"",
  "keyword": "And "
});
formatter.step({
  "line": 10,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 11,
  "name": "I enter \"sdk install groovy 2.1-SNAPSHOT /tmp/groovy-core\"",
  "keyword": "When "
});
formatter.step({
  "line": 12,
  "name": "I see \"Linking groovy 2.1-SNAPSHOT to /tmp/groovy-core\"",
  "keyword": "Then "
});
formatter.step({
  "line": 13,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" is linked to \"/tmp/groovy-core\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:22"
});
formatter.result({
  "duration": 6074490,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 26
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 43
    },
    {
      "val": "/tmp/groovy-core",
      "offset": 61
    }
  ],
  "location": "installation_steps.groovy:50"
});
formatter.result({
  "duration": 579282,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103190727,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install groovy 2.1-SNAPSHOT /tmp/groovy-core",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100301231,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Linking groovy 2.1-SNAPSHOT to /tmp/groovy-core",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 49410,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    },
    {
      "val": "/tmp/groovy-core",
      "offset": 60
    }
  ],
  "location": "installation_steps.groovy:54"
});
formatter.result({
  "duration": 603365,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nLinking groovy 2.1-SNAPSHOT to /tmp/groovy-core\nDone installing!\n\n\n\n");
formatter.after({
  "duration": 798376,
  "status": "passed"
});
formatter.before({
  "duration": 2543415,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13664064,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1417016,
  "status": "passed"
});
formatter.scenario({
  "line": 15,
  "name": "Attempt installing a local development version that already exists",
  "description": "",
  "id": "local-development-versions;attempt-installing-a-local-development-version-that-already-exists",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 16,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" is not available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 17,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" is already linked to \"/tmp/groovy-core\"",
  "keyword": "And "
});
formatter.step({
  "line": 18,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 19,
  "name": "I enter \"sdk install groovy 2.1-SNAPSHOT /tmp/groovy-core\"",
  "keyword": "When "
});
formatter.step({
  "line": 20,
  "name": "I see \"Stop! groovy 2.1-SNAPSHOT is already installed.\"",
  "keyword": "Then "
});
formatter.step({
  "line": 21,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" is linked to \"/tmp/groovy-core\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:22"
});
formatter.result({
  "duration": 3227356,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    },
    {
      "val": "/tmp/groovy-core",
      "offset": 68
    }
  ],
  "location": "installation_steps.groovy:66"
});
formatter.result({
  "duration": 656383,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101234566,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install groovy 2.1-SNAPSHOT /tmp/groovy-core",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100298429,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! groovy 2.1-SNAPSHOT is already installed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 50440,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    },
    {
      "val": "/tmp/groovy-core",
      "offset": 60
    }
  ],
  "location": "installation_steps.groovy:54"
});
formatter.result({
  "duration": 154667,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nStop! groovy 2.1-SNAPSHOT is already installed.\n\n\n");
formatter.after({
  "duration": 830318,
  "status": "passed"
});
formatter.before({
  "duration": 2543760,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 15792597,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2515657,
  "status": "passed"
});
formatter.scenario({
  "line": 23,
  "name": "Uninstall a local development version",
  "description": "",
  "id": "local-development-versions;uninstall-a-local-development-version",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 24,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" is already linked to \"/tmp/groovy-core\"",
  "keyword": "Given "
});
formatter.step({
  "line": 25,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 26,
  "name": "I enter \"sdk uninstall groovy 2.1-SNAPSHOT\"",
  "keyword": "When "
});
formatter.step({
  "line": 27,
  "name": "I see \"Uninstalling groovy 2.1-SNAPSHOT\"",
  "keyword": "Then "
});
formatter.step({
  "line": 28,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" is not installed",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    },
    {
      "val": "/tmp/groovy-core",
      "offset": 68
    }
  ],
  "location": "installation_steps.groovy:66"
});
formatter.result({
  "duration": 2232626,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103690262,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk uninstall groovy 2.1-SNAPSHOT",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100420064,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Uninstalling groovy 2.1-SNAPSHOT",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 71675,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 298259,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nUninstalling groovy 2.1-SNAPSHOT...\n\n\n");
formatter.after({
  "duration": 1017467,
  "status": "passed"
});
formatter.before({
  "duration": 2622570,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13348288,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1709142,
  "status": "passed"
});
formatter.scenario({
  "line": 30,
  "name": "Attempt uninstalling a local development version that is not installed",
  "description": "",
  "id": "local-development-versions;attempt-uninstalling-a-local-development-version-that-is-not-installed",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 31,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" is not installed",
  "keyword": "Given "
});
formatter.step({
  "line": 32,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 33,
  "name": "I enter \"sdk uninstall groovy 2.1-SNAPSHOT\"",
  "keyword": "When "
});
formatter.step({
  "line": 34,
  "name": "I see \"groovy 2.1-SNAPSHOT is not installed.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 244662,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101340976,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk uninstall groovy 2.1-SNAPSHOT",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100379953,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy 2.1-SNAPSHOT is not installed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 68023,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\ngroovy 2.1-SNAPSHOT is not installed.\n\n\n");
formatter.after({
  "duration": 843911,
  "status": "passed"
});
formatter.before({
  "duration": 2716797,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 15510239,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1645156,
  "status": "passed"
});
formatter.scenario({
  "line": 36,
  "name": "Make the local development version the default for the candidate",
  "description": "",
  "id": "local-development-versions;make-the-local-development-version-the-default-for-the-candidate",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 37,
  "name": "the candidate \"groovy\" version \"2.0.6\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 38,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" is not available for download",
  "keyword": "And "
});
formatter.step({
  "line": 39,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" is already linked to \"/tmp/groovy-core\"",
  "keyword": "And "
});
formatter.step({
  "line": 40,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 41,
  "name": "I enter \"sdk default groovy 2.1-SNAPSHOT\"",
  "keyword": "When "
});
formatter.step({
  "line": 42,
  "name": "I see \"Default groovy version set to 2.1-SNAPSHOT\"",
  "keyword": "Then "
});
formatter.step({
  "line": 43,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" should be the default",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.6",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 795040,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:22"
});
formatter.result({
  "duration": 3357420,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    },
    {
      "val": "/tmp/groovy-core",
      "offset": 68
    }
  ],
  "location": "installation_steps.groovy:66"
});
formatter.result({
  "duration": 568284,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101400057,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk default groovy 2.1-SNAPSHOT",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100382594,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Default groovy version set to 2.1-SNAPSHOT",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 66353,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:30"
});
formatter.result({
  "duration": 155242,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nDefault groovy version set to 2.1-SNAPSHOT\n\n\n");
formatter.after({
  "duration": 740968,
  "status": "passed"
});
formatter.before({
  "duration": 2480594,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13603700,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1594376,
  "status": "passed"
});
formatter.scenario({
  "line": 45,
  "name": "Use a local development version",
  "description": "",
  "id": "local-development-versions;use-a-local-development-version",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 46,
  "name": "the candidate \"groovy\" version \"2.0.6\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 47,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" is not available for download",
  "keyword": "And "
});
formatter.step({
  "line": 48,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" is already linked to \"/tmp/groovy-core\"",
  "keyword": "And "
});
formatter.step({
  "line": 49,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 50,
  "name": "I enter \"sdk use groovy 2.1-SNAPSHOT\"",
  "keyword": "When "
});
formatter.step({
  "line": 51,
  "name": "I see \"Using groovy version 2.1-SNAPSHOT in this shell\"",
  "keyword": "Then "
});
formatter.step({
  "line": 52,
  "name": "the candidate \"groovy\" version \"2.1-SNAPSHOT\" should be in use",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.6",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 516136,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:22"
});
formatter.result({
  "duration": 3598308,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    },
    {
      "val": "/tmp/groovy-core",
      "offset": 68
    }
  ],
  "location": "installation_steps.groovy:66"
});
formatter.result({
  "duration": 491282,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101285589,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use groovy 2.1-SNAPSHOT",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100381116,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using groovy version 2.1-SNAPSHOT in this shell",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 50828,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.1-SNAPSHOT",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:25"
});
formatter.result({
  "duration": 100547339,
  "status": "passed"
});
formatter.write("\nOutput: \n\nGroovy Version: 2.1-SNAPSHOT\n\n\n");
formatter.after({
  "duration": 752585,
  "status": "passed"
});
formatter.uri("mnemonics.feature");
formatter.feature({
  "line": 1,
  "name": "Mnemonics",
  "description": "",
  "id": "mnemonics",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2614994,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13220948,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1503314,
  "status": "passed"
});
formatter.scenario({
  "line": 7,
  "name": "Shortcut for listing an uninstalled available Version",
  "description": "",
  "id": "mnemonics;shortcut-for-listing-an-uninstalled-available-version",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 8,
  "name": "I do not have a \"grails\" candidate installed",
  "keyword": "Given "
});
formatter.step({
  "line": 9,
  "name": "a \"grails\" list view is available for consumption",
  "keyword": "And "
});
formatter.step({
  "line": 10,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 11,
  "name": "I enter \"sdk l grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 12,
  "name": "I see \"Available Grails Versions\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 17
    }
  ],
  "location": "installation_steps.groovy:39"
});
formatter.result({
  "duration": 170059,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 3
    }
  ],
  "location": "stub_steps.groovy:26"
});
formatter.result({
  "duration": 3404076,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101145301,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk l grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100364168,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Available Grails Versions",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 55672,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nAvailable Grails Versions\n\n\n");
formatter.after({
  "duration": 789984,
  "status": "passed"
});
formatter.before({
  "duration": 2396990,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12494644,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1594475,
  "status": "passed"
});
formatter.scenario({
  "line": 14,
  "name": "Alternate shortcut for listing uninstalled available Version",
  "description": "",
  "id": "mnemonics;alternate-shortcut-for-listing-uninstalled-available-version",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 15,
  "name": "I do not have a \"grails\" candidate installed",
  "keyword": "Given "
});
formatter.step({
  "line": 16,
  "name": "a \"grails\" list view is available for consumption",
  "keyword": "And "
});
formatter.step({
  "line": 17,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 18,
  "name": "I enter \"sdk ls grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 19,
  "name": "I see \"Available Grails Versions\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 17
    }
  ],
  "location": "installation_steps.groovy:39"
});
formatter.result({
  "duration": 125529,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 3
    }
  ],
  "location": "stub_steps.groovy:26"
});
formatter.result({
  "duration": 4179769,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103024598,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk ls grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100386386,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Available Grails Versions",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 70769,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nAvailable Grails Versions\n\n\n");
formatter.after({
  "duration": 1303937,
  "status": "passed"
});
formatter.before({
  "duration": 2517690,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 15511961,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2344417,
  "status": "passed"
});
formatter.scenario({
  "line": 21,
  "name": "Shortcut for asking help",
  "description": "",
  "id": "mnemonics;shortcut-for-asking-help",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 22,
  "name": "the system is bootstrapped",
  "keyword": "Given "
});
formatter.step({
  "line": 23,
  "name": "I enter \"sdk h\"",
  "keyword": "When "
});
formatter.step({
  "line": 24,
  "name": "I see \"Usage: sdk \u003ccommand\u003e [candidate] [version]\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103784546,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk h",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100366408,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Usage: sdk \u003ccommand\u003e [candidate] [version]",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 52201,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\n");
formatter.after({
  "duration": 970999,
  "status": "passed"
});
formatter.before({
  "duration": 2800922,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12463622,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1554466,
  "status": "passed"
});
formatter.scenario({
  "line": 26,
  "name": "Shortcut for displaying current Candidate Version in use",
  "description": "",
  "id": "mnemonics;shortcut-for-displaying-current-candidate-version-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 27,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 28,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 29,
  "name": "I enter \"sdk c grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 30,
  "name": "I see \"Using grails version 1.3.9\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 449541,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101108791,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk c grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100336615,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 1.3.9",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 56136,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nUsing grails version 1.3.9\n\n\n");
formatter.after({
  "duration": 742005,
  "status": "passed"
});
formatter.before({
  "duration": 2410830,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12819438,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1490634,
  "status": "passed"
});
formatter.scenario({
  "line": 32,
  "name": "Shortcut for displaying current Candidate Versions",
  "description": "",
  "id": "mnemonics;shortcut-for-displaying-current-candidate-versions",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 33,
  "name": "the candidate \"groovy\" version \"2.0.5\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 34,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "And "
});
formatter.step({
  "line": 35,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 36,
  "name": "I enter \"sdk c\"",
  "keyword": "When "
});
formatter.step({
  "line": 37,
  "name": "I see \"Using:\"",
  "keyword": "Then "
});
formatter.step({
  "line": 38,
  "name": "I see \"grails: 2.1.0\"",
  "keyword": "And "
});
formatter.step({
  "line": 39,
  "name": "I see \"groovy: 2.0.5\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 453585,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 693737,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101075882,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk c",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100350564,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using:",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 60742,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails: 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 28461,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy: 2.0.5",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 20449,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nUsing:\ngroovy: 2.0.5\ngrails: 2.1.0\n\n\n");
formatter.after({
  "duration": 730795,
  "status": "passed"
});
formatter.before({
  "duration": 2505002,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 15719625,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2014633,
  "status": "passed"
});
formatter.scenario({
  "line": 41,
  "name": "Shortcut for displaying outdated Candidate Version in use",
  "description": "",
  "id": "mnemonics;shortcut-for-displaying-outdated-candidate-version-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 42,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 43,
  "name": "the default \"grails\" candidate is \"2.4.4\"",
  "keyword": "And "
});
formatter.step({
  "line": 44,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 45,
  "name": "I enter \"sdk o grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 46,
  "name": "I see \"Outdated:\"",
  "keyword": "Then "
});
formatter.step({
  "line": 47,
  "name": "I see \"grails (1.3.9 \u003c 2.4.4)\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 922090,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 13
    },
    {
      "val": "2.4.4",
      "offset": 35
    }
  ],
  "location": "stub_steps.groovy:8"
});
formatter.result({
  "duration": 12549403,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102875885,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk o grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100327831,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Outdated:",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 57070,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails (1.3.9 \u003c 2.4.4)",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 21834,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nOutdated:\ngrails (1.3.9 \u003c 2.4.4)\n\n\n");
formatter.after({
  "duration": 732870,
  "status": "passed"
});
formatter.before({
  "duration": 2594629,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12716026,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1533649,
  "status": "passed"
});
formatter.scenario({
  "line": 49,
  "name": "Shortcut for displaying outdated Candidate Versions",
  "description": "",
  "id": "mnemonics;shortcut-for-displaying-outdated-candidate-versions",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 50,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 51,
  "name": "the default \"grails\" candidate is \"2.4.4\"",
  "keyword": "And "
});
formatter.step({
  "line": 52,
  "name": "the candidate \"groovy\" version \"2.0.5\" is already installed and default",
  "keyword": "And "
});
formatter.step({
  "line": 53,
  "name": "the default \"groovy\" candidate is \"2.4.1\"",
  "keyword": "And "
});
formatter.step({
  "line": 54,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 55,
  "name": "I enter \"sdk o\"",
  "keyword": "When "
});
formatter.step({
  "line": 56,
  "name": "I see \"Outdated:\"",
  "keyword": "Then "
});
formatter.step({
  "line": 57,
  "name": "I see \"grails (1.3.9 \u003c 2.4.4)\"",
  "keyword": "And "
});
formatter.step({
  "line": 58,
  "name": "I see \"groovy (2.0.5 \u003c 2.4.1)\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 448042,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 13
    },
    {
      "val": "2.4.4",
      "offset": 35
    }
  ],
  "location": "stub_steps.groovy:8"
});
formatter.result({
  "duration": 11429360,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 467959,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 13
    },
    {
      "val": "2.4.1",
      "offset": 35
    }
  ],
  "location": "stub_steps.groovy:8"
});
formatter.result({
  "duration": 17901828,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101135358,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk o",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100355314,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Outdated:",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 73280,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails (1.3.9 \u003c 2.4.4)",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 26191,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy (2.0.5 \u003c 2.4.1)",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 53508,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nOutdated:\ngroovy (2.0.5 \u003c 2.4.1)\ngrails (1.3.9 \u003c 2.4.4)\n\n\n");
formatter.after({
  "duration": 1180207,
  "status": "passed"
});
formatter.before({
  "duration": 2559262,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13861660,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2691266,
  "status": "passed"
});
formatter.scenario({
  "line": 60,
  "name": "Shortcut for installing a Candidate Version",
  "description": "",
  "id": "mnemonics;shortcut-for-installing-a-candidate-version",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 61,
  "name": "the candidate \"grails\" version \"2.1.0\" is not installed",
  "keyword": "Given "
});
formatter.step({
  "line": 62,
  "name": "the candidate \"grails\" version \"2.1.0\" is available for download",
  "keyword": "And "
});
formatter.step({
  "line": 63,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 64,
  "name": "I enter \"sdk i grails 2.1.0\" and answer \"Y\"",
  "keyword": "When "
});
formatter.step({
  "line": 65,
  "name": "I see \"Installing: grails 2.1.0\"",
  "keyword": "Then "
});
formatter.step({
  "line": 66,
  "name": "the candidate \"grails\" version \"2.1.0\" is installed",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 316645,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 12597816,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101105947,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk i grails 2.1.0",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 41
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100400877,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Installing: grails 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 77028,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:10"
});
formatter.result({
  "duration": 97033,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nDownloading: grails 2.1.0\n\n  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current\n                                 Dload  Upload   Total   Spent    Left  Speed\n\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\n\r100   541  100   541    0     0   450k      0 --:--:-- --:--:-- --:--:--  450k\n\nInstalling: grails 2.1.0\nDone installing!\n\nDo you want grails 2.1.0 to be set as default? (Y/n): \nSetting grails 2.1.0 as default.\n\n\n");
formatter.after({
  "duration": 777882,
  "status": "passed"
});
formatter.before({
  "duration": 3031531,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12924954,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1415575,
  "status": "passed"
});
formatter.scenario({
  "line": 68,
  "name": "Shortcut for uninstalling a Candidate Version",
  "description": "",
  "id": "mnemonics;shortcut-for-uninstalling-a-candidate-version",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 69,
  "name": "the candidate \"groovy\" version \"2.0.5\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 70,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 71,
  "name": "I enter \"sdk rm groovy 2.0.5\"",
  "keyword": "When "
});
formatter.step({
  "line": 72,
  "name": "I see \"Uninstalling groovy 2.0.5\"",
  "keyword": "Then "
});
formatter.step({
  "line": 73,
  "name": "the candidate \"groovy\" version \"2.0.5\" is not installed",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 483306,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101280436,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk rm groovy 2.0.5",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100377285,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Uninstalling groovy 2.0.5",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 54792,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 441321,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nUnselecting groovy 2.0.5...\n\nUninstalling groovy 2.0.5...\n\n\n");
formatter.after({
  "duration": 829884,
  "status": "passed"
});
formatter.before({
  "duration": 2735124,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 15057137,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1605589,
  "status": "passed"
});
formatter.scenario({
  "line": 75,
  "name": "Shortcut for showing the current Version of sdkman",
  "description": "",
  "id": "mnemonics;shortcut-for-showing-the-current-version-of-sdkman",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 76,
  "name": "the system is bootstrapped",
  "keyword": "Given "
});
formatter.step({
  "line": 77,
  "name": "I enter \"sdk v\"",
  "keyword": "When "
});
formatter.step({
  "line": 78,
  "name": "I see \"SDKMAN x.y.z\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101146389,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk v",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100353967,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "SDKMAN x.y.z",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 54286,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nSDKMAN x.y.z\n\n\n");
formatter.after({
  "duration": 928827,
  "status": "passed"
});
formatter.before({
  "duration": 2532420,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13069328,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1974116,
  "status": "passed"
});
formatter.scenario({
  "line": 80,
  "name": "Shortcut for using a candidate version that is installed",
  "description": "",
  "id": "mnemonics;shortcut-for-using-a-candidate-version-that-is-installed",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 81,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 82,
  "name": "the candidate \"grails\" version \"2.1.0\" is a valid candidate version",
  "keyword": "And "
});
formatter.step({
  "line": 83,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed but not default",
  "keyword": "And "
});
formatter.step({
  "line": 84,
  "name": "the candidate \"grails\" version \"1.3.9\" is a valid candidate version",
  "keyword": "And "
});
formatter.step({
  "line": 85,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 86,
  "name": "I enter \"sdk u grails 1.3.9\"",
  "keyword": "When "
});
formatter.step({
  "line": 87,
  "name": "I see \"Using grails version 1.3.9 in this shell.\"",
  "keyword": "Then "
});
formatter.step({
  "line": 88,
  "name": "the candidate \"grails\" version \"1.3.9\" should be in use",
  "keyword": "Then "
});
formatter.step({
  "line": 89,
  "name": "the candidate \"grails\" version \"2.1.0\" should be the default",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 709545,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:30"
});
formatter.result({
  "duration": 3836045,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 886699,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:30"
});
formatter.result({
  "duration": 5174216,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101751126,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk u grails 1.3.9",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100299626,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 1.3.9 in this shell.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 96820,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:25"
});
formatter.result({
  "duration": 100376142,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:30"
});
formatter.result({
  "duration": 217512,
  "status": "passed"
});
formatter.write("\nOutput: \n\nGrails Version: 1.3.9\n\n\n");
formatter.after({
  "duration": 733030,
  "status": "passed"
});
formatter.before({
  "duration": 2532358,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 14239375,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1598001,
  "status": "passed"
});
formatter.scenario({
  "line": 91,
  "name": "Shortcut for defaulting a Candidate Version that is installed and not default",
  "description": "",
  "id": "mnemonics;shortcut-for-defaulting-a-candidate-version-that-is-installed-and-not-default",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 92,
  "name": "the candidate \"groovy\" version \"2.0.5\" is already installed but not default",
  "keyword": "Given "
});
formatter.step({
  "line": 93,
  "name": "the candidate \"groovy\" version \"2.0.5\" is a valid candidate version",
  "keyword": "And "
});
formatter.step({
  "line": 94,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 95,
  "name": "I enter \"sdk d groovy 2.0.5\"",
  "keyword": "When "
});
formatter.step({
  "line": 96,
  "name": "I see \"Default groovy version set to 2.0.5\"",
  "keyword": "Then "
});
formatter.step({
  "line": 97,
  "name": "the candidate \"groovy\" version \"2.0.5\" should be the default",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 582654,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:30"
});
formatter.result({
  "duration": 3941958,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101464151,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk d groovy 2.0.5",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100387854,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Default groovy version set to 2.0.5",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 51975,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:30"
});
formatter.result({
  "duration": 134369,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nDefault groovy version set to 2.0.5\n\n\n");
formatter.after({
  "duration": 705919,
  "status": "passed"
});
formatter.before({
  "duration": 2918467,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12609539,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2307692,
  "status": "passed"
});
formatter.scenario({
  "line": 99,
  "name": "Shortcut for a Broadcast command issued",
  "description": "",
  "id": "mnemonics;shortcut-for-a-broadcast-command-issued",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 100,
  "name": "no prior Broadcast was received",
  "keyword": "Given "
});
formatter.step({
  "line": 101,
  "name": "a new Broadcast \"This is a LIVE Broadcast!\" with id \"12345\" is available",
  "keyword": "And "
});
formatter.step({
  "line": 102,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 103,
  "name": "I enter \"sdk b\"",
  "keyword": "When "
});
formatter.step({
  "line": 104,
  "name": "I see \"This is a LIVE Broadcast!\"",
  "keyword": "Then "
});
formatter.match({
  "location": "broadcast_steps.groovy:6"
});
formatter.result({
  "duration": 104722,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is a LIVE Broadcast!",
      "offset": 17
    },
    {
      "val": "12345",
      "offset": 53
    }
  ],
  "location": "broadcast_steps.groovy:11"
});
formatter.result({
  "duration": 7832938,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101888030,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk b",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100348695,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is a LIVE Broadcast!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 45533,
  "status": "passed"
});
formatter.write("\nOutput: \n\nThis is a LIVE Broadcast!\nThis is a LIVE Broadcast!\n\n\n");
formatter.after({
  "duration": 752964,
  "status": "passed"
});
formatter.uri("offline_mode.feature");
formatter.feature({
  "line": 1,
  "name": "Offline Mode",
  "description": "",
  "id": "offline-mode",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2301274,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 91272,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1559557,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 7,
      "value": "# list command"
    }
  ],
  "line": 9,
  "name": "List candidate versions found while Offline",
  "description": "",
  "id": "offline-mode;list-candidate-versions-found-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 10,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 11,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed but not default",
  "keyword": "And "
});
formatter.step({
  "line": 12,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 13,
  "name": "I enter \"sdk list grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 14,
  "name": "I see \"Offline Mode: only showing installed grails versions\"",
  "keyword": "Then "
});
formatter.step({
  "line": 15,
  "name": "I see \"\u003e 2.1.0\"",
  "keyword": "And "
});
formatter.step({
  "line": 16,
  "name": "I see \"* 1.3.9\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 458439,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 318396,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102848581,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk list grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100491765,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Offline Mode: only showing installed grails versions",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 50085,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "\u003e 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 27178,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "* 1.3.9",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 22660,
  "status": "passed"
});
formatter.write("\nOutput: \n\n------------------------------------------------------------\nOffline Mode: only showing installed grails versions\n------------------------------------------------------------\n                                                            \n * 1.3.9\n \u003e 2.1.0\n------------------------------------------------------------\n* - installed                                               \n\u003e - currently in use                                        \n------------------------------------------------------------\n\n\n");
formatter.after({
  "duration": 706312,
  "status": "passed"
});
formatter.before({
  "duration": 2422028,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 27159,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1428102,
  "status": "passed"
});
formatter.scenario({
  "line": 18,
  "name": "List candidate versions not found while Offline",
  "description": "",
  "id": "offline-mode;list-candidate-versions-not-found-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 19,
  "name": "the system is bootstrapped",
  "keyword": "Given "
});
formatter.step({
  "line": 20,
  "name": "I enter \"sdk list grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 21,
  "name": "I see \"Offline Mode: only showing installed grails versions\"",
  "keyword": "Then "
});
formatter.step({
  "line": 22,
  "name": "I see \"None installed!\"",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 104073866,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk list grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100378126,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Offline Mode: only showing installed grails versions",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 59378,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "None installed!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 33131,
  "status": "passed"
});
formatter.write("\nOutput: \n\n------------------------------------------------------------\nOffline Mode: only showing installed grails versions\n------------------------------------------------------------\n                                                            \n   None installed!\n------------------------------------------------------------\n* - installed                                               \n\u003e - currently in use                                        \n------------------------------------------------------------\n\n\n");
formatter.after({
  "duration": 751517,
  "status": "passed"
});
formatter.before({
  "duration": 2334502,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 33701,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1436653,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 24,
      "value": "# use command"
    }
  ],
  "line": 26,
  "name": "Use the default candidate version while Offline",
  "description": "",
  "id": "offline-mode;use-the-default-candidate-version-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 27,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 28,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed but not default",
  "keyword": "And "
});
formatter.step({
  "line": 29,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 30,
  "name": "I enter \"sdk use grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 31,
  "name": "I see \"Using grails version 2.1.0 in this shell.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 482639,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 387342,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101073544,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100360099,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 2.1.0 in this shell.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 44927,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\nUsing grails version 2.1.0 in this shell.\n\n\n");
formatter.after({
  "duration": 743641,
  "status": "passed"
});
formatter.before({
  "duration": 2398794,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 29744,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1410378,
  "status": "passed"
});
formatter.scenario({
  "line": 33,
  "name": "Use the default candidate version when non selected while Offline",
  "description": "",
  "id": "offline-mode;use-the-default-candidate-version-when-non-selected-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 34,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed but not default",
  "keyword": "Given "
});
formatter.step({
  "line": 35,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed but not default",
  "keyword": "And "
});
formatter.step({
  "line": 36,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 37,
  "name": "I enter \"sdk use grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 38,
  "name": "I see \"This command is not available in offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 428618,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 353114,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101233678,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100258023,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This command is not available in offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 53479,
  "status": "passed"
});
formatter.write("\nOutput: \n\nThis command is not available in offline mode.\n\n\n");
formatter.after({
  "duration": 786572,
  "status": "passed"
});
formatter.before({
  "duration": 2493737,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 30750,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1480438,
  "status": "passed"
});
formatter.scenario({
  "line": 40,
  "name": "Use an uninstalled candidate version while Offline",
  "description": "",
  "id": "offline-mode;use-an-uninstalled-candidate-version-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 41,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 42,
  "name": "the candidate \"grails\" version \"2.1.0\" is not installed",
  "keyword": "And "
});
formatter.step({
  "line": 43,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 44,
  "name": "I enter \"sdk use grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 45,
  "name": "I see \"Stop! grails 2.1.0 is not available in offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 431521,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 232780,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101104349,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100337609,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails 2.1.0 is not available in offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 63543,
  "status": "passed"
});
formatter.write("\nOutput: \n\nStop! grails 2.1.0 is not available in offline mode.\n\n\n");
formatter.after({
  "duration": 862143,
  "status": "passed"
});
formatter.before({
  "duration": 2421240,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 29844,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1549335,
  "status": "passed"
});
formatter.scenario({
  "line": 47,
  "name": "Use an invalid candidate version while Offline",
  "description": "",
  "id": "offline-mode;use-an-invalid-candidate-version-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 48,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 49,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 50,
  "name": "I enter \"sdk use grails 9.9.9\"",
  "keyword": "When "
});
formatter.step({
  "line": 51,
  "name": "I see \"Stop! grails 9.9.9 is not available in offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 580297,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101131927,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails 9.9.9",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100287898,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails 9.9.9 is not available in offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 47121,
  "status": "passed"
});
formatter.write("\nOutput: \n\nStop! grails 9.9.9 is not available in offline mode.\n\n\n");
formatter.after({
  "duration": 726496,
  "status": "passed"
});
formatter.before({
  "duration": 2392040,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 32681,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1418091,
  "status": "passed"
});
formatter.scenario({
  "line": 53,
  "name": "Use an installed candidate version while Offline",
  "description": "",
  "id": "offline-mode;use-an-installed-candidate-version-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 54,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 55,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed but not default",
  "keyword": "And "
});
formatter.step({
  "line": 56,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 57,
  "name": "I enter \"sdk use grails 1.3.9\"",
  "keyword": "When "
});
formatter.step({
  "line": 58,
  "name": "I see \"Using grails version 1.3.9 in this shell.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 424171,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 340705,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101685783,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails 1.3.9",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100311202,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 1.3.9 in this shell.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 47245,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\nUsing grails version 1.3.9 in this shell.\n\n\n");
formatter.after({
  "duration": 742341,
  "status": "passed"
});
formatter.before({
  "duration": 2558548,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 29933,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1378546,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 60,
      "value": "# default command"
    }
  ],
  "line": 62,
  "name": "Set the default to an uninstalled candidate version while Offline",
  "description": "",
  "id": "offline-mode;set-the-default-to-an-uninstalled-candidate-version-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 63,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 64,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 65,
  "name": "I enter \"sdk default grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 66,
  "name": "I see \"Stop! grails 2.1.0 is not available in offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 422663,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101178326,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk default grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100324589,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails 2.1.0 is not available in offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 50806,
  "status": "passed"
});
formatter.write("\nOutput: \n\nStop! grails 2.1.0 is not available in offline mode.\n\n\n");
formatter.after({
  "duration": 784658,
  "status": "passed"
});
formatter.before({
  "duration": 2400588,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 28216,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1431879,
  "status": "passed"
});
formatter.scenario({
  "line": 68,
  "name": "Set the default to an invalid candidate version while Offline",
  "description": "",
  "id": "offline-mode;set-the-default-to-an-invalid-candidate-version-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 69,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 70,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 71,
  "name": "I enter \"sdk default grails 999\"",
  "keyword": "When "
});
formatter.step({
  "line": 72,
  "name": "I see \"Stop! grails 999 is not available in offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 475466,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101140871,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk default grails 999",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100284907,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails 999 is not available in offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 48079,
  "status": "passed"
});
formatter.write("\nOutput: \n\nStop! grails 999 is not available in offline mode.\n\n\n");
formatter.after({
  "duration": 750989,
  "status": "passed"
});
formatter.before({
  "duration": 2460689,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 42973,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1651452,
  "status": "passed"
});
formatter.scenario({
  "line": 74,
  "name": "Set the default to an installed candidate version while Offline",
  "description": "",
  "id": "offline-mode;set-the-default-to-an-installed-candidate-version-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 75,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 76,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed but not default",
  "keyword": "And "
});
formatter.step({
  "line": 77,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 78,
  "name": "I enter \"sdk default grails 1.3.9\"",
  "keyword": "When "
});
formatter.step({
  "line": 79,
  "name": "I see \"Default grails version set to 1.3.9\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 566418,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 603580,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102144257,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk default grails 1.3.9",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100341928,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Default grails version set to 1.3.9",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 53789,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\nDefault grails version set to 1.3.9\n\n\n");
formatter.after({
  "duration": 967581,
  "status": "passed"
});
formatter.before({
  "duration": 2441981,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 35554,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1474656,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 81,
      "value": "# install command"
    }
  ],
  "line": 82,
  "name": "Install a candidate version that is not installed while Offline",
  "description": "",
  "id": "offline-mode;install-a-candidate-version-that-is-not-installed-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 83,
  "name": "the candidate \"grails\" version \"2.1.0\" is not installed",
  "keyword": "Given "
});
formatter.step({
  "line": 84,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 85,
  "name": "I enter \"sdk install grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 86,
  "name": "I see \"Stop! grails 2.1.0 is not available in offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 260622,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102105223,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100352784,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails 2.1.0 is not available in offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 49206,
  "status": "passed"
});
formatter.write("\nOutput: \n\nStop! grails 2.1.0 is not available in offline mode.\n\n\n");
formatter.after({
  "duration": 758888,
  "status": "passed"
});
formatter.before({
  "duration": 2356662,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 29331,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1465810,
  "status": "passed"
});
formatter.scenario({
  "line": 88,
  "name": "Install a candidate version that is already installed while Offline",
  "description": "",
  "id": "offline-mode;install-a-candidate-version-that-is-already-installed-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 89,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 90,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 91,
  "name": "I enter \"sdk install grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 92,
  "name": "I see \"Stop! grails 2.1.0 is already installed.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 426464,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101360983,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100312008,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails 2.1.0 is already installed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 43549,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\nStop! grails 2.1.0 is already installed.\n\n\n");
formatter.after({
  "duration": 742219,
  "status": "passed"
});
formatter.before({
  "duration": 2423291,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 31431,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2209955,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 94,
      "value": "# uninstall command"
    }
  ],
  "line": 95,
  "name": "Uninstall a candidate version while Offline",
  "description": "",
  "id": "offline-mode;uninstall-a-candidate-version-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 96,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 97,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 98,
  "name": "I enter \"sdk uninstall grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 99,
  "name": "I see \"Unselecting grails 2.1.0...\"",
  "keyword": "Then "
});
formatter.step({
  "line": 100,
  "name": "I see \"Uninstalling grails 2.1.0...\"",
  "keyword": "And "
});
formatter.step({
  "line": 101,
  "name": "the candidate \"grails\" version \"2.1.0\" is not in use",
  "keyword": "And "
});
formatter.step({
  "line": 102,
  "name": "the candidate \"grails\" version \"2.1.0\" is not installed",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 627096,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101135780,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk uninstall grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100258992,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Unselecting grails 2.1.0...",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 64434,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Uninstalling grails 2.1.0...",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 29385,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:16"
});
formatter.result({
  "duration": 219007,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 185061,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\nUnselecting grails 2.1.0...\n\nUninstalling grails 2.1.0...\n\n\n");
formatter.after({
  "duration": 762076,
  "status": "passed"
});
formatter.before({
  "duration": 2260816,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 26969,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1330944,
  "status": "passed"
});
formatter.scenario({
  "line": 104,
  "name": "Uninstall a candidate version that is not installed while Offline",
  "description": "",
  "id": "offline-mode;uninstall-a-candidate-version-that-is-not-installed-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 105,
  "name": "the candidate \"grails\" version \"2.1.0\" is not installed",
  "keyword": "Given "
});
formatter.step({
  "line": 106,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 107,
  "name": "I enter \"sdk uninstall grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 108,
  "name": "I see \"grails 2.1.0 is not installed.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 191898,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101111041,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk uninstall grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100304709,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails 2.1.0 is not installed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 64986,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\ngrails 2.1.0 is not installed.\n\n\n");
formatter.after({
  "duration": 790549,
  "status": "passed"
});
formatter.before({
  "duration": 2308240,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 34467,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1434338,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 110,
      "value": "# current command"
    }
  ],
  "line": 111,
  "name": "Display the current version of a candidate while Offline",
  "description": "",
  "id": "offline-mode;display-the-current-version-of-a-candidate-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 112,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 113,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 114,
  "name": "I enter \"sdk current grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 115,
  "name": "I see \"Using grails version 2.1.0\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 392267,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101214528,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk current grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100330404,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 52158,
  "status": "passed"
});
formatter.write("\nOutput: \n\nUsing grails version 2.1.0\n\n\n");
formatter.after({
  "duration": 716904,
  "status": "passed"
});
formatter.before({
  "duration": 2495410,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 287781,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1470006,
  "status": "passed"
});
formatter.scenario({
  "line": 117,
  "name": "Display the current version of all candidates while Offline",
  "description": "",
  "id": "offline-mode;display-the-current-version-of-all-candidates-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 118,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 119,
  "name": "the candidate \"groovy\" version \"2.0.5\" is already installed and default",
  "keyword": "And "
});
formatter.step({
  "line": 120,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 121,
  "name": "I enter \"sdk current\"",
  "keyword": "When "
});
formatter.step({
  "line": 122,
  "name": "I see \"Using:\"",
  "keyword": "Then "
});
formatter.step({
  "line": 123,
  "name": "I see \"grails: 2.1.0\"",
  "keyword": "And "
});
formatter.step({
  "line": 124,
  "name": "I see \"groovy: 2.0.5\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 397584,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 300379,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101075467,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk current",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100371196,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using:",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 63258,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails: 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 31388,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy: 2.0.5",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 28153,
  "status": "passed"
});
formatter.write("\nOutput: \n\nUsing:\ngroovy: 2.0.5\ngrails: 2.1.0\n\n\n");
formatter.after({
  "duration": 751104,
  "status": "passed"
});
formatter.before({
  "duration": 2379649,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 50336,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1369679,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 126,
      "value": "# version command"
    }
  ],
  "line": 127,
  "name": "Determine the sdkman version when Offline",
  "description": "",
  "id": "offline-mode;determine-the-sdkman-version-when-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 128,
  "name": "the system is bootstrapped",
  "keyword": "Given "
});
formatter.step({
  "line": 129,
  "name": "I enter \"sdk version\"",
  "keyword": "When "
});
formatter.step({
  "line": 130,
  "name": "I see the current sdkman version",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101284226,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk version",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100322597,
  "status": "passed"
});
formatter.match({
  "location": "command_line_interop_steps.groovy:27"
});
formatter.result({
  "duration": 33774,
  "status": "passed"
});
formatter.write("\nOutput: \n\nSDKMAN x.y.z\n\n\n");
formatter.after({
  "duration": 785039,
  "status": "passed"
});
formatter.before({
  "duration": 2299050,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 24961,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1369595,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 132,
      "value": "# broadcast command"
    }
  ],
  "line": 133,
  "name": "Recall a broadcast while Offline",
  "description": "",
  "id": "offline-mode;recall-a-broadcast-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 134,
  "name": "a prior Broadcast \"This is an OLD Broadcast!\" with id \"12344\" was issued",
  "keyword": "Given "
});
formatter.step({
  "line": 135,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 136,
  "name": "I enter \"sdk broadcast\"",
  "keyword": "When "
});
formatter.step({
  "line": 137,
  "name": "I see \"This is an OLD Broadcast!\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "This is an OLD Broadcast!",
      "offset": 19
    },
    {
      "val": "12344",
      "offset": 55
    }
  ],
  "location": "broadcast_steps.groovy:16"
});
formatter.result({
  "duration": 204773,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102650889,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk broadcast",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 104774337,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This is an OLD Broadcast!",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 84371,
  "status": "passed"
});
formatter.write("\nOutput: \n\nThis is an OLD Broadcast!\n\n\n");
formatter.after({
  "duration": 830794,
  "status": "passed"
});
formatter.before({
  "duration": 2308099,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 25543,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1366939,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 139,
      "value": "# help command"
    }
  ],
  "line": 140,
  "name": "Request help while Offline",
  "description": "",
  "id": "offline-mode;request-help-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 141,
  "name": "the system is bootstrapped",
  "keyword": "Given "
});
formatter.step({
  "line": 142,
  "name": "I enter \"sdk help\"",
  "keyword": "When "
});
formatter.step({
  "line": 143,
  "name": "I see \"Usage: sdk \u003ccommand\u003e [candidate] [version]\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101309409,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk help",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100382661,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Usage: sdk \u003ccommand\u003e [candidate] [version]",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 41565,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\n");
formatter.after({
  "duration": 767880,
  "status": "passed"
});
formatter.before({
  "duration": 2309499,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is not reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:47"
});
formatter.result({
  "duration": 28020,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1409370,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 145,
      "value": "# selfupdate command"
    }
  ],
  "line": 146,
  "name": "Attempt self-update while Offline",
  "description": "",
  "id": "offline-mode;attempt-self-update-while-offline",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 147,
  "name": "the system is bootstrapped",
  "keyword": "Given "
});
formatter.step({
  "line": 148,
  "name": "I enter \"sdk selfupdate\"",
  "keyword": "When "
});
formatter.step({
  "line": 149,
  "name": "I see \"This command is not available in offline mode.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102781079,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk selfupdate",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100274217,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "This command is not available in offline mode.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 47971,
  "status": "passed"
});
formatter.write("\nOutput: \n\nThis command is not available in offline mode.\n\n\n");
formatter.after({
  "duration": 784209,
  "status": "passed"
});
formatter.uri("outdated_candidate.feature");
formatter.feature({
  "line": 1,
  "name": "Outdated Candidate",
  "description": "",
  "id": "outdated-candidate",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2298793,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13136440,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1921283,
  "status": "passed"
});
formatter.scenario({
  "line": 7,
  "name": "Display outdated candidate version in use when it is outdated",
  "description": "",
  "id": "outdated-candidate;display-outdated-candidate-version-in-use-when-it-is-outdated",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 8,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 9,
  "name": "the default \"grails\" candidate is \"2.4.4\"",
  "keyword": "And "
});
formatter.step({
  "line": 10,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 11,
  "name": "I enter \"sdk outdated grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 12,
  "name": "I see \"Outdated:\"",
  "keyword": "Then "
});
formatter.step({
  "line": 13,
  "name": "I see \"grails (1.3.9 \u003c 2.4.4)\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 459529,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 13
    },
    {
      "val": "2.4.4",
      "offset": 35
    }
  ],
  "location": "stub_steps.groovy:8"
});
formatter.result({
  "duration": 11306691,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101279893,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk outdated grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100300987,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Outdated:",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 37300,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails (1.3.9 \u003c 2.4.4)",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 13477,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nOutdated:\ngrails (1.3.9 \u003c 2.4.4)\n\n\n");
formatter.after({
  "duration": 755022,
  "status": "passed"
});
formatter.before({
  "duration": 2502929,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11950929,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1544998,
  "status": "passed"
});
formatter.scenario({
  "line": 15,
  "name": "Display outdated candidate version in use when it is not outdated",
  "description": "",
  "id": "outdated-candidate;display-outdated-candidate-version-in-use-when-it-is-not-outdated",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 16,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 17,
  "name": "the default \"grails\" candidate is \"1.3.9\"",
  "keyword": "And "
});
formatter.step({
  "line": 18,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 19,
  "name": "I enter \"sdk outdated grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 20,
  "name": "I see \"grails is up-to-date\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 426246,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 13
    },
    {
      "val": "1.3.9",
      "offset": 35
    }
  ],
  "location": "stub_steps.groovy:8"
});
formatter.result({
  "duration": 9277289,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102392736,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk outdated grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100307776,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails is up-to-date",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 43669,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\ngrails is up-to-date\n\n\n");
formatter.after({
  "duration": 749500,
  "status": "passed"
});
formatter.before({
  "duration": 2467850,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 15084504,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2599390,
  "status": "passed"
});
formatter.scenario({
  "line": 22,
  "name": "Display outdated candidate version when none is in use",
  "description": "",
  "id": "outdated-candidate;display-outdated-candidate-version-when-none-is-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 23,
  "name": "the candidate \"grails\" does not exist locally",
  "keyword": "Given "
});
formatter.step({
  "line": 24,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 25,
  "name": "I enter \"sdk outdated grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 26,
  "name": "I see \"Not using any version of grails\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    }
  ],
  "location": "installation_steps.groovy:44"
});
formatter.result({
  "duration": 371352,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102857466,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk outdated grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100293903,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Not using any version of grails",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 51221,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nfind: `/tmp/sdkman-1286/.sdkman/candidates/grails\u0027: No such file or directory\nNot using any version of grails\ngrails is up-to-date\n\n\n");
formatter.after({
  "duration": 766047,
  "status": "passed"
});
formatter.before({
  "duration": 2315850,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 15040595,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2197428,
  "status": "passed"
});
formatter.scenario({
  "line": 28,
  "name": "Display outdated candidate versions when none is specified and none is in use",
  "description": "",
  "id": "outdated-candidate;display-outdated-candidate-versions-when-none-is-specified-and-none-is-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 29,
  "name": "the candidate \"grails\" does not exist locally",
  "keyword": "Given "
});
formatter.step({
  "line": 30,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 31,
  "name": "I enter \"sdk outdated\"",
  "keyword": "When "
});
formatter.step({
  "line": 32,
  "name": "I see \"No candidates are in use\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    }
  ],
  "location": "installation_steps.groovy:44"
});
formatter.result({
  "duration": 394628,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103225695,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk outdated",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100362560,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "No candidates are in use",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 72063,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nfind: `/tmp/sdkman-1286/.sdkman/candidates/grails\u0027: No such file or directory\nNo candidates are in use\n\n\n");
formatter.after({
  "duration": 854983,
  "status": "passed"
});
formatter.before({
  "duration": 2302197,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13540322,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1795853,
  "status": "passed"
});
formatter.scenario({
  "line": 34,
  "name": "Display outdated candidate versions when none is specified and one is in use",
  "description": "",
  "id": "outdated-candidate;display-outdated-candidate-versions-when-none-is-specified-and-one-is-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 35,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 36,
  "name": "the default \"grails\" candidate is \"2.4.4\"",
  "keyword": "And "
});
formatter.step({
  "line": 37,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 38,
  "name": "I enter \"sdk outdated\"",
  "keyword": "When "
});
formatter.step({
  "line": 39,
  "name": "I see \"Outdated:\"",
  "keyword": "Then "
});
formatter.step({
  "line": 40,
  "name": "I see \"grails (1.3.9 \u003c 2.4.4)\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 550174,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 13
    },
    {
      "val": "2.4.4",
      "offset": 35
    }
  ],
  "location": "stub_steps.groovy:8"
});
formatter.result({
  "duration": 10569209,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101219422,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk outdated",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100300540,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Outdated:",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 48556,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails (1.3.9 \u003c 2.4.4)",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 15634,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nOutdated:\ngrails (1.3.9 \u003c 2.4.4)\n\n\n");
formatter.after({
  "duration": 746373,
  "status": "passed"
});
formatter.before({
  "duration": 2434913,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11992818,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1651213,
  "status": "passed"
});
formatter.scenario({
  "line": 42,
  "name": "Display outdated candidate versions when none is specified and multiple are in use",
  "description": "",
  "id": "outdated-candidate;display-outdated-candidate-versions-when-none-is-specified-and-multiple-are-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 43,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 44,
  "name": "the default \"grails\" candidate is \"2.4.4\"",
  "keyword": "And "
});
formatter.step({
  "line": 45,
  "name": "the candidate \"groovy\" version \"2.0.5\" is already installed and default",
  "keyword": "And "
});
formatter.step({
  "line": 46,
  "name": "the default \"groovy\" candidate is \"2.4.1\"",
  "keyword": "And "
});
formatter.step({
  "line": 47,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 48,
  "name": "I enter \"sdk outdated\"",
  "keyword": "When "
});
formatter.step({
  "line": 49,
  "name": "I see \"Outdated:\"",
  "keyword": "Then "
});
formatter.step({
  "line": 50,
  "name": "I see \"grails (1.3.9 \u003c 2.4.4)\"",
  "keyword": "And "
});
formatter.step({
  "line": 51,
  "name": "I see \"groovy (2.0.5 \u003c 2.4.1)\"",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 508491,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 13
    },
    {
      "val": "2.4.4",
      "offset": 35
    }
  ],
  "location": "stub_steps.groovy:8"
});
formatter.result({
  "duration": 11384360,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 569914,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 13
    },
    {
      "val": "2.4.1",
      "offset": 35
    }
  ],
  "location": "stub_steps.groovy:8"
});
formatter.result({
  "duration": 10042688,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101318642,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk outdated",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100297579,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Outdated:",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 43662,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails (1.3.9 \u003c 2.4.4)",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 16406,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy (2.0.5 \u003c 2.4.1)",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 32150,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nOutdated:\ngroovy (2.0.5 \u003c 2.4.1)\ngrails (1.3.9 \u003c 2.4.4)\n\n\n");
formatter.after({
  "duration": 851251,
  "status": "passed"
});
formatter.before({
  "duration": 3078922,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12932605,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1495200,
  "status": "passed"
});
formatter.scenario({
  "line": 53,
  "name": "Display outdated candidate versions when none specified and multiple in use but not outdated",
  "description": "",
  "id": "outdated-candidate;display-outdated-candidate-versions-when-none-specified-and-multiple-in-use-but-not-outdated",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 54,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 55,
  "name": "the default \"grails\" candidate is \"1.3.9\"",
  "keyword": "And "
});
formatter.step({
  "line": 56,
  "name": "the candidate \"groovy\" version \"2.0.5\" is already installed and default",
  "keyword": "And "
});
formatter.step({
  "line": 57,
  "name": "the default \"groovy\" candidate is \"2.0.5\"",
  "keyword": "And "
});
formatter.step({
  "line": 58,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 59,
  "name": "I enter \"sdk outdated\"",
  "keyword": "When "
});
formatter.step({
  "line": 60,
  "name": "I see \"All candidates are up-to-date\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 390498,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 13
    },
    {
      "val": "1.3.9",
      "offset": 35
    }
  ],
  "location": "stub_steps.groovy:8"
});
formatter.result({
  "duration": 10807540,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 503097,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 13
    },
    {
      "val": "2.0.5",
      "offset": 35
    }
  ],
  "location": "stub_steps.groovy:8"
});
formatter.result({
  "duration": 9702379,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101338299,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk outdated",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100256296,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "All candidates are up-to-date",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 42466,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nAll candidates are up-to-date\n\n\n");
formatter.after({
  "duration": 717977,
  "status": "passed"
});
formatter.uri("path_initialisation.feature");
formatter.feature({
  "line": 1,
  "name": "Path Initialisation",
  "description": "",
  "id": "path-initialisation",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2437691,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12898554,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1380295,
  "status": "passed"
});
formatter.scenario({
  "line": 7,
  "name": "sdkman is initialised for the first time",
  "description": "",
  "id": "path-initialisation;sdkman-is-initialised-for-the-first-time",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 8,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 9,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 10,
  "name": "I enter \"echo $PATH\"",
  "keyword": "When "
});
formatter.step({
  "line": 11,
  "name": "I see a single occurrence of \"grails\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 373099,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101239670,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "echo $PATH",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100313864,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 30
    }
  ],
  "location": "command_line_interop_steps.groovy:31"
});
formatter.result({
  "duration": 664642,
  "status": "passed"
});
formatter.write("\nOutput: \n\n/tmp/sdkman-1286/.sdkman/candidates/grails/current/bin:/tmp/sdkman-1286/bin:/usr/sbin:/usr/bin:/sbin:/bin\n\n\n");
formatter.after({
  "duration": 1013323,
  "status": "passed"
});
formatter.before({
  "duration": 2952861,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13690936,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2014411,
  "status": "passed"
});
formatter.scenario({
  "line": 13,
  "name": "sdkman is initialised a subsequent time",
  "description": "",
  "id": "path-initialisation;sdkman-is-initialised-a-subsequent-time",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 14,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 15,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 16,
  "name": "the system is bootstrapped again",
  "keyword": "And "
});
formatter.step({
  "line": 17,
  "name": "I enter \"echo $PATH\"",
  "keyword": "And "
});
formatter.step({
  "line": 18,
  "name": "I see a single occurrence of \"grails\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 481527,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101052250,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:120"
});
formatter.result({
  "duration": 100371985,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "echo $PATH",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100242986,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 30
    }
  ],
  "location": "command_line_interop_steps.groovy:31"
});
formatter.result({
  "duration": 43516,
  "status": "passed"
});
formatter.write("\nOutput: \n\n/tmp/sdkman-1286/.sdkman/candidates/grails/current/bin:/tmp/sdkman-1286/bin:/usr/sbin:/usr/bin:/sbin:/bin\n\n\n");
formatter.after({
  "duration": 813548,
  "status": "passed"
});
formatter.before({
  "duration": 2336426,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12232392,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1364587,
  "status": "passed"
});
formatter.scenario({
  "line": 20,
  "name": "Install a candidate and see it on the PATH",
  "description": "",
  "id": "path-initialisation;install-a-candidate-and-see-it-on-the-path",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 21,
  "name": "the system is bootstrapped",
  "keyword": "Given "
});
formatter.step({
  "line": 22,
  "name": "I enter \"echo $PATH\"",
  "keyword": "When "
});
formatter.step({
  "line": 23,
  "name": "I see no occurrences of \"grails\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101117166,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "echo $PATH",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100318072,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 25
    }
  ],
  "location": "command_line_interop_steps.groovy:35"
});
formatter.result({
  "duration": 169757,
  "status": "passed"
});
formatter.write("\nOutput: \n\n/tmp/sdkman-1286/bin:/usr/sbin:/usr/bin:/sbin:/bin\n\n\n");
formatter.after({
  "duration": 792570,
  "status": "passed"
});
formatter.before({
  "duration": 2250170,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11989205,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1466032,
  "status": "passed"
});
formatter.scenario({
  "line": 25,
  "name": "Install a candidate and see it on the PATH",
  "description": "",
  "id": "path-initialisation;install-a-candidate-and-see-it-on-the-path",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 26,
  "name": "the candidate \"grails\" version \"2.1.0\" is available for download",
  "keyword": "And "
});
formatter.step({
  "line": 27,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 28,
  "name": "I enter \"sdk install grails 2.1.0\" and answer \"Y\"",
  "keyword": "And "
});
formatter.step({
  "line": 29,
  "name": "I enter \"echo $PATH\"",
  "keyword": "When "
});
formatter.step({
  "line": 30,
  "name": "I see a single occurrence of \"grails\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 9847065,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103360342,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 2.1.0",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 47
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100396397,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "echo $PATH",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100290715,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 30
    }
  ],
  "location": "command_line_interop_steps.groovy:31"
});
formatter.result({
  "duration": 43227,
  "status": "passed"
});
formatter.write("\nOutput: \n/tmp/sdkman-1286/.sdkman/candidates/grails/current/bin:/tmp/sdkman-1286/bin:/usr/sbin:/usr/bin:/sbin:/bin\n\n\n\n");
formatter.after({
  "duration": 721645,
  "status": "passed"
});
formatter.before({
  "duration": 2446173,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 14242976,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2057723,
  "status": "passed"
});
formatter.scenario({
  "line": 32,
  "name": "Install multiple candidate versions and see it once on the PATH",
  "description": "",
  "id": "path-initialisation;install-multiple-candidate-versions-and-see-it-once-on-the-path",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 33,
  "name": "the candidate \"grails\" version \"1.3.9\" is available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 34,
  "name": "the candidate \"grails\" version \"2.1.0\" is available for download",
  "keyword": "And "
});
formatter.step({
  "line": 35,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 36,
  "name": "I enter \"sdk install grails 1.3.9\" and answer \"Y\"",
  "keyword": "And "
});
formatter.step({
  "line": 37,
  "name": "I enter \"sdk install grails 2.1.0\" and answer \"Y\"",
  "keyword": "And "
});
formatter.step({
  "line": 38,
  "name": "I enter \"echo $PATH\"",
  "keyword": "When "
});
formatter.step({
  "line": 39,
  "name": "I see a single occurrence of \"grails\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 11631012,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 11822015,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103502702,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 1.3.9",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 47
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100376129,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk install grails 2.1.0",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 47
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100258221,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "echo $PATH",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100301081,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 30
    }
  ],
  "location": "command_line_interop_steps.groovy:31"
});
formatter.result({
  "duration": 51534,
  "status": "passed"
});
formatter.write("\nOutput: \n\n/tmp/sdkman-1286/.sdkman/candidates/grails/current/bin:/tmp/sdkman-1286/bin:/usr/sbin:/usr/bin:/sbin:/bin\n\n\n");
formatter.after({
  "duration": 758851,
  "status": "passed"
});
formatter.uri("self_update.feature");
formatter.feature({
  "line": 1,
  "name": "Self Update",
  "description": "",
  "id": "self-update",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2466026,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12571826,
  "status": "passed"
});
formatter.scenario({
  "line": 6,
  "name": "Force a Selfupdate",
  "description": "",
  "id": "self-update;force-a-selfupdate",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 7,
  "name": "an initialised environment",
  "keyword": "Given "
});
formatter.step({
  "line": 8,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 9,
  "name": "I enter \"sdk selfupdate force\"",
  "keyword": "When "
});
formatter.step({
  "line": 10,
  "name": "I do not see \"A new version of SDKMAN is available...\"",
  "keyword": "Then "
});
formatter.step({
  "line": 11,
  "name": "I do not see \"Would you like to upgrade now? (Y/n)\"",
  "keyword": "And "
});
formatter.step({
  "line": 12,
  "name": "I do not see \"Not upgrading today...\"",
  "keyword": "And "
});
formatter.step({
  "line": 13,
  "name": "I see \"Updating SDKMAN...\"",
  "keyword": "And "
});
formatter.step({
  "line": 14,
  "name": "I see \"Successfully upgraded SDKMAN.\"",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1414337,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101222400,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk selfupdate force",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100300437,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "A new version of SDKMAN is available...",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 43446,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Would you like to upgrade now? (Y/n)",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 21876,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Not upgrading today...",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 18943,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Updating SDKMAN...",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 13819,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Successfully upgraded SDKMAN.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 8240,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\nUpdating SDKMAN...\nPurge existing scripts...\nRefresh directory structure...\nPrime the config file...\nExtract script archive...\nUnziping scripts to: /tmp/sdkman-1286/.sdkman/tmp/stage\nMoving sdkman-init file to bin folder...\nMove remaining module scripts to src folder: /tmp/sdkman-1286/.sdkman/src\nClean up staging folder...\n\n\nSuccessfully upgraded SDKMAN.\n\nPlease open a new terminal, or run the following in the existing one:\n\n    source \"/tmp/sdkman-1286/.sdkman/bin/sdkman-init.sh\"\n\n\n\n\n");
formatter.after({
  "duration": 928072,
  "status": "passed"
});
formatter.before({
  "duration": 2525087,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 14943011,
  "status": "passed"
});
formatter.scenario({
  "line": 16,
  "name": "Selfupdate when out of date",
  "description": "",
  "id": "self-update;selfupdate-when-out-of-date",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 17,
  "name": "an outdated initialised environment",
  "keyword": "Given "
});
formatter.step({
  "line": 18,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 19,
  "name": "I enter \"sdk selfupdate\"",
  "keyword": "When "
});
formatter.step({
  "line": 20,
  "name": "I do not see \"A new version of SDKMAN is available...\"",
  "keyword": "Then "
});
formatter.step({
  "line": 21,
  "name": "I do not see \"Would you like to upgrade now? (Y/n)\"",
  "keyword": "And "
});
formatter.step({
  "line": 22,
  "name": "I do not see \"Not upgrading today...\"",
  "keyword": "And "
});
formatter.step({
  "line": 23,
  "name": "I see \"Updating SDKMAN...\"",
  "keyword": "And "
});
formatter.step({
  "line": 24,
  "name": "I see \"Successfully upgraded SDKMAN.\"",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:91"
});
formatter.result({
  "duration": 3583278,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101752418,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk selfupdate",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100281965,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "A new version of SDKMAN is available...",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 39945,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Would you like to upgrade now? (Y/n)",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 12009,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Not upgrading today...",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 8849,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Updating SDKMAN...",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 9889,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Successfully upgraded SDKMAN.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 8300,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\nUpdating SDKMAN...\nPurge existing scripts...\nRefresh directory structure...\nPrime the config file...\nExtract script archive...\nUnziping scripts to: /tmp/sdkman-1286/.sdkman/tmp/stage\nMoving sdkman-init file to bin folder...\nMove remaining module scripts to src folder: /tmp/sdkman-1286/.sdkman/src\nClean up staging folder...\n\n\nSuccessfully upgraded SDKMAN.\n\nPlease open a new terminal, or run the following in the existing one:\n\n    source \"/tmp/sdkman-1286/.sdkman/bin/sdkman-init.sh\"\n\n\n\n\n");
formatter.after({
  "duration": 732532,
  "status": "passed"
});
formatter.before({
  "duration": 3248518,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 15700654,
  "status": "passed"
});
formatter.scenario({
  "line": 26,
  "name": "Agree to a suggested Selfupdate",
  "description": "",
  "id": "self-update;agree-to-a-suggested-selfupdate",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 27,
  "name": "an outdated initialised environment",
  "keyword": "Given "
});
formatter.step({
  "line": 28,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 29,
  "name": "I enter \"sdk help\" and answer \"Y\"",
  "keyword": "When "
});
formatter.step({
  "line": 30,
  "name": "I see \"A new version of SDKMAN is available...\"",
  "keyword": "Then "
});
formatter.step({
  "line": 31,
  "name": "I see \"Would you like to upgrade now? (Y/n)\"",
  "keyword": "And "
});
formatter.step({
  "line": 32,
  "name": "I see \"Successfully upgraded SDKMAN.\"",
  "keyword": "And "
});
formatter.step({
  "line": 33,
  "name": "I do not see \"Not upgrading today...\"",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:91"
});
formatter.result({
  "duration": 2735301,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 105852019,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk help",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 31
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100317044,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "A new version of SDKMAN is available...",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 71920,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Would you like to upgrade now? (Y/n)",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 31470,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Successfully upgraded SDKMAN.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 21927,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Not upgrading today...",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 31640,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\nATTENTION: A new version of SDKMAN is available...\n\nThe current version is x.y.z, but you have x.y.y.\n\nWould you like to upgrade now? (Y/n)\nUpdating SDKMAN...\nPurge existing scripts...\nRefresh directory structure...\nPrime the config file...\nExtract script archive...\nUnziping scripts to: /tmp/sdkman-1286/.sdkman/tmp/stage\nMoving sdkman-init file to bin folder...\nMove remaining module scripts to src folder: /tmp/sdkman-1286/.sdkman/src\nClean up staging folder...\n\n\nSuccessfully upgraded SDKMAN.\n\nPlease open a new terminal, or run the following in the existing one:\n\n    source \"/tmp/sdkman-1286/.sdkman/bin/sdkman-init.sh\"\n\n\n\n\n");
formatter.after({
  "duration": 885796,
  "status": "passed"
});
formatter.before({
  "duration": 2804630,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13902881,
  "status": "passed"
});
formatter.scenario({
  "line": 35,
  "name": "Do not agree to a suggested Selfupdate",
  "description": "",
  "id": "self-update;do-not-agree-to-a-suggested-selfupdate",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 36,
  "name": "an outdated initialised environment",
  "keyword": "Given "
});
formatter.step({
  "line": 37,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 38,
  "name": "I enter \"sdk help\" and answer \"N\"",
  "keyword": "When "
});
formatter.step({
  "line": 39,
  "name": "I see \"A new version of SDKMAN is available...\"",
  "keyword": "Then "
});
formatter.step({
  "line": 40,
  "name": "I see \"Would you like to upgrade now? (Y/n)\"",
  "keyword": "And "
});
formatter.step({
  "line": 41,
  "name": "I see \"Not upgrading today...\"",
  "keyword": "And "
});
formatter.step({
  "line": 42,
  "name": "I do not see \"Successfully upgraded SDKMAN.\"",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:91"
});
formatter.result({
  "duration": 2338471,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 105467311,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk help",
      "offset": 9
    },
    {
      "val": "N",
      "offset": 31
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100337007,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "A new version of SDKMAN is available...",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 34963,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Would you like to upgrade now? (Y/n)",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 9695,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Not upgrading today...",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 8147,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Successfully upgraded SDKMAN.",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 14245,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\nATTENTION: A new version of SDKMAN is available...\n\nThe current version is x.y.z, but you have x.y.y.\n\nWould you like to upgrade now? (Y/n)Not upgrading today...\n\n\n");
formatter.after({
  "duration": 699671,
  "status": "passed"
});
formatter.before({
  "duration": 2357052,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 14546120,
  "status": "passed"
});
formatter.scenario({
  "line": 44,
  "name": "Automatically Selfupdate",
  "description": "",
  "id": "self-update;automatically-selfupdate",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 45,
  "name": "an outdated initialised environment",
  "keyword": "Given "
});
formatter.step({
  "line": 46,
  "name": "the configuration file has been primed with \"sdkman_auto_selfupdate\u003dtrue\"",
  "keyword": "And "
});
formatter.step({
  "line": 47,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 48,
  "name": "I enter \"sdk help\"",
  "keyword": "When "
});
formatter.step({
  "line": 49,
  "name": "I see \"A new version of SDKMAN is available...\"",
  "keyword": "Then "
});
formatter.step({
  "line": 50,
  "name": "I do not see \"Would you like to upgrade now? (Y/n)\"",
  "keyword": "And "
});
formatter.step({
  "line": 51,
  "name": "I do not see \"Not upgrading today...\"",
  "keyword": "And "
});
formatter.step({
  "line": 52,
  "name": "I see \"Successfully upgraded SDKMAN.\"",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:91"
});
formatter.result({
  "duration": 2301736,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdkman_auto_selfupdate\u003dtrue",
      "offset": 45
    }
  ],
  "location": "selfupdate_steps.groovy:5"
});
formatter.result({
  "duration": 318132,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101432711,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk help",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100320231,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "A new version of SDKMAN is available...",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 39848,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Would you like to upgrade now? (Y/n)",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 20027,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Not upgrading today...",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 11921,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Successfully upgraded SDKMAN.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 8498,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\nATTENTION: A new version of SDKMAN is available...\n\nThe current version is x.y.z, but you have x.y.y.\n\n\nUpdating SDKMAN...\nPurge existing scripts...\nRefresh directory structure...\nPrime the config file...\nExtract script archive...\nUnziping scripts to: /tmp/sdkman-1286/.sdkman/tmp/stage\nMoving sdkman-init file to bin folder...\nMove remaining module scripts to src folder: /tmp/sdkman-1286/.sdkman/src\nClean up staging folder...\n\n\nSuccessfully upgraded SDKMAN.\n\nPlease open a new terminal, or run the following in the existing one:\n\n    source \"/tmp/sdkman-1286/.sdkman/bin/sdkman-init.sh\"\n\n\n\n\n");
formatter.after({
  "duration": 741241,
  "status": "passed"
});
formatter.before({
  "duration": 2252015,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13640766,
  "status": "passed"
});
formatter.scenario({
  "line": 54,
  "name": "Do not automatically Selfupdate",
  "description": "",
  "id": "self-update;do-not-automatically-selfupdate",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 55,
  "name": "an outdated initialised environment",
  "keyword": "Given "
});
formatter.step({
  "line": 56,
  "name": "the configuration file has been primed with \"sdkman_auto_selfupdate\u003dfalse\"",
  "keyword": "And "
});
formatter.step({
  "line": 57,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 58,
  "name": "I enter \"sdk help\" and answer \"n\"",
  "keyword": "When "
});
formatter.step({
  "line": 59,
  "name": "I see \"A new version of SDKMAN is available...\"",
  "keyword": "Then "
});
formatter.step({
  "line": 60,
  "name": "I see \"Would you like to upgrade now? (Y/n)\"",
  "keyword": "And "
});
formatter.step({
  "line": 61,
  "name": "I see \"Not upgrading today...\"",
  "keyword": "And "
});
formatter.step({
  "line": 62,
  "name": "I do not see \"Successfully upgraded SDKMAN.\"",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:91"
});
formatter.result({
  "duration": 1815437,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdkman_auto_selfupdate\u003dfalse",
      "offset": 45
    }
  ],
  "location": "selfupdate_steps.groovy:5"
});
formatter.result({
  "duration": 85798,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101182819,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk help",
      "offset": 9
    },
    {
      "val": "n",
      "offset": 31
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100292988,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "A new version of SDKMAN is available...",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 35396,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Would you like to upgrade now? (Y/n)",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 27007,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Not upgrading today...",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 16865,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Successfully upgraded SDKMAN.",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 258280,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\nATTENTION: A new version of SDKMAN is available...\n\nThe current version is x.y.z, but you have x.y.y.\n\nWould you like to upgrade now? (Y/n)Not upgrading today...\n\n\n");
formatter.after({
  "duration": 992587,
  "status": "passed"
});
formatter.before({
  "duration": 2405697,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 14652456,
  "status": "passed"
});
formatter.scenario({
  "line": 64,
  "name": "Bother the user with Upgrade message once a day",
  "description": "",
  "id": "self-update;bother-the-user-with-upgrade-message-once-a-day",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 65,
  "name": "an outdated initialised environment",
  "keyword": "Given "
});
formatter.step({
  "line": 66,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 67,
  "name": "I enter \"sdk help\" and answer \"N\"",
  "keyword": "When "
});
formatter.step({
  "line": 68,
  "name": "I see \"A new version of SDKMAN is available...\"",
  "keyword": "Then "
});
formatter.step({
  "line": 69,
  "name": "I see \"Would you like to upgrade now? (Y/n)\"",
  "keyword": "And "
});
formatter.step({
  "line": 70,
  "name": "I see \"Not upgrading today...\"",
  "keyword": "And "
});
formatter.step({
  "line": 71,
  "name": "I enter \"sdk help\"",
  "keyword": "And "
});
formatter.step({
  "line": 72,
  "name": "I do not see \"A new version of SDKMAN is available...\"",
  "keyword": "Then "
});
formatter.step({
  "line": 73,
  "name": "I do not see \"Would you like to upgrade now? (Y/n)\"",
  "keyword": "And "
});
formatter.step({
  "line": 74,
  "name": "I do not see \"Not upgrading now...\"",
  "keyword": "And "
});
formatter.step({
  "line": 75,
  "name": "I do not see \"Successfully upgraded SDKMAN.\"",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:91"
});
formatter.result({
  "duration": 2067281,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102649912,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk help",
      "offset": 9
    },
    {
      "val": "N",
      "offset": 31
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100358914,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "A new version of SDKMAN is available...",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 52499,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Would you like to upgrade now? (Y/n)",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 18756,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Not upgrading today...",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 14909,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk help",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100276082,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "A new version of SDKMAN is available...",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 73248,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Would you like to upgrade now? (Y/n)",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 18546,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Not upgrading now...",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 13320,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Successfully upgraded SDKMAN.",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 13565,
  "status": "passed"
});
formatter.write("\nOutput: \n\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\n");
formatter.after({
  "duration": 880165,
  "status": "passed"
});
formatter.before({
  "duration": 2308124,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13552743,
  "status": "passed"
});
formatter.scenario({
  "line": 77,
  "name": "Selfupdate when not out of date",
  "description": "",
  "id": "self-update;selfupdate-when-not-out-of-date",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 78,
  "name": "an initialised environment",
  "keyword": "Given "
});
formatter.step({
  "line": 79,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 80,
  "name": "I enter \"sdk selfupdate\"",
  "keyword": "When "
});
formatter.step({
  "line": 81,
  "name": "I see \"No update available at this time.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1846114,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101641121,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk selfupdate",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100287637,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "No update available at this time.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 59376,
  "status": "passed"
});
formatter.write("\nOutput: \n\nNo update available at this time.\n\n\n");
formatter.after({
  "duration": 897254,
  "status": "passed"
});
formatter.uri("uninstall_candidate.feature");
formatter.feature({
  "line": 1,
  "name": "Uninstall Candidate",
  "description": "",
  "id": "uninstall-candidate",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2445747,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13244173,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1833040,
  "status": "passed"
});
formatter.scenario({
  "line": 7,
  "name": "Uninstall an installed Candidate Version not in use",
  "description": "",
  "id": "uninstall-candidate;uninstall-an-installed-candidate-version-not-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 8,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed but not default",
  "keyword": "Given "
});
formatter.step({
  "line": 9,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 10,
  "name": "I enter \"sdk uninstall grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 11,
  "name": "I do not see \"Unselecting grails 2.1.0\"",
  "keyword": "Then "
});
formatter.step({
  "line": 12,
  "name": "I see \"Uninstalling grails 2.1.0\"",
  "keyword": "Then "
});
formatter.step({
  "line": 13,
  "name": "the candidate \"grails\" version \"2.1.0\" is not installed",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 423385,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101446537,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk uninstall grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100334586,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Unselecting grails 2.1.0",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 49475,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Uninstalling grails 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 26196,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 191298,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nUninstalling grails 2.1.0...\n\n\n");
formatter.after({
  "duration": 769424,
  "status": "passed"
});
formatter.before({
  "duration": 2411231,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11802337,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1638150,
  "status": "passed"
});
formatter.scenario({
  "line": 15,
  "name": "Uninstall a Candidate Version in use",
  "description": "",
  "id": "uninstall-candidate;uninstall-a-candidate-version-in-use",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 16,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 17,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 18,
  "name": "I enter \"sdk uninstall grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 19,
  "name": "I see \"Unselecting grails 2.1.0\"",
  "keyword": "Then "
});
formatter.step({
  "line": 20,
  "name": "I see \"Uninstalling grails 2.1.0\"",
  "keyword": "And "
});
formatter.step({
  "line": 21,
  "name": "the candidate \"grails\" version \"2.1.0\" is not installed",
  "keyword": "And "
});
formatter.step({
  "line": 22,
  "name": "the candidate \"grails\" is no longer selected",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 521772,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101392064,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk uninstall grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100328404,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Unselecting grails 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 32619,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Uninstalling grails 2.1.0",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 8216,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 199272,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    }
  ],
  "location": "use_steps.groovy:42"
});
formatter.result({
  "duration": 229668,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nUnselecting grails 2.1.0...\n\nUninstalling grails 2.1.0...\n\n\n");
formatter.after({
  "duration": 751468,
  "status": "passed"
});
formatter.before({
  "duration": 2444495,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12268149,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1578264,
  "status": "passed"
});
formatter.scenario({
  "line": 24,
  "name": "Attempt uninstalling a Candidate Version that is not installed",
  "description": "",
  "id": "uninstall-candidate;attempt-uninstalling-a-candidate-version-that-is-not-installed",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 25,
  "name": "the candidate \"grails\" version \"1.3.9\" is not installed",
  "keyword": "Given "
});
formatter.step({
  "line": 26,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 27,
  "name": "I enter \"sdk uninstall grails 1.3.9\"",
  "keyword": "When "
});
formatter.step({
  "line": 28,
  "name": "I see \"grails 1.3.9 is not installed.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:16"
});
formatter.result({
  "duration": 254845,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101233157,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk uninstall grails 1.3.9",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100297814,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails 1.3.9 is not installed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 35412,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\ngrails 1.3.9 is not installed.\n\n\n");
formatter.after({
  "duration": 712487,
  "status": "passed"
});
formatter.before({
  "duration": 2292890,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11807282,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1956781,
  "status": "passed"
});
formatter.scenario({
  "line": 30,
  "name": "Attempt uninstalling with no Candidate specified",
  "description": "",
  "id": "uninstall-candidate;attempt-uninstalling-with-no-candidate-specified",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 31,
  "name": "the system is bootstrapped",
  "keyword": "Given "
});
formatter.step({
  "line": 32,
  "name": "I enter \"sdk uninstall\"",
  "keyword": "When "
});
formatter.step({
  "line": 33,
  "name": "I see \"No candidate provided.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103101856,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk uninstall",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100274502,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "No candidate provided.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 56197,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nNo candidate provided.\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\n");
formatter.after({
  "duration": 774854,
  "status": "passed"
});
formatter.before({
  "duration": 2372204,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11651899,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1293622,
  "status": "passed"
});
formatter.scenario({
  "line": 35,
  "name": "Attempt uninstalling with an invalid Candidate specified",
  "description": "",
  "id": "uninstall-candidate;attempt-uninstalling-with-an-invalid-candidate-specified",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 36,
  "name": "the system is bootstrapped",
  "keyword": "Given "
});
formatter.step({
  "line": 37,
  "name": "I enter \"sdk uninstall groffle\"",
  "keyword": "When "
});
formatter.step({
  "line": 38,
  "name": "I see \"Stop! groffle is not a valid candidate.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101175103,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk uninstall groffle",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100247770,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! groffle is not a valid candidate.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 30960,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nStop! groffle is not a valid candidate.\n\n\n");
formatter.after({
  "duration": 738351,
  "status": "passed"
});
formatter.before({
  "duration": 2347493,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 14549593,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2015403,
  "status": "passed"
});
formatter.scenario({
  "line": 40,
  "name": "Attempt uninstalling without a version provided",
  "description": "",
  "id": "uninstall-candidate;attempt-uninstalling-without-a-version-provided",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 41,
  "name": "the system is bootstrapped",
  "keyword": "Given "
});
formatter.step({
  "line": 42,
  "name": "I enter \"sdk uninstall grails\"",
  "keyword": "When "
});
formatter.step({
  "line": 43,
  "name": "I see \"No candidate version provided.\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102175828,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk uninstall grails",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100291268,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "No candidate version provided.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 35237,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nNo candidate version provided.\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\n");
formatter.after({
  "duration": 739967,
  "status": "passed"
});
formatter.uri("use_and_default_candidate.feature");
formatter.feature({
  "line": 1,
  "name": "Use and Default Candidate",
  "description": "",
  "id": "use-and-default-candidate",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2699657,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 14196386,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2364659,
  "status": "passed"
});
formatter.scenario({
  "line": 7,
  "name": "Use without providing a Candidate",
  "description": "",
  "id": "use-and-default-candidate;use-without-providing-a-candidate",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 8,
  "name": "the system is bootstrapped",
  "keyword": "Given "
});
formatter.step({
  "line": 9,
  "name": "I enter \"sdk use\"",
  "keyword": "When "
});
formatter.step({
  "line": 10,
  "name": "I see \"Usage: sdk \u003ccommand\u003e [candidate] [version]\"",
  "keyword": "Then "
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102272677,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100301092,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Usage: sdk \u003ccommand\u003e [candidate] [version]",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 50992,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nNo candidate provided.\n\nUsage: sdk \u003ccommand\u003e [candidate] [version]\n       sdk offline \u003cenable|disable\u003e\n\n   commands:\n       install   or i    \u003ccandidate\u003e [version]\n       uninstall or rm   \u003ccandidate\u003e \u003cversion\u003e\n       list      or ls   [candidate]\n       use       or u    \u003ccandidate\u003e [version]\n       default   or d    \u003ccandidate\u003e [version]\n       current   or c    [candidate]\n       outdated  or o    [candidate]\n       version   or v\n       broadcast or b\n       help      or h\n       offline           \u003cenable|disable\u003e\n       selfupdate        [force]\n       flush             \u003ccandidates|broadcast|archives|temp\u003e\n\n   candidate  :  the SDK to install: groovy, scala, grails, akka, etc.\n                 use list command for comprehensive list of candidates\n                 eg: $ sdk list\n\n   version    :  where optional, defaults to latest stable if not provided\n                 eg: $ sdk install groovy\n\n\n\n");
formatter.after({
  "duration": 1001251,
  "status": "passed"
});
formatter.before({
  "duration": 2967348,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 15525183,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1898960,
  "status": "passed"
});
formatter.scenario({
  "line": 12,
  "name": "Use a candidate version that is installed",
  "description": "",
  "id": "use-and-default-candidate;use-a-candidate-version-that-is-installed",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 13,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 14,
  "name": "the candidate \"grails\" version \"1.3.9\" is a valid candidate version",
  "keyword": "And "
});
formatter.step({
  "line": 15,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed but not default",
  "keyword": "And "
});
formatter.step({
  "line": 16,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 17,
  "name": "I enter \"sdk use grails 1.3.9\"",
  "keyword": "When "
});
formatter.step({
  "line": 18,
  "name": "I see \"Using grails version 1.3.9 in this shell.\"",
  "keyword": "Then "
});
formatter.step({
  "line": 19,
  "name": "the candidate \"grails\" version \"1.3.9\" should be in use",
  "keyword": "Then "
});
formatter.step({
  "line": 20,
  "name": "the candidate \"grails\" version \"2.1.0\" should be the default",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 546566,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:30"
});
formatter.result({
  "duration": 4024473,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 413626,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102920194,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails 1.3.9",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100254978,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 1.3.9 in this shell.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 35557,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:25"
});
formatter.result({
  "duration": 100262042,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:30"
});
formatter.result({
  "duration": 123554,
  "status": "passed"
});
formatter.write("\nOutput: \n\nGrails Version: 1.3.9\n\n\n");
formatter.after({
  "duration": 828986,
  "status": "passed"
});
formatter.before({
  "duration": 2599114,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12199443,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1415220,
  "status": "passed"
});
formatter.scenario({
  "line": 22,
  "name": "Use a candidate version that is not installed",
  "description": "",
  "id": "use-and-default-candidate;use-a-candidate-version-that-is-not-installed",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 23,
  "name": "the candidate \"grails\" version \"1.3.9\" is available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 24,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 25,
  "name": "I enter \"sdk use grails 1.3.9\" and answer \"Y\"",
  "keyword": "When "
});
formatter.step({
  "line": 26,
  "name": "I see \"Using grails version 1.3.9 in this shell.\"",
  "keyword": "Then "
});
formatter.step({
  "line": 27,
  "name": "the candidate \"grails\" version \"1.3.9\" should be in use",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 9946706,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102362216,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails 1.3.9",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 43
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100356770,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 1.3.9 in this shell.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 33834,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:25"
});
formatter.result({
  "duration": 100299457,
  "status": "passed"
});
formatter.write("\nOutput: \n\nGrails version: 1.3.9\n\n\n");
formatter.after({
  "duration": 781314,
  "status": "passed"
});
formatter.before({
  "duration": 2421607,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11498191,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1345642,
  "status": "passed"
});
formatter.scenario({
  "line": 29,
  "name": "Use a candidate version that is automatically installed",
  "description": "",
  "id": "use-and-default-candidate;use-a-candidate-version-that-is-automatically-installed",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 30,
  "name": "I have configured \"sdkman_auto_answer\" to \"true\"",
  "keyword": "Given "
});
formatter.step({
  "line": 31,
  "name": "the candidate \"grails\" version \"1.3.9\" is available for download",
  "keyword": "And "
});
formatter.step({
  "line": 32,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 33,
  "name": "I enter \"sdk use grails 1.3.9\"",
  "keyword": "When "
});
formatter.step({
  "line": 34,
  "name": "I see \"Stop! grails 1.3.9 is not installed.\"",
  "keyword": "Then "
});
formatter.step({
  "line": 35,
  "name": "I see \"Using grails version 1.3.9 in this shell.\"",
  "keyword": "Then "
});
formatter.step({
  "line": 36,
  "name": "the candidate \"grails\" version \"1.3.9\" should be in use",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "sdkman_auto_answer",
      "offset": 19
    },
    {
      "val": "true",
      "offset": 43
    }
  ],
  "location": "installation_steps.groovy:78"
});
formatter.result({
  "duration": 150797,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 8782767,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101116248,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails 1.3.9",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100311422,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! grails 1.3.9 is not installed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 54626,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 1.3.9 in this shell.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 15948,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:25"
});
formatter.result({
  "duration": 100343186,
  "status": "passed"
});
formatter.write("\nOutput: \n\nGrails version: 1.3.9\n\n\n");
formatter.after({
  "duration": 849097,
  "status": "passed"
});
formatter.before({
  "duration": 2591365,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11645659,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1420879,
  "status": "passed"
});
formatter.scenario({
  "line": 38,
  "name": "Use a candidate version that does not exist",
  "description": "",
  "id": "use-and-default-candidate;use-a-candidate-version-that-does-not-exist",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 39,
  "name": "the candidate \"groovy\" version \"1.9.9\" is not available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 40,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 41,
  "name": "I enter \"sdk use groovy 1.9.9\"",
  "keyword": "When "
});
formatter.step({
  "line": 42,
  "name": "I see \"Stop! 1.9.9 is not a valid groovy version.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "1.9.9",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:22"
});
formatter.result({
  "duration": 2816328,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101097625,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use groovy 1.9.9",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100318754,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! 1.9.9 is not a valid groovy version.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 44263,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nStop! 1.9.9 is not a valid groovy version.\n\n\n");
formatter.after({
  "duration": 938522,
  "status": "passed"
});
formatter.before({
  "duration": 2385461,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11234654,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1442432,
  "status": "passed"
});
formatter.scenario({
  "line": 44,
  "name": "Use a candidate version that only exists locally",
  "description": "",
  "id": "use-and-default-candidate;use-a-candidate-version-that-only-exists-locally",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 45,
  "name": "the candidate \"grails\" version \"2.0.0.M1\" is not available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 46,
  "name": "the candidate \"grails\" version \"2.0.0.M1\" is already installed but not default",
  "keyword": "And "
});
formatter.step({
  "line": 47,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 48,
  "name": "I enter \"sdk use grails 2.0.0.M1\"",
  "keyword": "When "
});
formatter.step({
  "line": 49,
  "name": "I see \"Using grails version 2.0.0.M1 in this shell.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.0.0.M1",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:22"
});
formatter.result({
  "duration": 2920598,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.0.0.M1",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 460911,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102729417,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails 2.0.0.M1",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100310143,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 2.0.0.M1 in this shell.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 45664,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nSetting grails version 2.0.0.M1 as default.\n\nUsing grails version 2.0.0.M1 in this shell.\n\n\n");
formatter.after({
  "duration": 720450,
  "status": "passed"
});
formatter.before({
  "duration": 2375598,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12568355,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1962220,
  "status": "passed"
});
formatter.scenario({
  "line": 51,
  "name": "Use an uninstalled candidate version of an uninstalled candidate and it becomes default",
  "description": "",
  "id": "use-and-default-candidate;use-an-uninstalled-candidate-version-of-an-uninstalled-candidate-and-it-becomes-default",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 52,
  "name": "the candidate \"grails\" version \"1.3.9\" is available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 53,
  "name": "the candidate \"grails\" does not exist locally",
  "keyword": "And "
});
formatter.step({
  "line": 54,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 55,
  "name": "I enter \"sdk use grails 1.3.9\" and answer \"Y\"",
  "keyword": "When "
});
formatter.step({
  "line": 56,
  "name": "I see \"Setting grails version 1.3.9 as default.\"",
  "keyword": "Then "
});
formatter.step({
  "line": 57,
  "name": "I see \"Using grails version 1.3.9 in this shell.\"",
  "keyword": "And "
});
formatter.step({
  "line": 58,
  "name": "the candidate \"grails\" version \"1.3.9\" is installed",
  "keyword": "And "
});
formatter.step({
  "line": 59,
  "name": "the candidate \"grails\" version \"1.3.9\" should be the default",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 11842849,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    }
  ],
  "location": "installation_steps.groovy:44"
});
formatter.result({
  "duration": 215231,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101094506,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails 1.3.9",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 43
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100330028,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Setting grails version 1.3.9 as default.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 33043,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 1.3.9 in this shell.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 7991,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:10"
});
formatter.result({
  "duration": 54684,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:30"
});
formatter.result({
  "duration": 62571,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nStop! grails 1.3.9 is not installed.\nDo you want to install it now? (Y/n): \nDownloading: grails 1.3.9\n\n  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current\n                                 Dload  Upload   Total   Spent    Left  Speed\n\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\n\r100   541  100   541    0     0   533k      0 --:--:-- --:--:-- --:--:--  533k\n\nInstalling: grails 1.3.9\nDone installing!\n\nSetting grails version 1.3.9 as default.\n\nUsing grails version 1.3.9 in this shell.\n\n\n");
formatter.after({
  "duration": 811539,
  "status": "passed"
});
formatter.before({
  "duration": 2444901,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11577705,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1522654,
  "status": "passed"
});
formatter.scenario({
  "line": 61,
  "name": "Use an uninstalled candidate version of an installed candidate and it does not become default",
  "description": "",
  "id": "use-and-default-candidate;use-an-uninstalled-candidate-version-of-an-installed-candidate-and-it-does-not-become-default",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 62,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 63,
  "name": "the candidate \"grails\" version \"2.1.0\" is available for download",
  "keyword": "And "
});
formatter.step({
  "line": 64,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 65,
  "name": "I enter \"sdk use grails 2.1.0\" and answer \"Y\"",
  "keyword": "When "
});
formatter.step({
  "line": 66,
  "name": "I do not see \"Setting grails version 1.3.9 as default.\"",
  "keyword": "Then "
});
formatter.step({
  "line": 67,
  "name": "I see \"Using grails version 2.1.0 in this shell.\"",
  "keyword": "And "
});
formatter.step({
  "line": 68,
  "name": "the candidate \"grails\" version \"2.1.0\" is installed",
  "keyword": "And "
});
formatter.step({
  "line": 69,
  "name": "the candidate \"grails\" version \"1.3.9\" should be the default",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 618847,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 9231930,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101140156,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails 2.1.0",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 43
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100513822,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Setting grails version 1.3.9 as default.",
      "offset": 14
    }
  ],
  "location": "command_line_interop_steps.groovy:19"
});
formatter.result({
  "duration": 34912,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 2.1.0 in this shell.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 13756,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:10"
});
formatter.result({
  "duration": 50191,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:30"
});
formatter.result({
  "duration": 90088,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nStop! grails 2.1.0 is not installed.\nDo you want to install it now? (Y/n): \nDownloading: grails 2.1.0\n\n  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current\n                                 Dload  Upload   Total   Spent    Left  Speed\n\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\n\r100   541  100   541    0     0    99k      0 --:--:-- --:--:-- --:--:--   99k\n\nInstalling: grails 2.1.0\nDone installing!\n\n\nUsing grails version 2.1.0 in this shell.\n\n\n");
formatter.after({
  "duration": 893287,
  "status": "passed"
});
formatter.before({
  "duration": 2577659,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11156945,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1451941,
  "status": "passed"
});
formatter.scenario({
  "line": 71,
  "name": "Default a candidate version that is not installed",
  "description": "",
  "id": "use-and-default-candidate;default-a-candidate-version-that-is-not-installed",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 72,
  "name": "the candidate \"groovy\" version \"2.0.5\" is a valid candidate version",
  "keyword": "Given "
});
formatter.step({
  "line": 73,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 74,
  "name": "I enter \"sdk default groovy 2.0.5\"",
  "keyword": "When "
});
formatter.step({
  "line": 75,
  "name": "I see \"Stop! groovy 2.0.5 is not installed.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:30"
});
formatter.result({
  "duration": 2850742,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101029495,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk default groovy 2.0.5",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100311169,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! groovy 2.0.5 is not installed.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 50459,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nStop! groovy 2.0.5 is not installed.\n\n\n");
formatter.after({
  "duration": 856847,
  "status": "passed"
});
formatter.before({
  "duration": 2263222,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 10979065,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1518775,
  "status": "passed"
});
formatter.scenario({
  "line": 77,
  "name": "Default a candidate version that is installed and not default",
  "description": "",
  "id": "use-and-default-candidate;default-a-candidate-version-that-is-installed-and-not-default",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 78,
  "name": "the candidate \"groovy\" version \"2.0.5\" is a valid candidate version",
  "keyword": "Given "
});
formatter.step({
  "line": 79,
  "name": "the candidate \"groovy\" version \"2.0.5\" is already installed but not default",
  "keyword": "And "
});
formatter.step({
  "line": 80,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 81,
  "name": "I enter \"sdk default groovy 2.0.5\"",
  "keyword": "When "
});
formatter.step({
  "line": 82,
  "name": "I see \"Default groovy version set to 2.0.5\"",
  "keyword": "Then "
});
formatter.step({
  "line": 83,
  "name": "the candidate \"groovy\" version \"2.0.5\" should be the default",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:30"
});
formatter.result({
  "duration": 2932107,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 747385,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101049629,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk default groovy 2.0.5",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100304400,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Default groovy version set to 2.0.5",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 49388,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:30"
});
formatter.result({
  "duration": 128859,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nDefault groovy version set to 2.0.5\n\n\n");
formatter.after({
  "duration": 742430,
  "status": "passed"
});
formatter.before({
  "duration": 2671726,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13725657,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1401933,
  "status": "passed"
});
formatter.scenario({
  "line": 85,
  "name": "Default a candidate version that is installed and already default",
  "description": "",
  "id": "use-and-default-candidate;default-a-candidate-version-that-is-installed-and-already-default",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 86,
  "name": "the candidate \"groovy\" version \"2.0.5\" is a valid candidate version",
  "keyword": "Given "
});
formatter.step({
  "line": 87,
  "name": "the candidate \"groovy\" version \"2.0.5\" is already installed and default",
  "keyword": "And "
});
formatter.step({
  "line": 88,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 89,
  "name": "I enter \"sdk default groovy 2.0.5\"",
  "keyword": "When "
});
formatter.step({
  "line": 90,
  "name": "I see \"Default groovy version set to 2.0.5\"",
  "keyword": "Then "
});
formatter.step({
  "line": 91,
  "name": "the candidate \"groovy\" version \"2.0.5\" should be the default",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:30"
});
formatter.result({
  "duration": 3419602,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 432762,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101058498,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk default groovy 2.0.5",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100301491,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Default groovy version set to 2.0.5",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 74246,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.0.5",
      "offset": 32
    }
  ],
  "location": "use_steps.groovy:30"
});
formatter.result({
  "duration": 123907,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nDefault groovy version set to 2.0.5\n\n\n");
formatter.after({
  "duration": 842164,
  "status": "passed"
});
formatter.before({
  "duration": 2584237,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 12624263,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2073841,
  "status": "passed"
});
formatter.scenario({
  "line": 93,
  "name": "Default a candidate version that does not exist",
  "description": "",
  "id": "use-and-default-candidate;default-a-candidate-version-that-does-not-exist",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 94,
  "name": "the candidate \"groovy\" version \"2.9.9\" is not available for download",
  "keyword": "Given "
});
formatter.step({
  "line": 95,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 96,
  "name": "I enter \"sdk default groovy 2.9.9\"",
  "keyword": "When "
});
formatter.step({
  "line": 97,
  "name": "I see \"Stop! 2.9.9 is not a valid groovy version.\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "groovy",
      "offset": 15
    },
    {
      "val": "2.9.9",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:22"
});
formatter.result({
  "duration": 3213756,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101139839,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk default groovy 2.9.9",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100208658,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Stop! 2.9.9 is not a valid groovy version.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 51737,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\n\nStop! 2.9.9 is not a valid groovy version.\n\n\n");
formatter.after({
  "duration": 745533,
  "status": "passed"
});
formatter.before({
  "duration": 2267167,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11915114,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1325728,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 100,
      "value": "#scenarios related to updating _HOME variable"
    }
  ],
  "line": 102,
  "name": "Use an installed version of an installed candidate updates the candidate _HOME variable",
  "description": "",
  "id": "use-and-default-candidate;use-an-installed-version-of-an-installed-candidate-updates-the-candidate--home-variable",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 103,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 104,
  "name": "the candidate \"grails\" version \"2.1.0\" is already installed but not default",
  "keyword": "And "
});
formatter.step({
  "line": 105,
  "name": "the candidate \"grails\" version \"2.1.0\" is available for download",
  "keyword": "And "
});
formatter.step({
  "line": 106,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 107,
  "name": "the \"GRAILS_HOME\" variable contains \"grails/current\"",
  "keyword": "And "
});
formatter.step({
  "line": 108,
  "name": "I enter \"sdk use grails 2.1.0\"",
  "keyword": "When "
});
formatter.step({
  "line": 109,
  "name": "I see \"Using grails version 2.1.0 in this shell.\"",
  "keyword": "And "
});
formatter.step({
  "line": 110,
  "name": "the \"GRAILS_HOME\" variable contains \"grails/2.1.0\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 345250,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:35"
});
formatter.result({
  "duration": 316426,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 8806045,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 102078639,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "GRAILS_HOME",
      "offset": 5
    },
    {
      "val": "grails/current",
      "offset": 37
    }
  ],
  "location": "command_line_interop_steps.groovy:39"
});
formatter.result({
  "duration": 100518577,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails 2.1.0",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100230227,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Using grails version 2.1.0 in this shell.",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 33412,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "GRAILS_HOME",
      "offset": 5
    },
    {
      "val": "grails/2.1.0",
      "offset": 37
    }
  ],
  "location": "command_line_interop_steps.groovy:39"
});
formatter.result({
  "duration": 100233490,
  "status": "passed"
});
formatter.write("\nOutput: \n\n/tmp/sdkman-1286/.sdkman/candidates/grails/2.1.0\n\n\n");
formatter.after({
  "duration": 795991,
  "status": "passed"
});
formatter.before({
  "duration": 2477127,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11910164,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 2148697,
  "status": "passed"
});
formatter.scenario({
  "line": 112,
  "name": "Use an uninstalled version of an uninstalled candidate updates the candidate _HOME variable",
  "description": "",
  "id": "use-and-default-candidate;use-an-uninstalled-version-of-an-uninstalled-candidate-updates-the-candidate--home-variable",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 113,
  "name": "the candidate \"grails\" does not exist locally",
  "keyword": "Given "
});
formatter.step({
  "line": 114,
  "name": "the candidate \"grails\" version \"2.1.0\" is available for download",
  "keyword": "And "
});
formatter.step({
  "line": 115,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 116,
  "name": "the \"GRAILS_HOME\" variable is not set",
  "keyword": "And "
});
formatter.step({
  "line": 117,
  "name": "I enter \"sdk use grails 2.1.0\" and answer \"Y\"",
  "keyword": "When "
});
formatter.step({
  "line": 118,
  "name": "the \"GRAILS_HOME\" variable contains \"grails/2.1.0\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    }
  ],
  "location": "installation_steps.groovy:44"
});
formatter.result({
  "duration": 187807,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 8888578,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101119803,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "GRAILS_HOME",
      "offset": 5
    }
  ],
  "location": "command_line_interop_steps.groovy:44"
});
formatter.result({
  "duration": 100512497,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails 2.1.0",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 43
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100329449,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "GRAILS_HOME",
      "offset": 5
    },
    {
      "val": "grails/2.1.0",
      "offset": 37
    }
  ],
  "location": "command_line_interop_steps.groovy:39"
});
formatter.result({
  "duration": 100332453,
  "status": "passed"
});
formatter.write("\nOutput: \n\n/tmp/sdkman-1286/.sdkman/candidates/grails/2.1.0\n\n\n");
formatter.after({
  "duration": 728917,
  "status": "passed"
});
formatter.before({
  "duration": 2479157,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 13282416,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1396810,
  "status": "passed"
});
formatter.scenario({
  "line": 120,
  "name": "Use an uninstalled version of an installed candidate updates the candidate _HOME variable",
  "description": "",
  "id": "use-and-default-candidate;use-an-uninstalled-version-of-an-installed-candidate-updates-the-candidate--home-variable",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 121,
  "name": "the candidate \"grails\" version \"1.3.9\" is already installed and default",
  "keyword": "Given "
});
formatter.step({
  "line": 122,
  "name": "the candidate \"grails\" version \"2.1.0\" is available for download",
  "keyword": "And "
});
formatter.step({
  "line": 123,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.step({
  "line": 124,
  "name": "the \"GRAILS_HOME\" variable contains \"grails/current\"",
  "keyword": "And "
});
formatter.step({
  "line": 125,
  "name": "I enter \"sdk use grails 2.1.0\" and answer \"Y\"",
  "keyword": "When "
});
formatter.step({
  "line": 126,
  "name": "the \"GRAILS_HOME\" variable contains \"grails/2.1.0\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "1.3.9",
      "offset": 32
    }
  ],
  "location": "installation_steps.groovy:22"
});
formatter.result({
  "duration": 616358,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "grails",
      "offset": 15
    },
    {
      "val": "2.1.0",
      "offset": 32
    }
  ],
  "location": "stub_steps.groovy:17"
});
formatter.result({
  "duration": 14298402,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 103149689,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "GRAILS_HOME",
      "offset": 5
    },
    {
      "val": "grails/current",
      "offset": 37
    }
  ],
  "location": "command_line_interop_steps.groovy:39"
});
formatter.result({
  "duration": 100299601,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "sdk use grails 2.1.0",
      "offset": 9
    },
    {
      "val": "Y",
      "offset": 43
    }
  ],
  "location": "command_line_interop_steps.groovy:10"
});
formatter.result({
  "duration": 100313534,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "GRAILS_HOME",
      "offset": 5
    },
    {
      "val": "grails/2.1.0",
      "offset": 37
    }
  ],
  "location": "command_line_interop_steps.groovy:39"
});
formatter.result({
  "duration": 100309119,
  "status": "passed"
});
formatter.write("\nOutput: \n\n/tmp/sdkman-1286/.sdkman/candidates/grails/2.1.0\n\n\n");
formatter.after({
  "duration": 819099,
  "status": "passed"
});
formatter.uri("version.feature");
formatter.feature({
  "line": 1,
  "name": "Version",
  "description": "",
  "id": "version",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2476181,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "the internet is reachable",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "an initialised environment",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "the system is bootstrapped",
  "keyword": "And "
});
formatter.match({
  "location": "initialisation_steps.groovy:35"
});
formatter.result({
  "duration": 11386914,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:79"
});
formatter.result({
  "duration": 1303446,
  "status": "passed"
});
formatter.match({
  "location": "initialisation_steps.groovy:115"
});
formatter.result({
  "duration": 101114812,
  "status": "passed"
});
formatter.scenario({
  "line": 8,
  "name": "Show the current version of sdkman",
  "description": "",
  "id": "version;show-the-current-version-of-sdkman",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 9,
  "name": "I enter \"sdk version\"",
  "keyword": "When "
});
formatter.step({
  "line": 10,
  "name": "I see \"SDKMAN x.y.z\"",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "sdk version",
      "offset": 9
    }
  ],
  "location": "command_line_interop_steps.groovy:5"
});
formatter.result({
  "duration": 100247292,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "SDKMAN x.y.z",
      "offset": 7
    }
  ],
  "location": "command_line_interop_steps.groovy:15"
});
formatter.result({
  "duration": 99862,
  "status": "passed"
});
formatter.write("\nOutput: \n\nbroadcast message\nSDKMAN x.y.z\n\n\n");
formatter.after({
  "duration": 770966,
  "status": "passed"
});
});