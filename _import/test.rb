#!/usr/bin/ruby

#puts Dir['*.txt']

#puts Dir.getwd
indir = File.dirname(File.expand_path($0))
outdir = indir.sub(/\w+$/, '_posts')

puts indir
puts outdir

puts Dir.new(indir).select { |f| f =~ /\.txt$/ }



__END__


dir = '/Users/ds/code/sofer.github.com/_posts/'


Dir.foreach(dir) { |f|
  puts f
}

Dir.select(dir) { |f|
  puts f
}