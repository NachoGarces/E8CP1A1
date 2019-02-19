def contador(hola)
  file = File.open(hola, 'r')
  data = file.readlines
  file.close
  puts data.count
end

contador('peliculas.txt')
