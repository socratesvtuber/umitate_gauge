# 使い方: /function umitate_gauge:setup/save_box {slot:"名前"}
# 現在設定中の計測範囲(umitate_gauge:box)を、任意の名前で umitate_gauge:boxes に保存する

execute unless score #configured current_blocks matches 1 run tellraw @s [{"text":"[埋め立てゲージ] 先に setup/set_corner1 と setup/set_corner2 で範囲を設定してください","color":"red"}]

$execute if score #configured current_blocks matches 1 run data modify storage umitate_gauge:boxes $(slot) set from storage umitate_gauge:box
execute if score #configured current_blocks matches 1 run tellraw @s [{"text":"[埋め立てゲージ] 現在の範囲を保存しました","color":"green"}]
