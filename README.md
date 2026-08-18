# umitate_gauge

妨害マイクラ用のデータパック。指定した箱の中がどれだけ埋まったかをボスバーで「埋め立て度」として表示する。

## 構成

- `pack.mcmeta` — データパックのメタ情報
- `data/umitate_gauge/function/load/main.mcfunction` — スコアボード・ボスバーの初期化、箱の合計マス数(`#max_space`)の設定
- `data/umitate_gauge/function/tick/main.mcfunction` — 指定範囲のブロックをカウントし、埋め立て度(%)をボスバーに反映

## 使い方

`load/main.mcfunction` 内の `#max_space` の値（現在は441）を、実際の箱の合計マス数に合わせて書き換える。
`tick/main.mcfunction` 内の `clone` 座標範囲を、計測したい箱の範囲に合わせて書き換える。
