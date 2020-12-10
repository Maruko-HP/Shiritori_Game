require "./methods.rb"


# 定数を設定
FIRST_WORD = "しりとり"
# 配列の初期値を定数「FIRST_WORD」に設定
@input_words = [FIRST_WORD]

# ゲーム開始メソッドを実行
game_description
while true  
  # 判定用の単語をハッシュの末尾から抽出
  @judgment_word = word_input(@input_words).last
  input_word_check_exit
  input_word_check_length
  input_word_check_chr_type
  input_word_check_end_of_word
  input_word_check_initial
end