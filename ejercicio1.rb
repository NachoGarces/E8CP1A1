arreglo = %w[muchas mas cosas de las que veo]

def str(str1, str2)
  file = File.open('index.html', 'a')
  file.puts "<p> #{str1} </p>"
  file.puts "<p> #{str2} </p>"
  file.close
  nil
end

def arr(arre)
  file = File.open('index.html', 'a')
  file.puts arre
  file.close
  nil
end

def back(col)
  file = File.open('index.html', 'w')
  file.puts "<style>\n  p{\n    background-color: #{col}\n  }\n</style>"
  file.close
  nil
end

puts 'Escribe un color'
color = gets.chomp
back(color)

puts 'Escribe el parrafo uno'
p1 = gets.chomp
puts 'Escribe el parrafo dos'
p2 = gets.chomp
str(p1, p2)

arr(arreglo) unless arreglo.empty?
