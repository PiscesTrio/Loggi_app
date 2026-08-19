# Generated API models

Do not edit anything in this directory. Every file is produced by
`openapi-generator` from the backend's own OpenAPI document, and any edit is lost the
next time it runs.

## Why generated

The contract used to exist in three copies that had to be kept in step by hand: the
backend's controllers, this client's hand-written `fromJson` methods, and whatever a
developer remembered. Nothing checked them against each other, so a rename on one side
showed up on the other as a field that silently became null — which is exactly what
happened to `busincessType`, and to every field S09 and S10 moved.

Generating them removes the copy. The backend derives the document from its own
controllers, so the document cannot drift from the server; this directory is derived
from the document, so it cannot drift from either.

## Regenerating

With the backend running:

```bash
curl -s http://127.0.0.1:8088/v3/api-docs -o tool/openapi.json
npx --yes @openapitools/openapi-generator-cli generate \
  -i tool/openapi.json -g dart-dio -o build/openapi-gen \
  --global-property models,modelDocs=false,modelTests=false \
  --additional-properties=serializationLibrary=json_serializable,pubName=loggi_api
cp build/openapi-gen/lib/src/model/*.dart lib/app/data/api/
dart run build_runner build --delete-conflicting-outputs
```

`tool/openapi.json` is committed, so the models can be regenerated without a running
server and a diff on that file shows exactly what the contract change was.

## What is not generated

Only models. The Dio client, the interceptors and the error handling are hand-written
in `lib/app/data/network/` and stay that way: they carry decisions a generator has no
way to know about — unwrapping the response envelope, turning a failure into an
`ApiException` carrying the server's own message, and handling a 401 exactly once.
