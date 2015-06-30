require 'rubygems'
require 'rest-client'

wiki_url = "http://en.wikipedia.org/"
wiki_filename = "wiki-page.html"

File.open(wiki_filename, "w") do |file|
  file.write(RestClient.get(wiki_url))
end
