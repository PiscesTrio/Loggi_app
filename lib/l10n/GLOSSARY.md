# Glossary

The words this app must use the same way every time.

Written before `app_ja.arb`, not after. 142 entries translated one at a time drift: 倉庫 in one
screen and 保管庫 in the next is not a grammar mistake and a spell-checker will not see it, but
it is the first thing a native reader notices — it reads as software nobody owns.

Logistics has settled vocabulary in Japanese, so most of these are lookups rather than choices.
The ones that were choices say why.

| 中文 | English | 日本語 | |
|---|---|---|---|
| 入库 | stock in | 入庫 | |
| 出库 | stock out | 出庫 | |
| 库存 | stock | 在庫 | |
| 仓库 | warehouse | 倉庫 | |
| 商品 | commodity | 商品 | |
| 配送 | delivery | 配送 | |
| 配送单 | delivery order | 配送依頼 | 伝票 is the physical slip; this is the request |
| 驾驶员 | driver | ドライバー | the tracking screens were written in Japanese and used this, not 運転手 |
| 车辆 | vehicle | 車両 | |
| 车牌号 | plate | 車両番号 | ナンバープレート is the object; the field holds its number |
| 负责人 | contact | 担当者 | |
| 客户地址 | address | お届け先 | the delivery destination, not the customer's residence |
| 数量 | quantity | 数量 | |
| 单价 | unit price | 単価 | |
| 备注 | note | 備考 | |
| 加急 | urgent | 至急 | |
| 注意事项 | handling | 取扱注意 | the handling marks; ISO 780 calls them handling instructions |
| 审核 | review | 審査 | |
| 送达 | delivered | 配達完了 | but the tracking timeline says 配送完了 — see below |
| 操作日志 | operation log | 操作ログ | |

## Two deliberate inconsistencies

**配送完了 vs 配達完了.** The tracking timeline's final step is 配送完了 and the order action is
配達完了にする. Both are correct and they are not the same event: the first is the carrier's leg
finishing, the second is the parcel reaching the recipient. Kept apart because the screens mean
different things by them.

**Vehicle types.** `LIGHT_TRUCK` / `TRUCK` / `HEAVY_TRUCK` are 小型トラック / トラック /
大型トラック, not the Japanese road-classification terms (準中型・中型・大型), which are licence
categories rather than vehicle sizes. `driver.license` already holds real licence categories
(第一種大型) and those are data, not interface — they are never translated.

## Care tags

The eight handling instructions are ISO 780 marks, so the Japanese is the standard's own wording
rather than a translation of the Chinese:

| identifier | 中文 | 日本語 |
|---|---|---|
| `FRAGILE` | 易碎 | 割れ物注意 |
| `KEEP_DRY` | 防潮 | 水濡れ注意 |
| `KEEP_AWAY_FROM_SUNLIGHT` | 防晒 | 直射日光禁止 |
| `PROTECT_FROM_HEAT` | 防高温 | 高温注意 |
| `DO_NOT_ROLL` | 禁止翻滚 | 転がし厳禁 |
| `DO_NOT_STACK` | 禁止堆码 | 積み重ね禁止 |
| `REFRIGERATE` | 冷藏 | 要冷蔵 |
| `FLAMMABLE` | 易燃 | 可燃物 |

## What is never translated

Warehouse names, driver names, plates, commodity names, addresses, and `driver.license`. They are
Japanese already because the data is Japanese — that is content the user entered, and it stays
identical in all three languages. `出典：国土地理院` on the map is the tile licence's required
wording and stays too.
