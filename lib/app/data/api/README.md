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
# Pretty-printed on the way in: springdoc answers with one long line, and a one-line file
# has no reviewable diff — which is the whole point of committing it.
#
# The second command re-pins servers[].url. springdoc fills it with whatever host answered,
# so without this the address of somebody's machine lands in a public file — which is exactly
# what happened, for twelve commits. test/contract/openapi_host_test.dart fails if it recurs.
curl -s http://localhost:8088/v3/api-docs | python -m json.tool > tool/openapi.json
python -c "import io,json;p='tool/openapi.json';d=json.load(io.open(p,encoding='utf-8'));d['servers']=[{'url':'http://localhost:8088','description':'Generated server url'}];f=io.open(p,'w',encoding='utf-8',newline='\n');json.dump(d,f,indent=4,ensure_ascii=False);f.write('\n')"

npx --yes @openapitools/openapi-generator-cli generate \
  -i tool/openapi.json -g dart-dio -o build/openapi-gen \
  --global-property models,modelDocs=false,modelTests=false \
  --additional-properties=serializationLibrary=json_serializable,pubName=loggi_api

cp build/openapi-gen/lib/src/model/*.dart lib/app/data/api/
rm -f lib/app/data/api/response_result_*.dart
python - <<'PY'
import pathlib, re
for p in pathlib.Path('lib/app/data/api').glob('*.dart'):
    s = p.read_text(encoding='utf-8')
    t = re.sub(r"import 'package:loggi_api/src/model/([a-z0-9_]+\.dart)';", r"import '\1';", s)
    if t != s:
        p.write_text(t, encoding='utf-8', newline='\n')
PY

dart format lib/app/data/api/
dart run build_runner build --delete-conflicting-outputs
```

### The two steps that look optional

**`rm response_result_*.dart`** — the document declares a `ResponseResult<T>` wrapper for
every endpoint, because that is what the server literally returns, so the generator emits
28 envelope models on top of the 36 real ones. Nothing here uses them: the envelope
interceptor unwraps the response before a repository ever sees it.

**Rewriting the imports** — a model that references another comes out importing
`package:loggi_api/src/model/x.dart`, a package this app does not depend on. They sit
beside each other in one directory, so the import should be relative.

Neither failure reaches `flutter analyze`. **This directory is excluded from analysis in
`analysis_options.yaml`, so an unresolved import here produces no output at all** — a green
analyzer says nothing about these files. `build_runner` is the only thing that reads them,
and it reports the symptom (`Could not generate fromJson code for driver`) rather than the
cause.

`tool/openapi.json` is committed, so the models can be regenerated without a running
server and a diff on that file shows exactly what the contract change was.

## What is not generated

Only models. The Dio client, the interceptors and the error handling are hand-written
in `lib/app/data/network/` and stay that way: they carry decisions a generator has no
way to know about — unwrapping the response envelope, turning a failure into an
`ApiException` carrying the server's own message, and handling a 401 exactly once.
