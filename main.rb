
def function_v(func, v_x)
  valor = 0

  i = 0
  while i < func.length
    element = func[i].split("x")
    i += 1
    if element.length == 0
      valor += v_x
      next
    elsif element.length == 1
      if element[0].include?("^")
        valor += v_x **(element[0][1..].to_i)
      else
        unless func[i-1].include?("x")
          valor += element[0..].join("").to_f
        else
          valor += v_x *(element[0].to_f)
        end
      end
      next
    else
      valor += v_x *((element[0].to_f)**(element[1][1..].to_i))
    end
  end
  return valor
end

def riemann(i_x, f_x, div, l, f)
  i_x *= -1 if i_x < 0
  f_x *= -1 if f_x < 0
  base = (f_x - i_x) / div

  (l == "i")? x = i_x : x = i_x + base

  i = 0
  area_rect = []
  area_total = 0
  while i < div
    aux_area = function_v(f, x) * base
    area_rect << aux_area
    area_total += aux_area
    x += base
    i += 1
  end
  return [area_rect, area_total]

end

def main
  puts ">>>Bienvenido a mi programa de Sumas de Riemann<<<"
  puts "Escribe la funcion 'utiliza ^ para las potencias'"
  function = gets.chomp.split(" ")
  puts "Escribe el valor inicial"
  init_x = gets.chomp.to_f
  puts "Escribe el valor final"
  fin_x = gets.chomp.to_f
  puts "Con cuantas subdiviciones? "
  subdiv = gets.chomp.to_i
  puts "Izquierda(i) o Derecha(d)? "
  lado = gets.chomp
  resul = riemann(init_x, fin_x, subdiv, lado, function)

  puts "El area aproximada es: #{resul[1]}"
  puts "El area de cada rectangulo es: #{resul[0]}"
end

loop do
  system("clear")
  main
  puts "\n Deseas volver hacer otro calculo? s/n"
  r = gets.chomp.downcase
  break if r != "s"
end
system("clear")
puts "Bye Bye"
