require 'rubygems'
require 'chronic'

puts Time.now
puts Chronic.parse('tommorow')
puts Chronic.parse('last monday')
