# umitate_gauge:box ストレージの座標を、計算用スコアボードへ反映する
execute store result score #x1 current_blocks run data get storage umitate_gauge:box x1
execute store result score #y1 current_blocks run data get storage umitate_gauge:box y1
execute store result score #z1 current_blocks run data get storage umitate_gauge:box z1
execute store result score #x2 current_blocks run data get storage umitate_gauge:box x2
execute store result score #y2 current_blocks run data get storage umitate_gauge:box y2
execute store result score #z2 current_blocks run data get storage umitate_gauge:box z2
