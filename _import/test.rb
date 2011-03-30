text = 'dffdsf "dfgdfg dfsdfs":http://sdfsdf.com dfsdf ds'

puts text.gsub!(/"([^"]+)":(\S+)/, '[\1](\2)')
