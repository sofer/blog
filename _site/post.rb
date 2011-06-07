#!/usr/bin/ruby

path = '_posts/'

if ARGV[2] and ARGV[0] =~ /\d\d\d\d-\d\d-\d\d/
  date, title, cat = ARGV 
  top ||= false
  file = path + date+'-'+title.gsub(' ', '-').downcase.gsub(/[^a-z-]/, '') + '.textile'
  outline = <<OUTLINE
---
layout: post
title: #{title}
category: #{cat}
standfirst: "" 
---

OUTLINE
  File.open(file, 'w') do |f|
    f.write(outline)
  end
  puts "written #{file}"

else
  puts <<USAGE
Usage: /post.rb arg1 "arg2" arg3 "arg4" arg5
arg1: date in YYYY-MM-DD format
arg2: title
arg3: category
USAGE
end
