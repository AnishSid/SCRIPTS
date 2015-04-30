Dir.chdir('/tmp') do
    puts Dir.entries('.')
    Dir.glob('*') do |dir|
    puts dir
    end
end
