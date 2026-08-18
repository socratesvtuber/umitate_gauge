# 範囲が未設定の間はカウントせず案内のみ表示
execute if score #configured current_blocks matches 0 run return 0

# 1. 保存済みの2点の座標をもとに、範囲内の「空気ブロック数」を数えて上空（0 250 0）にクローン
function umitate_gauge:tick/count_air with storage umitate_gauge:box

# 2. ゲージの計算・表示を更新
function umitate_gauge:tick/update_gauge
