# CSVを扱う準備
require "csv"
#指定されたファイルが存在するかどうかチェック
def file_exists?(file_name)
  File.exist?("#{file_name}.csv")
end

loop do
  puts "1→新規でメモを作成する / 2→既存のメモを編集する"
  memo_type = gets.to_i
  if memo_type == 1
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp
    if file_exists?(file_name)
      puts "同じ名前のCSVファイルが既に存在します"
      next
    else 
      puts "メモしたい内容を入力してください"
      puts "入力し終わったら Ctrol + D を押してください"
      contents = STDIN.read.chomp
      CSV.open("#{file_name}.csv", "w") do |csv|
        csv.puts ["#{contents}"]
      end
      break
    end
  elsif memo_type == 2
    break
  else
    puts "1か2を入力してください"
  end
end
