# umitate_gauge

妨害マイクラ用のデータパック。指定した箱の中がどれだけ埋まったかをボスバーで「埋め立て度」として表示する。

## 構成

- `pack.mcmeta` — データパックのメタ情報
- `data/umitate_gauge/function/load/main.mcfunction` — スコアボード・ボスバーの初期化
- `data/umitate_gauge/function/setup/set_corner1.mcfunction` — 立っている場所を1つ目の角として記録
- `data/umitate_gauge/function/setup/set_corner2.mcfunction` — 立っている場所を2つ目の角として記録し、合計マス数を自動計算
- `data/umitate_gauge/function/setup/calc_max_space.mcfunction` — 記録した2点から合計マス数を計算する内部処理
- `data/umitate_gauge/function/setup/save_box.mcfunction` — 現在の計測範囲を任意の名前で保存
- `data/umitate_gauge/function/setup/load_box.mcfunction` — 保存済みの範囲を呼び出して即座に切り替え
- `data/umitate_gauge/function/setup/sync_scores_from_box.mcfunction` — 読み込んだ範囲をスコアボードへ反映する内部処理
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

## 複数の箱を保存して瞬時に切り替える

箱の大きさを変えたときや、別の箱の場所にテレポートしたときに、座標を取り直さずに一発で切り替えられます。

1. `set_corner1` / `set_corner2` で範囲を設定したあと、好きな名前を付けて保存

   ```
   /function umitate_gauge:setup/save_box {slot:"a"}
   ```

2. 別の箱でも同様に `set_corner1` / `set_corner2` → 別名で保存を繰り返す

   ```
   /function umitate_gauge:setup/save_box {slot:"b"}
   ```

3. 切り替えたいときは、名前を指定して読み込むだけ(移動不要・座標の取り直し不要)

   ```
   /function umitate_gauge:setup/load_box {slot:"a"}
   ```

   → 合計マス数も保存時の値がそのまま復元され、ボスバーの表示も即座に切り替わります。

名前(`slot`)は `"a"` `"b"` `"pond"` など好きな文字列でOKで、保存できる箱の数に制限はありません。同じ名前で `save_box` すると上書き保存されます。
