# PriPoCoG[^1] Privacy Policy Interface

This is a privacy policy interface for [P-LPL](https://github.com/jensLeicht/P-LPL)[^2] privacy policies.
Data subjects can customise their privacy policy according to their preferences, disabling purposes, data, or data recipients.

As the policy interface is part of PriPoCoG[^1], the policies can be:
- edited/defined,
- initialised from data flow diagrams,
- checked for GDPR compliance,
- managed, and
- enforced.

The research that went into the development of this interface is published in the following paper:

`Leicht Jens and Lukasewycz Julien and Heisel Maritta, (2025), "PriPoCoG: Empowering End-Users’ Data Protection Decisions", In Proceedings of the 27th International Conference on Enterprise Information Systems - Volume 2, ISBN 978-989-758-749-8, ISSN 2184-4992, pages 673-684`

## Online Demo

Before setting up your own instance, you can try our online demo over at: https://pripocog.leicht.ruhr/

## Prerequisites

The privacy policy interface requires the PriPoCoG Prolog backend to be operational.
Check out the corresponding [repository](https://github.com/jensLeicht/PriPoCoG) for backend setup instructions.

## Running the policy interface locally

- set up a flutter development environment according to the flutter documentation: https://docs.flutter.dev/get-started/install
- open the Privacy Policy Interface repository
- place your own logo in the `assets` folder
- adjust the `assets/config.json`:
    - configure your homepage URL, used when clicking on the logo in the top left corner
    - adjust the logo name according to the logo you placed in the `assets` folder
    - configure the URL of the full text privacy policy
- if your backend is not running on the same machine:

    configure `lib/components/network.dart` according to your backend configuration
- run `flutter build web`
- run `flutter run`
- select one of the available browsers for the web application

## Policy Definition and Editing

You can define your own privacy policy or edit the example policy using the PriPoCoG [Privacy Policy Editor](https://github.com/jensLeicht/PrivacyPolicyEditor).

## How to Cite

`Leicht Jens and Lukasewycz Julien, PriPoCoG Privacy Policy Interface, Zenodo, 2025, doi: 10.5281/zenodo.15125961`

[^1]: Privacy Policy Compliance Guidance framework
[^2]: Prolog - Layered Privacy Language