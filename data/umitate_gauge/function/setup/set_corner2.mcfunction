# 立っているブロックの真上を基準に、足元の座標から2つ目の角を記録する
execute store result score #x2 current_blocks run data get entity @s Pos[0] 1
execute store result score #y2 current_blocks run data get entity @s Pos[1] 1
scoreboard players remove #y2 current_blocks 1
execute store result score #z2 current_blocks run data get entity @s Pos[2] 1

execute store result storage umitate_gauge:box x2 int 1 run scoreboard players get #x2 current_blocks
execute store result storage umitate_gauge:box y2 int 1 run scoreboard players get #y2 current_blocks
execute store result storage umitate_gauge:box z2 int 1 run scoreboard players get #z2 current_blocks

function umitate_gauge:setup/calc_max_space

tellraw @s [{"text":"[埋め立てゲージ] 2つ目の角を記録しました。計測範囲の合計マス数: ","color":"green"},{"score":{"name":"#max_space","objective":"current_blocks"},"color":"gold"},{"text":"個"}]
