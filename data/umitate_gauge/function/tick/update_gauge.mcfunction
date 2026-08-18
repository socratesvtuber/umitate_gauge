# 埋まっているブロック数 = 合計マス数 − 空気ブロック数
scoreboard players operation #filled current_blocks = #max_space current_blocks
scoreboard players operation #filled current_blocks -= #air current_blocks

# ％（パーセント）の計算（#filledは個数表示用に上書きせず残す）
scoreboard players operation #percent current_blocks = #filled current_blocks
scoreboard players operation #percent current_blocks *= #100 current_blocks
scoreboard players operation #percent current_blocks /= #max_space current_blocks

# ボスバーのゲージの長さを更新
execute store result bossbar minecraft:fill_gauge value run scoreboard players get #percent current_blocks

# ボスバーのテキストをリアルタイムに書き換える
bossbar set minecraft:fill_gauge name [{"text":"埋め立て度: "},{"score":{"name":"#percent","objective":"current_blocks"},"color":"green"},{"text":"% ("},{"score":{"name":"#filled","objective":"current_blocks"},"color":"gold"},{"text":" / "},{"score":{"name":"#max_space","objective":"current_blocks"},"color":"aqua"},{"text":"個)"}]
