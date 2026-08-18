# 1. 指定した範囲のブロック数を数えて上空（0 250 0）にクローン
execute store result score #total current_blocks run clone -16 76 -3 -11 68 3 0 250 0 filtered air normal

# 2. ％（パーセント）の計算
execute store result score #percent current_blocks run scoreboard players operation #total current_blocks *= #100 current_blocks
execute store result score #percent current_blocks run scoreboard players operation #total current_blocks /= #max_space current_blocks

# 3. ボスバーのゲージの長さを更新
execute store result bossbar minecraft:fill_gauge value run scoreboard players get #percent current_blocks

# 4. ボスバーのテキストをリアルタイムに書き換える
bossbar set minecraft:fill_gauge name [{"text":"埋め立て度: "},{"score":{"name":"#percent","objective":"current_blocks"},"color":"green"},{"text":"% ("},{"score":{"name":"#total","objective":"current_blocks"},"color":"gold"},{"text":" / "},{"score":{"name":"#max_space","objective":"current_blocks"},"color":"aqua"},{"text":"個)"}]
