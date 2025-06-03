local shouldPlayAnimation = true

-- The ASCII caracters used in the animation
-- ⠀⠁⠂⠃⠄⠅⠆⠇⠈⠉⠊⠋⠌⠍⠎⠏
-- ⠐⠑⠒⠓⠔⠕⠖⠗⠘⠙⠚⠛⠜⠝⠞⠟
-- ⠠⠡⠢⠣⠤⠥⠦⠧⠨⠩⠪⠫⠬⠭⠮⠯
-- ⠰⠱⠲⠳⠴⠵⠶⠷⠸⠹⠺⠻⠼⠽⠾⠿
-- ⡀⡁⡂⡃⡄⡅⡆⡇⡈⡉⡊⡋⡌⡍⡎⡏
-- ⡐⡑⡒⡓⡔⡕⡖⡗⡘⡙⡚⡛⡜⡝⡞⡟
-- ⡠⡡⡢⡣⡤⡥⡦⡧⡨⡩⡪⡫⡬⡭⡮⡯
-- ⡰⡱⡲⡳⡴⡵⡶⡷⡸⡹⡺⡻⡼⡽⡾⡿
-- ⢀⢁⢂⢃⢄⢅⢆⢇⢈⢉⢊⢋⢌⢍⢎⢏
-- ⢐⢑⢒⢓⢔⢕⢖⢗⢘⢙⢚⢛⢜⢝⢞⢟
-- ⢠⢡⢢⢣⢤⢥⢦⢧⢨⢩⢪⢫⢬⢭⢮⢯
-- ⢰⢱⢲⢳⢴⢵⢶⢷⢸⢹⢺⢻⢼⢽⢾⢿
-- ⣀⣁⣂⣃⣄⣅⣆⣇⣈⣉⣊⣋⣌⣍⣎⣏
-- ⣐⣑⣒⣓⣔⣕⣖⣗⣘⣙⣚⣛⣜⣝⣞⣟
-- ⣤⣡⣢⣣⣤⣥⣦⣧⣨⣩⣪⣫⣬⣭⣮⣯
-- ⣰⣱⣲⣳⣴⣵⣶⣷⣸⣹⣺⣻⣼⣽⣾⣿

local frames = {
  [[
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡖ ⠀⢀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀ ⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⠀⠀⠀ ⣹⣷ ⣀⣴⠀⢀⣤⣶⡦⡀⠀⠀⠀⠀ ⠀
  ⠢⣀⠀⠀⠀⠀⠀⢄⠀⠈⣆⣠⣼⣿⣿⣿⣿⣿⣿⣦⣼⣏⠀⠀⠀⠀⠀⠀  ⠀
  ⠀⠈⠻⣶⣄⡀⠀⣨⣷⡿⠟⠋⠉⠉  ⠉⠉⠉⠛⠿⣿⣦⣀⠀⠀⠀⠀⠀ ⠀
  ⠀⠀⠀⠀⠙⢿⣿⡿⠋⠀⠀⠀⠀ ⢠⡄⠀ ⠀⠀ ⠈⢿⣿⣏⢀⡀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⣼⡟⠀⠀⠀⠀⠀ ⣠⣿⣿⣆ ⠀⠀⠀⠀⠈⢿⣿⡁ ⣁⡀⠀⠀
  ⠀⠀⠀⠒⢺⣿⠁⠀⠀⠀⠀ ⡰⠿⠿⠿⠿⢆⠀ ⠀⠀⠀⠸⣿⡿⠛⠉⠀⠀⠀
  ⠀⠀⢀⢠⣾⣿⠀⠀⠀⠀ ⣴⣷⡀⠀⠀⢀⣾⣦⠀⠀ ⠀⠀⣿⣿⡦⠀⠀⠀⠀
  ⠀⠀⠀⠀⣹⣿⠀⠀⠀ ⣼⣿⣿⣷⡀⢀⣾⣿⣿⣧  ⠀⢠⣿⡧⠤ ⠀⠀⠀
  ⠀⠀⠀⠈⠛⢿⣆⠀ ⠈⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠁ ⠀⣼⡿⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⢀⣾⣿⣷⣄⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠚⢻⣿⣿⣦⣄⡀⠀⠀⠀⠀  ⢀⣠⣶⣿⡋⠀⠈⠙⠻⣄⠀⠀ 
  ⠀⠀⠀⠀⠀⠀⠀⢀⣿⠿⢿⣿⣿⣿⣶⣶⣿⡿⠻⣏⠀⠛⠄⠀⠀⠀⠀⠈⠃⠄ 
  ⠀⠀⠀⠀⠀ ⡰⠛ ⠀⠸⠋⠻⣿⣁⠀⠁⠀⠀⠈⠀  ⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀

]],
  [[
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⢀⣴⡖ ⠀⢀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀ ⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⠀⠀⠀ ⣹⣷ ⣀⣴⠀⢀⣤⣶⡦⡀⠀⠀⠀⠀ ⠀
  ⠢⣀⠀⠀⠀⠀⠀⢄⠀⠈⣆⣠⣼⣿⣿⣿⣿⣿⣿⣦⣼⣏⠀⠀⠀⠀⠀⠀  ⠀
  ⠀⠈⠻⣶⣄⡀⠀⣨⣷⡿⠟⠋⠉⠉  ⠉⠉⠉⠛⠿⣿⣦⣀⠀⠀⠀⠀⠀ ⠀
  ⠀⠀⠀⠀⠙⢿⣿⡿⠋⠀⠀⠀⠀ ⢠⡄⠀ ⠀⠀ ⠈⢿⣿⣏⢀⡀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⣼⡟⠀⠀⠀⠀⠀  ⣿⣆ ⠀⠀ ⠀⠀⠈⢿⣿⡁ ⣁⡀⠀⠀
  ⠀⠀⠀⠒⢺⣿⠁⠀⠀⠀⠀  ⡰⠿⠿⢆⠀ ⠀ ⠀⠀⠸⣿⡿⠛⠉⠀⠀⠀
  ⠀⠀⢀⢠⣾⣿⠀⠀⠀⠀  ⣴⣷ ⠀⣾⣦⠀⠀  ⠀⠀⣿⣿⡦⠀⠀⠀⠀
  ⠀⠀⠀⠀⣹⣿⠀⠀⠀  ⣼⣿⣷⡀⢀⣿⣿⣧   ⠀⢠⣿⡧⠤ ⠀⠀⠀
  ⠀⠀⠀⠈⠛⢿⣆⠀  ⠈⠉⠉⠉⠉⠉⠉⠉⠉⠁  ⠀⣼⡿⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⢀⣾⣿⣷⣄⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠚⢻⣿⣿⣦⣄⡀⠀⠀⠀⠀  ⢀⣠⣶⣿⡋⠀⠈⠙⠻⣄⠀⠀ 
  ⠀⠀⠀⠀⠀⠀⠀⢀⣿⠿⢿⣿⣿⣿⣶⣶⣿⡿⠻⣏⠀⠛⠄⠀⠀⠀⠀⠈⠃⠄ 
  ⠀⠀⠀⠀⠀ ⡰⠛ ⠀⠸⠋⠻⣿⣁⠀⠁⠀⠀⠈⠀  ⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀

]],
  [[
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⢀⣴⡖ ⠀⢀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀  
  ⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⠀⠀⠀ ⣹⣷ ⣀⣴⠀⢀⣤⣶⡦⡀⠀⠀⠀⠀ ⠀
  ⠢⣀⠀⠀⠀⠀⠀⢄⠀⠈⣆⣠⣼⣿⣿⣿⣿⣿⣿⣦⣼⣏⠀⠀⠀⠀⠀⠀  ⠀
  ⠀⠈⠻⣶⣄⡀⠀⣨⣷⡿⠟⠋⠉⠉  ⠉⠉⠉⠛⠿⣿⣦⣀⠀⠀⠀⠀⠀ ⠀
  ⠀⠀⠀⠀⠙⢿⣿⡿⠋⠀⠀⠀⠀ ⢠⠀ ⠀⠀  ⠈⢿⣿⣏⢀⡀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⣼⡟⠀⠀⠀⠀⠀  ⣿⣆ ⠀⠀ ⠀⠀⠈⢿⣿⡁ ⣁⡀⠀⠀
  ⠀⠀⠀⠒⢺⣿⠁⠀⠀⠀⠀  ⡰⠿⠿⠀ ⠀ ⠀ ⠀⠸⣿⡿⠛⠉⠀⠀⠀
  ⠀⠀⢀⢠⣾⣿⠀⠀⠀⠀   ⣷  ⣷⠀⠀   ⠀⠀⣿⣿⡦⠀⠀⠀⠀
  ⠀⠀⠀⠀⣹⣿⠀⠀⠀   ⣿⣷⡀⢀⣿⣧    ⠀⢠⣿⡧⠤ ⠀⠀⠀
  ⠀⠀⠀⠈⠛⢿⣆⠀   ⠉⠉⠉⠉⠉⠉⠉⠁   ⠀⣼⡿⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⢀⣾⣿⣷⣄⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠚⢻⣿⣿⣦⣄⡀⠀⠀⠀⠀  ⢀⣠⣶⣿⡋⠀⠈⠙⠻⣄⠀⠀ 
  ⠀⠀⠀⠀⠀⠀⠀⢀⣿⠿⢿⣿⣿⣿⣶⣶⣿⡿⠻⣏⠀⠛⠄⠀⠀⠀⠀⠈⠃⠄ 
  ⠀⠀⠀⠀⠀ ⡰⠛ ⠀⠸⠋⠻⣿⣁⠀⠁⠀⠀⠈⠀  ⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀

]],
  [[
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⢀⣴⡖ ⠀⢀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀  
  ⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⠀⠀⠀ ⣹⣷ ⣀⣴⠀⢀⣤⣶⡦⡀⠀⠀⠀⠀ ⠀
  ⠢⣀⠀⠀⠀⠀⠀⢄⠀⠈⣆⣠⣼⣿⣿⣿⣿⣿⣿⣦⣼⣏⠀⠀⠀⠀⠀⠀  ⠀
  ⠀⠈⠻⣶⣄⡀⠀⣨⣷⡿⠟⠋⠉⠉  ⠉⠉⠉⠛⠿⣿⣦⣀⠀⠀⠀⠀⠀ ⠀
  ⠀⠀⠀⠀⠙⢿⣿⡿⠋⠀⠀⠀ ⠀ ⢠⠀⠀ ⠀ ⠈⢿⣿⣏⢀⡀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⣼⡟⠀⠀⠀⠀⠀   ⣿ ⠀ ⠀ ⠀⠈⢿⣿⡁ ⣁⡀⠀⠀
  ⠀⠀⠀⠒⢺⣿⠁⠀⠀⠀⠀   ⡰⠿⠀ ⠀⠀  ⠀⠸⣿⡿⠛⠉⠀⠀⠀
  ⠀⠀⢀⢠⣾⣿⠀⠀⠀⠀    ⣷ ⣷⠀⠀   ⠀⠀⣿⣿⡦⠀⠀⠀⠀
  ⠀⠀⠀⠀⣹⣿⠀⠀⠀    ⡰⣷⢀⣿     ⠀⢠⣿⡧⠤ ⠀⠀⠀
  ⠀⠀⠀⠈⠛⢿⣆⠀     ⠉⠉⠉⠉⠁  ⠀  ⣼⡿⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⢀⣾⣿⣷⣄⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠚⢻⣿⣿⣦⣄⡀⠀⠀⠀⠀  ⢀⣠⣶⣿⡋⠀⠈⠙⠻⣄⠀⠀ 
  ⠀⠀⠀⠀⠀⠀⠀⢀⣿⠿⢿⣿⣿⣿⣶⣶⣿⡿⠻⣏⠀⠛⠄⠀⠀⠀⠀⠈⠃⠄ 
  ⠀⠀⠀⠀⠀ ⡰⠛ ⠀⠸⠋⠻⣿⣁⠀⠁⠀⠀⠈⠀  ⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀

]],
  [[
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡖ ⠀⢀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀ ⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⠀⠀⠀ ⣹⣷ ⣀⣴⠀⢀⣤⣶⡦⡀⠀⠀⠀⠀ ⠀
  ⠢⣀⠀⠀⠀⠀⠀⢄⠀⠈⣆⣠⣼⣿⣿⣿⣿⣿⣿⣦⣼⣏⠀⠀⠀⠀⠀⠀  ⠀
  ⠀⠈⠻⣶⣄⡀⠀⣨⣷⡿⠟⠋⠉⠉  ⠉⠉⠉⠛⠿⣿⣦⣀⠀⠀⠀⠀⠀ ⠀
  ⠀⠀⠀⠀⠙⢿⣿⡿⠋⠀⠀⠀ ⠀ ⢠⠀⠀ ⠀ ⠈⢿⣿⣏⢀⡀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⣼⡟⠀⠀⠀⠀⠀   ⣿ ⠀ ⠀ ⠀⠈⢿⣿⡁ ⣁⡀⠀⠀
  ⠀⠀⠀⠒⢺⣿⠁⠀⠀⠀⠀    ⠿⠀ ⠀⠀  ⠀⠸⣿⡿⠛⠉⠀⠀⠀
  ⠀⠀⢀⢠⣾⣿⠀⠀⠀⠀     ⣷⠀⠀    ⠀⠀⣿⣿⡦⠀⠀⠀⠀
  ⠀⠀⠀⠀⣹⣿⠀⠀⠀      ⣿      ⠀⢠⣿⡧⠤ ⠀⠀⠀
  ⠀⠀⠀⠈⠛⢿⣆⠀       ⠉    ⠀  ⣼⡿⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⢀⣾⣿⣷⣄⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠚⢻⣿⣿⣦⣄⡀⠀⠀⠀⠀  ⢀⣠⣶⣿⡋⠀⠈⠙⠻⣄⠀⠀ 
  ⠀⠀⠀⠀⠀⠀⠀⢀⣿⠿⢿⣿⣿⣿⣶⣶⣿⡿⠻⣏⠀⠛⠄⠀⠀⠀⠀⠈⠃⠄ 
  ⠀⠀⠀⠀⠀ ⡰⠛ ⠀⠸⠋⠻⣿⣁⠀⠁⠀⠀⠈⠀  ⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀

]],
  [[
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⢀⣴⡖ ⠀⢀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀  
  ⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⠀⠀⠀ ⣹⣷ ⣀⣴⠀⢀⣤⣶⡦⡀⠀⠀⠀⠀ ⠀
  ⠢⣀⠀⠀⠀⠀⠀⢄⠀⠈⣆⣠⣼⣿⣿⣿⣿⣿⣿⣦⣼⣏⠀⠀⠀⠀⠀⠀  ⠀
  ⠀⠈⠻⣶⣄⡀⠀⣨⣷⡿⠟⠋⠉⠉  ⠉⠉⠉⠛⠿⣿⣦⣀⠀⠀⠀⠀⠀ ⠀
  ⠀⠀⠀⠀⠙⢿⣿⡿⠋⠀⠀⠀⠀ ⡄⠀⠀ ⠀  ⠈⢿⣿⣏⢀⡀⠀⠀⠀ ⠀
  ⠀⠀⠀⠀⠀⣼⡟⠀⠀⠀⠀⠀  ⣿ ⠀ ⠀  ⠀⠈⢿⣿⡁ ⣁⡀⠀ ⠀
  ⠀⠀⠀⠒⢺⣿⠁⠀⠀⠀⠀   ⠿⢆⠀ ⠀⠀  ⠀⠸⣿⡿⠛⠉⠀⠀⠀
  ⠀⠀⢀⢠⣾⣿⠀⠀⠀⠀   ⣾ ⣾⠀⠀    ⠀⠀⣿⣿⡦⠀⠀⠀⠀ 
  ⠀⠀⠀⠀⣹⣿⠀⠀⠀    ⣾⡀⣿⢆     ⠀⢠⣿⡧⠤ ⠀⠀⠀
  ⠀⠀⠀⠈⠛⢿⣆⠀     ⠉⠉⠉⠉⠁  ⠀  ⣼⡿⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⢀⣾⣿⣷⣄⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠚⢻⣿⣿⣦⣄⡀⠀⠀⠀⠀  ⢀⣠⣶⣿⡋⠀⠈⠙⠻⣄⠀⠀ 
  ⠀⠀⠀⠀⠀⠀⠀⢀⣿⠿⢿⣿⣿⣿⣶⣶⣿⡿⠻⣏⠀⠛⠄⠀⠀⠀⠀⠈⠃⠄ 
  ⠀⠀⠀⠀⠀ ⡰⠛ ⠀⠸⠋⠻⣿⣁⠀⠁⠀⠀⠈⠀  ⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀

]],
  [[
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⢀⣴⡖ ⠀⢀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀  
  ⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⠀⠀⠀ ⣹⣷ ⣀⣴⠀⢀⣤⣶⡦⡀⠀⠀⠀⠀ ⠀
  ⠢⣀⠀⠀⠀⠀⠀⢄⠀⠈⣆⣠⣼⣿⣿⣿⣿⣿⣿⣦⣼⣏⠀⠀⠀⠀⠀⠀  ⠀
  ⠀⠈⠻⣶⣄⡀⠀⣨⣷⡿⠟⠋⠉⠉  ⠉⠉⠉⠛⠿⣿⣦⣀⠀⠀⠀⠀⠀ ⠀
  ⠀⠀⠀⠀⠙⢿⣿⡿⠋⠀⠀⠀⠀  ⡄⠀ ⠀⠀ ⠈⢿⣿⣏⢀⡀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⣼⡟⠀⠀⠀⠀⠀  ⣰⣿ ⠀⠀ ⠀ ⠈⢿⣿⡁ ⣁⡀⠀⠀
  ⠀⠀⠀⠒⢺⣿⠁⠀⠀⠀⠀   ⠿⠿⢆ ⠀ ⠀ ⠀⠸⣿⡿⠛⠉⠀⠀⠀
  ⠀⠀⢀⢠⣾⣿⠀⠀⠀⠀   ⣾  ⣾⠀⠀   ⠀⠀⣿⣿⡦⠀⠀⠀⠀
  ⠀⠀⠀⠀⣹⣿⠀⠀⠀   ⣼⣿⡀⢀⣿⣿    ⠀⢠⣿⡧⠤ ⠀⠀⠀
  ⠀⠀⠀⠈⠛⢿⣆⠀   ⠈⠉⠉⠉⠉⠉⠉⠉   ⠀⣼⡿⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⢀⣾⣿⣷⣄⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠚⢻⣿⣿⣦⣄⡀⠀⠀⠀⠀  ⢀⣠⣶⣿⡋⠀⠈⠙⠻⣄⠀⠀ 
  ⠀⠀⠀⠀⠀⠀⠀⢀⣿⠿⢿⣿⣿⣿⣶⣶⣿⡿⠻⣏⠀⠛⠄⠀⠀⠀⠀⠈⠃⠄ 
  ⠀⠀⠀⠀⠀ ⡰⠛ ⠀⠸⠋⠻⣿⣁⠀⠁⠀⠀⠈⠀  ⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀

]],
  [[
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⢀⣴⡖ ⠀⢀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀ ⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⠀⠀⠀ ⣹⣷ ⣀⣴⠀⢀⣤⣶⡦⡀⠀⠀⠀⠀ ⠀
  ⠢⣀⠀⠀⠀⠀⠀⢄⠀⠈⣆⣠⣼⣿⣿⣿⣿⣿⣿⣦⣼⣏⠀⠀⠀⠀⠀⠀  ⠀
  ⠀⠈⠻⣶⣄⡀⠀⣨⣷⡿⠟⠋⠉⠉  ⠉⠉⠉⠛⠿⣿⣦⣀⠀⠀⠀⠀⠀ ⠀
  ⠀⠀⠀⠀⠙⢿⣿⡿⠋⠀⠀⠀⠀ ⢠⡄⠀ ⠀⠀ ⠈⢿⣿⣏⢀⡀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⣼⡟⠀⠀⠀⠀⠀  ⣰⣿ ⠀⠀ ⠀⠀⠈⢿⣿⡁ ⣁⡀⠀⠀
  ⠀⠀⠀⠒⢺⣿⠁⠀⠀⠀⠀  ⡰⠿⠿⢆⠀ ⠀ ⠀⠀⠸⣿⡿⠛⠉⠀⠀⠀
  ⠀⠀⢀⢠⣾⣿⠀⠀⠀⠀  ⣴⣷ ⠀⣾⣦⠀⠀  ⠀⠀⣿⣿⡦⠀⠀⠀⠀
  ⠀⠀⠀⠀⣹⣿⠀⠀⠀  ⣼⣿⣿⡀⢀⣷⣿⣧   ⠀⢠⣿⡧⠤ ⠀⠀⠀
  ⠀⠀⠀⠈⠛⢿⣆⠀  ⠈⠉⠉⠉⠉⠉⠉⠉⠉⠁  ⠀⣼⡿⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⢀⣾⣿⣷⣄⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠚⢻⣿⣿⣦⣄⡀⠀⠀⠀⠀  ⢀⣠⣶⣿⡋⠀⠈⠙⠻⣄⠀⠀ 
  ⠀⠀⠀⠀⠀⠀⠀⢀⣿⠿⢿⣿⣿⣿⣶⣶⣿⡿⠻⣏⠀⠛⠄⠀⠀⠀⠀⠈⠃⠄ 
  ⠀⠀⠀⠀⠀ ⡰⠛ ⠀⠸⠋⠻⣿⣁⠀⠁⠀⠀⠈⠀  ⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀

]],
}

local function ascii(counting, callback)
  if not shouldPlayAnimation then
    return
  end

  -- local frameCount = #frames < math.floor(counting) and frames[#frames] or frames[math.floor(counting)]
  asciiImg = #frames < math.floor(counting) and frames[#frames] or frames[math.floor(counting)]

  asciiImg = string.gsub(asciiImg, "{counting}", tostring(counting))

  Snacks.dashboard.update()

  print(counting)

  if counting >= #frames + 1 then
    callback(callback)
  end
end

local function theAnimation(callback)
  require("snacks").animate(1, #frames + 1, function(value, ctx)
    ascii(value, callback)
  end, {
    duration = 300,
    fps = 60,
  })
end

return {
  {
    "folke/snacks.nvim",
    init = function()
      vim.defer_fn(function()
        theAnimation(theAnimation)
      end, 100)
    end,

    ---@type snacks.Config
    opts = {
      image = { enabled = true },

      -- Terminal
      terminal = {
        win = {
          keys = {
            exit = { "<ESC>", "<cmd>q<cr>", desc = "Exit", expr = true, mode = { "t", "n" } },
            term_normal = {
              "<c-/>",
              function(self)
                vim.cmd("stopinsert")

                ---@diagnostic disable-next-line: undefined-field
                local timer = vim.loop.new_timer()
                local start_up_func = function()
                  vim.api.nvim_feedkeys("/", "n", true)
                end
                if timer ~= nil then
                  timer:start(10, 0, vim.schedule_wrap(start_up_func))
                end
              end,
              mode = { "t", "n" },
              expr = true,
              desc = "Double escape to normal mode",
            },
            hide_search_highlight = {
              "<c-.>",
              "<cmd>noh<cr>",
              desc = "Turn off highlighting until the next search",
              expr = true,
              mode = { "t", "n" },
            },
          },
        },
      },

      -- EXPLORER MENU
      picker = {
        sources = {
          explorer = {
            path = LazyVim.root(),
            auto_close = true,
            layout = {
              preset = "vscode",
              layout = { position = "right" },
            },
          },
        },
      },

      -- DASHBOARD
      dashboard = {

        preset = {
          -- Go see the theme in `lua/plugins/theme.lua` to change the color of the header
          header = false,
          ---@type fun(cmd:string, opts:table)|nil
          pick = nil,
          ---@type snacks.dashboard.Item[]
          keys = {
            {
              icon = " ",
              key = "p",
              desc = "Projects",
              action = function()
                Snacks.picker.projects({ sort = { fields = { "time:asc", "idx" } } })
                shouldPlayAnimation = false
              end,
            },
            {
              icon = " ",
              key = "s",
              desc = "Restore Session",
              action = function()
                require("persistence").load({ last = true })
                shouldPlayAnimation = false
              end,
            },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = function()
                Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
                shouldPlayAnimation = false
              end,
            },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          {
            section = "header",
            padding = 1,
            function()
              return { header = asciiImg }
            end,
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup", enabled = false },
        },
      },
    },
  },
}
