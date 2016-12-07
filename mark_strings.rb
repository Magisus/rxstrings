require 'tempfile'

marked_file = Tempfile.new("marked")

path = ARGV[0]

begin
  File.open(path, "r") do |file|
    line_number = 0
    file.each_line do |line|
      line_number += 1
      if /^require/.match line
        # always skip requires
        marked_file.puts line
      else
        # wrap any unmarked double-quoted string
        new_line = line.gsub(/(?<!_\()"[^"]*"/) do |match|
          "_(#{match})"
        end
        marked_file.puts new_line
        # print changed lines to stdout
        if new_line != line
          puts "#{line_number}: #{new_line}\n"
        end
      end
    end
  end
  FileUtils.mv(marked_file.path, path)
ensure
  marked_file.close
  marked_file.unlink
end
