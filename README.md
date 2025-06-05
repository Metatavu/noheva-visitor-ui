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

## Synchronize environment variables

Proceed with the following steps to get started:

1. Install Hashicorp vault CLI by referencing the official documentation here: [Hashicorp Vault CLI Install](https://developer.hashicorp.com/vault/install)
2. Install withhcv helper script (https://github.com/Metatavu/development-scripts/blob/master/hcv/withhcv.sh)
3. Run `withhcv vault kv get -format json -mount="digimatka/noheva/local/kv" "build-noheva-visitor-ui"|jq -r '.data.data | to_entries[] | "\(.key)=\(.value)"' > .env`
