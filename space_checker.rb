# encoding: cp932

print "�t�@�C���� >"
file_name = gets.chomp

# �t�@�C������.txt�g���q�����Ŏw��ł���悤�Ɉ�x�g���q�����
file_name.sub!(/.txt/, "")

File.open("./#{file_name}.txt", 'r') do |f|
File.open("./#{file_name}_fixed.txt", 'w') do |fix|
  n=1

  f.each do |read_line|
    # �s�����S�p�󔒁A���ʈȊO��true
    top_check = (read_line[0] !~ /[�@|�i|�u|�w|�y|�s]/)

    # ���s���������̍s�̏ꍇ�̓X�L�b�v
    if top_check && read_line.length > 1
      puts "**[#{n}�s��] �ɋ󔒑}�� :#{read_line}"
      write_line = "�@#{read_line}"
    else
      write_line = read_line
    end

    fix.puts write_line
    n+=1
  end
end
end

gets