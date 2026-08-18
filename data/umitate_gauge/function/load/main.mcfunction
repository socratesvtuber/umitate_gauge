# スコアボードとボスバーの初期化
scoreboard objectives add current_blocks dummy
bossbar add fill_gauge "埋め立て度"
bossbar set minecraft:fill_gauge color green
bossbar set minecraft:fill_gauge players @a

# 計算用の固定数値
scoreboard players set #100 current_blocks 100
scoreboard players set #neg1 current_blocks -1

# 計測範囲の設定状態（0=未設定 / 1=設定済み）
scoreboard players set #configured current_blocks 0

# 角の座標・合計マス数の初期値（未設定時のダミー値）
scoreboard players set #x1 current_blocks 0
scoreboard players set #y1 current_blocks 0
scoreboard players set #z1 current_blocks 0
scoreboard players set #x2 current_blocks 0
scoreboard players set #y2 current_blocks 0
scoreboard players set #z2 current_blocks 0
scoreboard players set #max_space current_blocks 1

bossbar set minecraft:fill_gauge name [{"text":"埋め立て度: 未設定（setup/set_corner1 と setup/set_corner2 で範囲を設定してください）","color":"red"}]
