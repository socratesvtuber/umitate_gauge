# umitate_gauge

妨害マイクラ用のデータパック。指定した箱の中がどれだけ埋まったかをボスバーで「埋め立て度」として表示する。

## 構成

- `pack.mcmeta` — データパックのメタ情報
- `data/umitate_gauge/function/load/main.mcfunction` — スコアボード・ボスバーの初期化
- `data/umitate_gauge/function/setup/set_corner1.mcfunction` — 立っている場所を1つ目の角として記録
- `data/umitate_gauge/function/setup/set_corner2.mcfunction` — 立っている場所を2つ目の角として記録し、合計マス数を自動計算
- `data/umitate_gauge/function/setup/calc_max_space.mcfunction` — 記録した2点から合計マス数を計算する内部処理
- `data/umitate_gauge/function/tick/main.mcfunction` — 毎tick、範囲が設定済みならゲージ更新処理を呼び出す
- `data/umitate_gauge/function/tick/count_air.mcfunction` — 記録した範囲内の空気ブロック数を数える（マクロ経由で座標を利用）
- `data/umitate_gauge/function/tick/update_gauge.mcfunction` — 埋め立て度(%)を計算してボスバーに反映

## 使い方

1. データパックを `datapacks` フォルダに配置し、`/reload`(または再起動)
2. 箱の1つ目の角のブロックの**真上に乗って**以下を実行

   ```
   /function umitate_gauge:setup/set_corner1
   ```

3. 箱の対角にあたる、もう1つの角のブロックの**真上に乗って**以下を実行

   ```
   /function umitate_gauge:setup/set_corner2
   ```

   → この時点で計測範囲と合計マス数が自動計算され、ボスバーの表示が始まります。

4. 以降はブロックを置くたびに「埋め立て度: 〇%(〇/〇個)」がリアルタイムで更新されます。

※ 座標はコマンド実行時のプレイヤーの足元位置から自動取得するため、手入力は不要です（Y座標は「乗っているブロックの1つ上」になる分を自動で補正しています）。範囲を変更したい場合は、あらためて `set_corner1` / `set_corner2` を実行し直せば上書きされます。
