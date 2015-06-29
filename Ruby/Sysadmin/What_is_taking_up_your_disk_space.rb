=begin
Using the Dir.glob and File.size methods, write a script that targets a directory – and all of its subdirectories – and prints out the names of the 10 files that take up the most disk space.
=end

DIRNAME = "/home/anishsid"
Dir.glob("#{DIRNAME}/**/*.*").sort_by{|fname| File.size(fname).to_f / 2**20}.reverse[0..9].each do |fname|
   puts "#{fname}\t#{File.size(fname)}"
end
