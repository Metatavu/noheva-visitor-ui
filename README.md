# Noheva Visitor UI

Noheva visitor UI project


## Activate RPS

`dart pub global activate rps --version 0.7.0-dev.6`
Used for running scrips in pubspec.yaml
For example run code generation with
`rps gen`

## Generate API client
`flutter pub run build_runner build --delete-conflicting-outputs`

## Defining a new database table
  1. Create the table model in `lib/database/models/tables`
  2. Run `rps gen` to generate the table definition
  3. Append it into `@DriftDatabase` annotation within `lib/database/database.dart`
  4. Bump the schema version in `lib/database/database.dart`
  5. Create new migrations.

## Silent Master Branch

This repository includes a `master-silent` branch, used to publish APKs **without** uploading the `output-metadata.json` file. This prevents automated device updates from being triggered, allowing for silent or internal distribution of builds when needed.