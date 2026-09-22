# Loggi App

[![Frontend CI](https://github.com/PiscesTrio/Loggi_app/actions/workflows/frontend-ci.yml/badge.svg)](https://github.com/PiscesTrio/Loggi_app/actions/workflows/frontend-ci.yml)
[![Flutter](https://img.shields.io/badge/Flutter-3.47-informational)](https://flutter.dev/)
[![License](https://img.shields.io/badge/License-MIT-informational)](LICENSE)

[English](README.md) · [日本語](README.ja.md)

> デプロイに耐える作りにはしていない。実データには接続しないこと。

物流管理システムの Flutter クライアント。倉庫と在庫、商品、配送依頼とその追跡、車両と
ドライバー、分析、監査ログを扱う。

> バックエンドのリポジトリ: https://github.com/PiscesTrio/Loggi_server

`lib/app/data/api/` のモデルは**バックエンドの OpenAPI ドキュメントから生成している** —
[API モデルの再生成](#api-モデルの再生成)を参照。生成物はコミットしてあるので、クローン
しただけでジェネレータを走らせずにビルドできる。

## 技術スタック

| | |
|---|---|
| **Flutter** | Dart 3 (`sdk: ^3.13.0`) |
| **状態管理** | `flutter_riverpod` — `AsyncNotifier` / `AsyncValue` |
| **ルーティング** | `go_router` — タブは `StatefulShellRoute`、認証ゲートは `redirect` |
| **HTTP** | `dio` + `dio_smart_retry`。自前の `ApiClient` の内側 |
| **モデル** | `openapi-generator` が生成（`dart-dio`, `json_serializable`） |
| **認証情報** | `flutter_secure_storage` — Keystore / Keychain |
| **地図** | 国土地理院タイルの上に `flutter_map` |
| **グラフ** | `fl_chart` |
| **i18n** | `lib/l10n/*.arb` から `flutter gen-l10n` — 日本語 / 中文 / English、フォールバックは `ja` |

`get` と `get_storage` が `pubspec.yaml` に残っているのは、まだ GetX のままの画面が一つ
（ログイン）あることと、移行中に旧トークンを読むためである。それ以外はすべて移行済み。

## 主な機能

- **ログイン** — パスワード、またはメールで届く認証コード。JWT はプラットフォームの
  キーストアに保管し、インターセプタが付与するので、どの画面も JWT を扱わない。
- **マスタ管理** — 商品と倉庫。それぞれ一覧と編集画面を持つ。
- **在庫** — 倉庫が何をどれだけ保有しているか、および入庫・出庫の記録。
- **配送** — 配送依頼の一覧と作成、地図上の追跡タイムライン。
- **車両とドライバー** — それぞれの一覧と管理。
- **分析** — 商品別の入出庫。
- **監査** — ログイン履歴と操作ログ。
- **言語** — 日本語・中文・English。設定画面で切り替えられ、選択は再起動後も残る。
  [言語](#言語)を参照。

## セットアップ

### 前提条件

- Dart 3 を含む Flutter（`flutter --version`）
- Android / iOS の実機またはエミュレータ
- 動作中の [Loggi Server](https://github.com/PiscesTrio/Loggi_server) — その README に
  `docker compose up` の手順がある

### 設定

バックエンドのアドレスはビルド時に注入する。ソースの中にアドレスは無く、同期を取るべき
二つ目の写しも無い。読むのは `lib/app/config/app_config.dart` だけである。

| 変数 | 既定値 | 意味 |
|---|---|---|
| `API_BASE_URL` | Android エミュレータから見たホストの別名、ポート 8088 | API のルート。組み込みの既定値は、同じマシン上のバックエンドと話すエミュレータにしか合わない。それ以外では明示的に渡すこと。 |
| `ENFORCE_HTTPS` | `false` | 平文のエンドポイントに対しては起動を拒否する。リリースビルドでは渡すこと。 |
| `ENABLE_FLUTTER_DRIVER` | `false` | flutter_driver の拡張を開く。有効な間、端末は実際のキーボード入力を受け付けなくなる。これはドライバの `enterText` が乗っ取っているためで、不具合ではない。 |

### 実行

```bash
flutter pub get

# Android エミュレータ、バックエンドはこのマシン。
# EMULATOR_HOST はエミュレータから見たホストの別名 — 標準の Android
# エミュレータなら 10.0.2.x、他のものでは異なる。
flutter run --dart-define=API_BASE_URL=http://EMULATOR_HOST:8088/api

# USB 接続の実機、バックエンドはこのマシン
adb reverse tcp:8088 tcp:8088
# 127.0.0.1 は文字どおり。adb reverse は端末自身のそのポートを転送する。
flutter run --dart-define=API_BASE_URL=http://127.0.0.1:8088/api

# 実機、バックエンドは LAN 上の別ホスト — トンネルは要らない
flutter run --dart-define=API_BASE_URL=http://LAN_HOST:8088/api

# リリース
flutter build apk \
  --dart-define=API_BASE_URL=https://api.example.com/api \
  --dart-define=ENFORCE_HTTPS=true
```

初期データのデモアカウントは `demo@loggi.example` / `demo1234`。

### チェック

```bash
flutter analyze     # クリーンであること。CI は warning も info も落とす
flutter test
dart format --set-exit-if-changed .
```

CI が走らせるのはこの三つだけで、他には何もしない。`flutter test` はテストの実行であると
同時にローカライズのゲートでもある — 何を守っているかは[言語](#言語)に書いた。CI の
スクリプトではなくテストとして書いてあるのは意図的である。スクリプトはプッシュの後に走るが、
これらはその前に、壊した本人のマシンで走るからだ。

## ディレクトリ構成

```
lib/
├── main.dart                      # ProviderScope とセキュアストレージの初期化
├── my_app.dart                    # MaterialApp.router: テーマ、ロケール、デリゲート
├── l10n/                          # app_ja/zh/en.arb、GLOSSARY.md、context.l10n 拡張
├── features/                      # ドメインごとの画面と、それらが共有するラベル表
│   ├── warehouse/                 # 倉庫一覧、在庫、入出庫ダイアログ
│   ├── product/                   # 商品の一覧と編集
│   ├── chart/                     # 入庫・出庫の分析
│   ├── log/                       # 一つの画面に両方のログ
│   ├── settings/                  # システム設定と言語選択
│   ├── shell/                     # タブシェルとページヘッダ
│   ├── fleet/                     # 車両とドライバーのラベル
│   ├── errors/                    # サーバーのエラーコードを読み手の言語で
│   └── distribution/              # 取扱注意（API 上の値と表示ラベル）
└── app/
    ├── config/app_config.dart     # コンパイル時設定。読むのは一度だけ
    ├── auth/                      # ルータがリダイレクト判断に使うログイン状態
    ├── router/                    # go_router: シェル、ブランチ、認証リダイレクト
    ├── theme/                     # AppTheme, ColorPalette, StatusColors, ChartPalette
    ├── data/
    │   ├── api/                   # 生成された 36 モデル — 手で編集しない
    │   ├── network/               # ApiClient、ApiException、エンベロープと認証のインターセプタ
    │   ├── repositories/          # ドメインごとに一つ。ApiClient を呼ぶ唯一の層
    │   ├── auth/token_storage.dart
    │   └── map/                   # タイルの提供元と出典表示
    └── modules/                   # 未移行: ログイン、配送、ドライバー、車両
```

二つのディレクトリが同時に存在しているのは意図的である。画面が属すべき場所は `features/`
で、`app/modules/` は GetX 時代の配置の名残であり、スライスを一つ進めるごとに小さくなる。
まだ残っていて、いずれもルーティングされているのは `login`、配送の三画面
（`distribution_list`、`distribution_apply`、`distribution_status`）、`driver_list`、
`vehicle_list` である。

`features/fleet/` と `features/errors/` は画面を持たない。上記の旧画面が読むラベル表と
メッセージ表である。文字列を画面より先に切り出したからこそ、移行を待たずにローカライズ
できた。

## 画面の組み立て

```
screen (ConsumerWidget)
  └─ ref.watch(someProvider)          AsyncValue<T>: loading / data / error、三状態すべて処理
       └─ Notifier                    画面が取れるアクション
            └─ Repository             ApiClient と話す唯一のもの
                 └─ ApiClient         + インターセプタ: Bearer、エンベロープ、リトライ
```

リポジトリより上は HTTP を知らず、リポジトリより下はウィジェットを知らない。三つの状態は
`AsyncView` ウィジェットが描画するので、画面ごとに独自の実装が生まれることはない。エラー
状態にはサーバー自身のメッセージが出る — エンベロープのインターセプタが `msg` から読み、
リポジトリが例外を `null` に畳まずそのまま通すので、メッセージは途中で失われない。

## 言語

日本語・中文・English の三つ。キーは各言語 180 個、ARB ファイルは言語ごとに一つで、どれにも
当たらない端末では `ja` にフォールバックする。設定画面で切り替えられ、選択は再起動後も
残る。三言語を揃えているのは `flutter test` で走る三つのテストファイルで、キーの過不足と
空項目、画面に残った CJK リテラル、そして全言語で描画したカードがはみ出したり見切れたり
しないことをそれぞれ見ている。用語は `lib/l10n/GLOSSARY.md` が先に固定しているので、同じ語は
どの画面でも同じ語である。

## API モデルの再生成

`lib/app/data/api/` は生成物であり、コミットされている。バックエンドの API 仕様が変わったら
生成し直す:

```bash
# 1. 動作中のバックエンドからドキュメントを取得し、そこに書かれるホストを固定し直す。
#    springdoc は応答したマシンをそのまま書くが、このファイルはコミットされ公開される。
curl -s http://localhost:8088/v3/api-docs | python -m json.tool > tool/openapi.json
python -c "import io,json;p='tool/openapi.json';d=json.load(io.open(p,encoding='utf-8'));d['servers']=[{'url':'http://localhost:8088','description':'Generated server url'}];f=io.open(p,'w',encoding='utf-8',newline='\n');json.dump(d,f,indent=4,ensure_ascii=False);f.write('\n')"

# 2. モデルだけを生成する — ApiClient とそのインターセプタは手書きであり、そのまま残す
npx @openapitools/openapi-generator-cli generate \
  -i tool/openapi.json -g dart-dio -o build/openapi-gen \
  --global-property models \
  --additional-properties=serializationLibrary=json_serializable

# 3. コピーして取り込む
cp build/openapi-gen/lib/src/model/*.dart lib/app/data/api/
dart run build_runner build --delete-conflicting-outputs
```

詳細は `lib/app/data/api/README.md` にある。このディレクトリは `analysis_options.yaml` で
解析対象から除外している。

## ライセンス

MIT — [LICENSE](LICENSE) を参照。
