require_relative '../module/system'
# Classe Main
class Main
  include System

=begin
  # Estimativas mais distantes da solução
  x_i = 1 # Estimativas iniciais
  y_i = 1
=end

  x_i = 1 # Estimativas iniciais
  y_i = 1
  err = 0.003 # Erro escolhido
  n = 1 # Contador de iterações

  puts "\n \n"
  puts 'Solução de sistemas não-lineares'
  puts "\n \n"
  puts "A estimativa inicial é: (x, y) = (#{x_i}, #{y_i})"
  puts "\n \n"

  loop do
    x_ip1 = x_i + System.delta_x(x_i, y_i) # x_ip1 é a próxima solução estimada
    y_ip1 = y_i + System.delta_y(x_i, y_i) # y_ip1 é a próxima solução estimada
    err_x = ((x_ip1 - x_i) / x_i).abs # Erro Relativo Estimado de x
    err_y = ((y_ip1 - y_i) / y_i).abs # Erro Relativo Estimado de y
    puts '*-*-*-*-*-*-*-*-*-*'
    puts "Iteração de número #{n}"
    puts '*-*-*-*-*-*-*-*-*-*'
    puts 'O valor de x_ip1 é %0.06f e o erro é %0.06f' % [x_ip1, err_x]
    puts '&'
    puts 'O valor de y_ip1 é %0.06f e o erro é %0.06f' % [y_ip1, err_y]
    puts '*-*-*-*-*-*-*-*-*-*'
    puts "\n"
    break if err_x < err && err_y < err # Caso os erros das estimativas seja menor que o erro estabelecido
    # o laço termina.

    n += 1 # Caso o laço não termine, novas soluções devem ser estimadas.
    x_i = x_ip1
    y_i = y_ip1
  end
end
