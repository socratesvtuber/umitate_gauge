# 使い方: /function umitate_gauge:setup/load_box {slot:"名前"}
# 保存済みの範囲(umitate_gauge:boxes内の指定名)を、現在の計測範囲(umitate_gauge:box)に反映する

$execute store success score #load_ok current_blocks run data modify storage umitate_gauge:box set from storage umitate_gauge:boxes $(slot)

execute if score #load_ok current_blocks matches 1 run function umitate_gauge:setup/sync_scores_from_box
execute if score #load_ok current_blocks matches 1 run function umitate_gauge:setup/calc_max_space
execute if score #load_ok current_blocks matches 1 run tellraw @a [{"text":"[埋め立てゲージ] 計測範囲を切り替えました。合計マス数: ","color":"green"},{"score":{"name":"#max_space","objective":"current_blocks"},"color":"gold"},{"text":"個"}]
execute if score #load_ok current_blocks matches 0 run tellraw @s [{"text":"[埋め立てゲージ] 指定した名前の保存枠が見つかりません","color":"red"}]
