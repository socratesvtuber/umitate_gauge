# スコアボードとボスバーの初期化
scoreboard objectives add current_blocks dummy
bossbar add fill_gauge "埋め立て度"
bossbar set minecraft:fill_gauge color green
bossbar set minecraft:fill_gauge players @a

# 計算用の固定数値を設定（100倍用）
scoreboard players set #100 current_blocks 100

# ★あなたの箱の「合計マス数」をここに書く（例は1000マス）
scoreboard players set #max_space current_blocks 441
