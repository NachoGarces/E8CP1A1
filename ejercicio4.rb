

def menu
  puts '|----------------------------------------------------------------------|'
  puts '|                                   MENU                               |'
  puts '|----------------------------------------------------------------------|'
  puts '|1. Sub-Menu de productos                                              |'
  puts '|2. Stock Total de un producto                                         |'
  puts '|3. Mostrar los productos no registrados en cada bodega                |'
  puts '|4. Filtrar por stock                                                  |'
  puts '|5. Registrar un nuevo producto con su respectivo stock en cada bodega |'
  puts '|6. Salir                                                              |'
  puts '|----------------------------------------------------------------------|'
  puts '|              Ingrese el numero de lo que desea realizar              |'
  puts '|----------------------------------------------------------------------|'
end

def validador_uno(nada)
  if nada < 1 || nada > 6
    puts "\n---> Ingrese una opcion valida entre 1 y 6 <---"
    gets.chomp
  end
end

def espera
  puts "\nPrecione enter para volver al programa"
  gets.chomp
end

def submenu
  puts '|----------------------------------------------------|'
  puts '|                      SUB-MENU                      |'
  puts '|----------------------------------------------------|'
  puts '|1. Mostrar la existencia por productos              |'
  puts '|2. Mostrar la existencia total por bodega           |'
  puts '|3. Mostrar la existencia total en todas las bodegas |'
  puts '|4. Volver                                           |'
  puts '|----------------------------------------------------|'
  puts '|     Ingrese el numero de lo que desea realizar     |'
  puts '|----------------------------------------------------|'
end

def validador_dos(nada)
  if nada < 1 || nada > 4
    puts "\n---> Ingrese una opcion valida entre 1 y 4 <---"
    gets.chomp
  end
end

def ex_productos
  arr = []
  file = File.open('productos.txt', 'r')
  data_products = file.readlines.map(&:chomp)
  file.close
  data_products.each { |i| arr.push(i.split(', ')) }
  arr.each do |j|
    v = 0
    j.count.times do |a|
      v += j[a].to_i
    end
    puts "\n-#{j[0]}: #{v}"
  end
end

def ex_bodega
  arr = []
  file = File.open('productos.txt', 'r')
  data_products = file.readlines.map(&:chomp)
  file.close
  data_products.each { |i| arr.push(i.split(', ')) }
  arr.each do |j|
    j.each_index do |c|
      puts "\n#{j[c]}: " if c.zero?
      puts "  -bodega #{c}: #{j[c]}" if c != 0
    end
  end
end

def ex_total
  arr = []
  file = File.open('productos.txt', 'r')
  data_products = file.readlines.map(&:chomp)
  file.close
  data_products.each { |i| arr.push(i.split(', ')) }
  cont_pos = 1
  f = arr[0].count - 1
  f.times do
    con_arr = 0
    arr.each do |j|
      con_arr += j[cont_pos].to_i
    end
    puts "\nbodega #{cont_pos}: #{con_arr}"
    cont_pos += 1
  end
end

def stock_total
  arr = []
  file = File.open('productos.txt', 'r')
  data_products = file.readlines.map(&:chomp)
  file.close
  data_products.each { |i| arr.push(i.split(', ')) }
  user_option = gets.chomp
  arr.each do |j|
    v = 0
    j.count.times do |a|
      v += j[a].to_i
    end
    puts "#{j[0]}: #{v}" if user_option == j[0]
  end
end

def no_registrados
  arr = []
  file = File.open('productos.txt', 'r')
  data_products = file.readlines.map(&:chomp)
  file.close
  data_products.each { |i| arr.push(i.split(', ')) }
  arr.each do |j|
    j.each_index do |c|
      puts "\n#{j[c]}: " if c.zero?
      puts "  -bodega #{c}" if j[c] == 'NR'
    end
  end
end

def filtro_stock
  arr = []
  file = File.open('productos.txt', 'r')
  data_products = file.readlines.map(&:chomp)
  file.close
  data_products.each { |i| arr.push(i.split(', ')) }
  user_filter = gets.chomp.to_i
  arr.each do |j|
    sum_total = 0
    j.each_index do |c|
      puts "\n#{j[c]}: " if c.zero?
      sum_total += j[c].to_i if c != 0
    end
    puts sum_total if sum_total < user_filter
  end
end

def nuevo_producto
  cant_bod = 0
  arr = []
  file = File.open('productos.txt', 'r')
  data_products = file.readlines.map(&:chomp)
  file.close
  data_products.each { |i| arr.push(i.split(', ')) }
  arr.each { |j| cant_bod = j.count }
  file = File.open('productos.txt', 'a')
  cant_bod.times do |d|
    if d.zero?
      puts 'Nombre del producto:'
      name_prod = gets.chomp
      file.print "\n#{name_prod}"
    else
      puts "Cantidad en bodega #{d}"
      cant_prod = gets.chomp
      file.print ", #{cant_prod}"
    end
  end
  file.close
end

###################################

op_usuario = 0
while op_usuario != 6
  menu
  op_usuario = gets.chomp.to_i
  validador_uno(op_usuario)
  case op_usuario
  when 1
    op_usuario_dos = 0
    while op_usuario_dos != 4
      submenu
      op_usuario_dos = gets.chomp.to_i
      validador_dos(op_usuario_dos)
      case op_usuario_dos
      when 1
        puts 'Existencia de productos'
        ex_productos
        espera
      when 2
        puts 'Existencia por bodega'
        ex_bodega
        espera
      when 3
        puts 'Existencia total'
        ex_total
        espera
      when 4
        break
      end
    end
  when 2
    puts 'Escribe el nombre del producto para saber stock total'
    stock_total
    espera
  when 3
    puts 'Productos no registrados'
    no_registrados
    espera
  when 4
    puts 'Escribe el precio maximo a buscar'
    filtro_stock
    espera
  when 5
    puts 'Escribe el nombre del nuevo Producto'
    nuevo_producto
    espera
  when 6
    puts 'Fin del programa'
  end
end
