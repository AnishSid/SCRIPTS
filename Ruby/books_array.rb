#!/usr/bin/env ruby

books = ["math learning book", "social studies", "science"]
books.sort! {|a,b| b.length <=> a.length}
puts books
