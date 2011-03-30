#!/usr/bin/ruby

# convert the blog folder to jekyll
# start one file at a time

# special treatement for first line in form title|date|tags
def split_first_line(line)
  title, date, tags = line.split('|')
  tags = tags.strip.split(',')
  return title, date, tags
end

# alternatives and additions to textile
def convert_copy(text)
  text.gsub!(/<\/?cite>/, '"')
  text.gsub!(/<\/?sup>/, '')
  text.gsub!(/"([^"]+)":(\S+\w)/, '[\1](\2)')
  text.gsub!('p(quote). ', '')
  text.gsub!('<p class="quote">', '')
  text.gsub!(/("[^"]+")/, '_\1_')
  text.gsub!(/^(\[\d+\])/, '\1:')
  text.gsub!('--', '–')
  return text
end

def convert_to_markdown(filename)
  text = File.read(filename)
  first_line, text = text.split("\n", 2)
  title, date, tags = split_first_line(first_line)
  text = convert_copy(text)
  standfirst, ignore = text.strip.split("\n", 2)
  out = <<END
---
layout: post
title: #{title}
category: #{tags}
standfirst: #{standfirst}
---  
#{text}
END
  outfilename = date + '-' + filename.sub(/\.txt$/, ".markdown")
  outfilepath = '../_posts/'+outfilename
  outfile = File.open(outfilepath, 'w')
  outfile << out
  outfile.close
  puts "processed #{outfilepath}"
end

files = Dir['*.txt'].select { |f| f !~ /^index\./ }
files.each { |fn|
  convert_to_markdown(fn)
}




