# 立っているブロックの真上を基準に、足元の座標から1つ目の角を記録する
# （プレイヤーの足元Y座標は「乗っているブロックの1つ上」になるため、Yは-1補正する）
execute store result score #x1 current_blocks run data get entity @s Pos[0] 1
execute store result score #y1 current_blocks run data get entity @s Pos[1] 1
scoreboard players remove #y1 current_blocks 1
execute store result score #z1 current_blocks run data get entity @s Pos[2] 1

execute store result storage umitate_gauge:box x1 int 1 run scoreboard players get #x1 current_blocks
execute store result storage umitate_gauge:box y1 int 1 run scoreboard players get #y1 current_blocks
execute store result storage umitate_gauge:box z1 int 1 run scoreboard players get #z1 current_blocks

tellraw @s [{"text":"[埋め立てゲージ] 1つ目の角を記録しました: ","color":"green"},{"score":{"name":"#x1","objective":"current_blocks"}},{"text":", "},{"score":{"name":"#y1","objective":"current_blocks"}},{"text":", "},{"score":{"name":"#z1","objective":"current_blocks"}}]
