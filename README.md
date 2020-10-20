# luftcare_flutter_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

-   [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
-   [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our [online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile
development, and a full API reference.

## Downloading the Graphql schema

```bash
yarn global add apollo
apollo client:download-schema --endpoint=http://localhost:5000 schema.graphql
```

## Generating the types

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Generating the Android App Bundle

```bash
flutter build appbundle
```

Then go to https://play.google.com/console and upload the App Bundle generated in build/app/outputs/bundle/release/app-release.aab.