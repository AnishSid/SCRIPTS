puts "Enter the Directory to check: "
DIRNAME = gets.chomp

hash = Dir.glob("#{DIRNAME}/**/*.*").inject({}) do |hsh, fname|
     ext = File.basename(fname).split('.')[-1].to_s.downcase
     hsh[ext] ||= [0,0]
     hsh[ext][0] += 1
     hsh[ext][1] += File.size(fname)
     hsh
end

File.open("file-analysis.txt", "w") do |f|
     hash.each do |arr|
     txt = arr.flatten.join("\t")
     f.puts txt
     puts txt
    end
end
