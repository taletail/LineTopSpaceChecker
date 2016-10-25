# encoding: cp932

print "ファイル名 >"
file_name = gets.chomp

# ファイル名に.txt拡張子無しで指定できるように一度拡張子を削る
file_name.sub!(/.txt/, "")

File.open("./#{file_name}.txt", 'r') do |f|
File.open("./#{file_name}_fixed.txt", 'w') do |fix|
  n=1

  f.each do |read_line|
    # 行頭が全角空白、括弧以外でtrue
    top_check = (read_line[0] !~ /[　|（|「|『|【|《]/)

    # 改行文字だけの行の場合はスキップ
    if top_check && read_line.length > 1
      puts "**[#{n}行目] に空白挿入 :#{read_line}"
      write_line = "　#{read_line}"
    else
      write_line = read_line
    end

    fix.puts write_line
    n+=1
  end
end
end

gets