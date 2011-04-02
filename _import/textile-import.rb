#!/usr/bin/ruby

# convert the blog folder to jekyll
# start one file at a time

$indir = File.dirname(File.expand_path($0))
$outdir = $indir.sub(/\w+$/, 'posts')

# special treatement for first line in form title|date|tags
def split_first_line(line)
  title, date, tags = line.split('|')
  tags = tags.strip.split(',')
  return title, date, tags
end

# alternatives and additions to textile
def convert_copy(text)
  #text.gsub!(/<\/?cite>/, '"')
  #text.gsub!(/<\/?sup>/, '')
  #text.gsub!(/"([^"]+)":(\S+\w)/, '[\1](\2)')
  #text.gsub!('p(quote). ', '')
  #text.gsub!('<p class="quote">', '')
  #text.gsub!(/("[^"]+")/, '_\1_')
  #text.gsub!(/^(\[\d+\])/, '\1:')
  #text.gsub!('--', '–')
  text.gsub!('–', '--')
  text.gsub!('—', '--')
  text.gsub!(/\n\[(\d+)\] /, "\n\n"+'fn\1. ')
  text.gsub!('’', "'")
  return text
end


def strip_standfirst(text)
  text.gsub!(/\[\d+\]/, '')
  text.gsub!(/"([^"]+)":\S+/, '\1')
  return text
end

def convert_to_textile(filename)
  text = File.read($indir+'/'+filename)
  first_line, text = text.split("\n", 2)
  title, date, tags = split_first_line(first_line)
  text = convert_copy(text).strip
  standfirst, ignore = text.split("\n",2)  
  standfirst = strip_standfirst(standfirst)
  title.gsub!('"', '\"')      # YAML escaping
  standfirst.gsub!('"', '\"')
  out = <<END
---
layout: default
title: "#{title}"
date: #{date}
category: "#{tags}"
standfirst: "#{standfirst}"
---  
#{text}
END
  outfilename = filename.sub(/\.txt$/, ".textile")
  outfilepath = $outdir+'/'+outfilename
  outfile = File.open(outfilepath, 'w')
  outfile << out
  outfile.close
  puts "processed #{outfilepath}"
end

files = Dir.new($indir).select { |f| f =~ /\.txt$/ }
files.each { |fn|
  convert_to_textile(fn)
}


