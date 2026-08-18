# dx = |x2 - x1| + 1
scoreboard players operation #dx current_blocks = #x2 current_blocks
scoreboard players operation #dx current_blocks -= #x1 current_blocks
execute if score #dx current_blocks matches ..-1 run scoreboard players operation #dx current_blocks *= #neg1 current_blocks
scoreboard players add #dx current_blocks 1

# dy = |y2 - y1| + 1
scoreboard players operation #dy current_blocks = #y2 current_blocks
scoreboard players operation #dy current_blocks -= #y1 current_blocks
execute if score #dy current_blocks matches ..-1 run scoreboard players operation #dy current_blocks *= #neg1 current_blocks
scoreboard players add #dy current_blocks 1

# dz = |z2 - z1| + 1
scoreboard players operation #dz current_blocks = #z2 current_blocks
scoreboard players operation #dz current_blocks -= #z1 current_blocks
execute if score #dz current_blocks matches ..-1 run scoreboard players operation #dz current_blocks *= #neg1 current_blocks
scoreboard players add #dz current_blocks 1

# 合計マス数 = dx * dy * dz
scoreboard players operation #max_space current_blocks = #dx current_blocks
scoreboard players operation #max_space current_blocks *= #dy current_blocks
scoreboard players operation #max_space current_blocks *= #dz current_blocks

scoreboard players set #configured current_blocks 1
