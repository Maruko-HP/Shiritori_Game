# スタート画面表示
def game_description
  puts <<~ゲーム説明
  
  [しりとりGame]
  
  【ルール】
  ・基本は普通のしりとりと同じです
  ・最初はしりとりの「り」からスタートします
  ・ひらがなか、カタカナでの入力が可能です
  ・「ん」や「ン」が付く単語を入力するとゲーム終了です
  ・入力文字数は１０字以内としてください

  ※ゲームをやめようと思ったら「exit」と入力してください
  
  それでは、いってみよう！
  
  ゲーム説明
end

# ゲーム終了画面
def game_over
  puts <<~ゲームオーバー
  [Game Over]
  ゲーム終了です！また次回の挑戦をお待ちしています(^^)ノシ
  ゲームオーバー
end

# 最初の入力フォーム
def word_input(input_words)
# 次回入力に必要な文字列の抽出
input_words_last = input_words.last # 配列の末尾の言葉を取得
keyword = input_words_last[-1] # 配列の末尾の言葉の末尾の文字を取得
  print "「#{keyword}」から始まる10文字以内の言葉を入力してください。 >"
  @input_word = gets.chomp
  @input_word.tr!("ァ-ヶ", "ぁ-ん") # 入力された文字のカタカナをひらがなに変換
  input_words.push @input_word # ハッシュinput_wordsの末尾に追加
end

# 入力文字の制限
# ゲーム終了（自らやめる）
def input_word_check_exit
  if @input_word == "exit"
    game_over
    exit
  end
end

def input_word_check_length
# 入力文字数の判定
  if @judgment_word.length > 10
    puts "入力文字が10文字を超えました。10文字以内の言葉を入力してください。"
    game_over
    exit
  end
end

def input_word_check_initial
  # 入力した単語の頭文字の判定->蓄積されたハッシュ値の末尾の単語の頭文字を判定
  # 問題として提出される文字列の抽出
  taskword = @input_words[-2] # 配列の最後から２番目の言葉を取得
  head_last_word = taskword[-1] # last_wordの末尾の文字列を取得
  p @input_words
  p head_last_word
  if @judgment_word.start_with?(head_last_word)
    puts "OKです。その調子！"
  else
    @too_long_word = @input_words.pop
    puts "前の言葉の語尾と入力された言葉の頭文字が一致していません。"
    game_over
    exit
  end
end

def input_word_check_end_of_word
# 語尾の判定->「ん」が付くとゲーム終了　※正規表現を使用;
  if @judgment_word[-1].match(/[んン]+\Z/)
    puts "残念！末尾に「ん」「ン」が付いてしまいました！"
    game_over
    exit
  end

end

def input_word_check_chr_type
  # ひらがな判定->正規表現を使用
  if @input_word.match(/\A[ぁ-んー-]+\Z/) == nil
    puts "入力文字が不正です。空白、ひらがなやカタカナ以外は受け付けられません。"
    game_over
    exit
  end 
end
