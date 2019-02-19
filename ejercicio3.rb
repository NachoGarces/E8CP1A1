def cantpal(palabras)
  file = File.open(palabras, 'r')
  data = file.readlines.map(&:chomp)
  file.close
  c = 0
  data.each do |line|
    c += line.split(' ').length
  end
  print "La cantidad de palabras es: #{c}\n"
end

def buscador(palabrabusc, str)
  a = []
  file = File.open(palabrabusc, 'r')
  data = file.readlines.map(&:chomp)
  file.close
  data.each do |i|
    a.push(i.split(' '))
  end
  a = a.map { |j| j.count(str) }
  puts a.inject(:+)
end

cantpal('peliculas.txt')

puts 'Escribe la palabra a buscar:'
pal_buscada = gets.chomp

buscador('peliculas.txt', pal_buscada)
