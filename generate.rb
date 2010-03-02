#!/usr/bin/ruby

puts "LET US GO GENERATE!!!"

require 'erb'
require 'yaml'

tmplate = ERB.new(File.open('./bweeep.erb','r').read)

cntntfiles = Dir.glob("cntnt/*.yaml")
puts "Found this many articles: " + String(cntntfiles.length)

artcls = []
cntntfiles.each do |a|
	f = File.open(a) { |yf| YAML::load( yf ) }
	f['name'] = File.basename(a)[0..-6]
	artcls.push(f)
end

c = nil
artcls.each do |a|
	c = a
	f = File.new('trgt/' + a['name'] + '.html', 'w')
	f.write(tmplate.result)
	f.close
end

