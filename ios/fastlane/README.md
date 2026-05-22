fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios create_app

```sh
[bundle exec] fastlane ios create_app
```

Create app on App Store Connect

### ios register_devices

```sh
[bundle exec] fastlane ios register_devices
```

Register devices

### ios beta

```sh
[bundle exec] fastlane ios beta
```

Build and upload to TestFlight

### ios release

```sh
[bundle exec] fastlane ios release
```

Build and upload to App Store

### ios screenshots

```sh
[bundle exec] fastlane ios screenshots
```

Take screenshots

### ios set_app_privacy

```sh
[bundle exec] fastlane ios set_app_privacy
```

Set App Privacy declarations (iris API, requires Apple ID interactive login)

Apple ID JWT keys NÃO funcionam pra App Privacy — só cookie session do ASC web UI.

Run: FASTLANE_USER=pierrondi@gmail.com bundle exec fastlane set_app_privacy

### ios submit_review

```sh
[bundle exec] fastlane ios submit_review
```

Submit ProvadorIA build 5 for App Review

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
