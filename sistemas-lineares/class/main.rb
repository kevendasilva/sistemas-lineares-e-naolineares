require_relative 'matrix'
require_relative '../module/methods'
require_relative '../module/operations'
require_relative '../module/showmatrix'
require_relative '../module/properties'
# Classe main
class Main
  include Methods
  include Operations
  include Showmatrix

  # Método de eliminação de Gauss

  # O colchete mais externo não deve ser removido e, uma linha está dentro de um outro colchete.
  m = [[ 4,  -2,   -3,   6,   12], # Matriz estendida
       [-6,   7,  6.5,  -6, -6.5],
       [ 1, 7.5, 6.25, 5.5,   16],
       [-12, 22, 15.5,  -1,   17] ]

  puts '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
  puts "\n"
  puts '~= Método de eliminação de Gauss =~'

  # Instânciando um objeto com a classe Matrix
  #
  puts "\n"
  puts '~=~= Matriz estendida antes do método de Gauss =~=~'
  puts "\n"
  matriz = Matrix.new(m)

  # Casos deseje realizar o processo de pivotação na matriz, descomente a linha abaixo
# matriz = Operations.pivot(matriz)

  # Apresentando a matriz inicial
  #
  matriz.show_matrix
  # Realizando o método da eliminação de Gauss
  # Encontrando uma matriz triângular superior
  matriz_gauss = Methods.gauss(matriz)
  # Apresentando a matriz resultante do método da eliminição de Gauss
  #
  puts "\n"
  puts '~=~= Matriz estendida depois do processo =~=~'
  puts "\n"
  matriz_gauss.show_matrix
  # Realizando a substituição regressiva
  #
  vetor_x = Properties.reg_substitution(matriz_gauss)
  # Apresentando as soluções
  #
  puts "\n"
  puts '~=~= Solução =~=~'
  puts "\n"
  puts 'Após o processo de substituição regressiva, obtive o seguinte vetor linha:'
  vetor_x.show_matrix

  puts "\n"
  puts '~=~= Verificando os resultados =~=~'
  puts "\n"
  # Multiplicando a matriz de coeficientes pelo vetor solução
  matriz_coeficientes = Matrix.new([[  4,  -2,   -3,   6],
                                    [ -6,   7,  6.5,  -6],
                                    [  1, 7.5, 6.25, 5.5],
                                    [-12,  22, 15.5,  -1]])
  teste = Operations.multiplies(matriz_coeficientes, vetor_x)
  puts 'Resultado da multiplicação entre a matriz de coeficientes pelo vetor solução:'
  puts "\n"
  teste.show_matrix

  puts "\n"
  puts 'Verifica-se que o vetor coluna obtido, é igual a coluna 5 da matriz estendida, antes do método de eliminação de Gauss'

  puts "\n"
  puts '                         v'
  matriz.show_matrix
  puts "\n"
  puts '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

  # Métodos iterativos
  # Método de Jacobi
  puts "\n"
  puts '-=-=-=-=-=-=-=-= Métodos Iterativos =-=-=-=-=-=-=-=-'
  puts "\n"

  puts '~= Método de Jacobi =~'
  # Matriz escolhida
  m_b = [[ 8,   -4,    0, -1,    0,    0,  20], # Matriz estendida
         [ 0, -2.5,  4.5,  0,    0,   -2,  14],
         [ 0,   -5,    0, -2,  8.5, -1.5, -30],
         [-4, 11.5, -2.5,  0,   -5,    0, -12],
         [-1,    0,    0,  3,   -2,    0,   8],
         [ 0,    0,   -2,  0, -1.5,    8,   0]]

  # Instânciando um objeto com a classe Matrix
  #
  matriz_b = Matrix.new(m_b)
  puts "\n"
  puts '~=~= Matriz estendida =~=~'
  puts "\n"
  matriz_b.show_matrix

  # Como alguns coeficientes da diagonal são iguais a zero, o processo de pivotação deve ser realizado.
  matriz_b = Operations.pivot(matriz_b)

  puts "\n"
  puts '~=~= Matriz estendida após o processo de pivotação =~=~'
  puts "\n"
  # Exibindo a matriz
  matriz_b.show_matrix

  # Solução estimada
  vetor_x_b, num_de_iteracoes = Methods.jacobi([0, 0, 0, 0, 0, 0], matriz_b, 0)

  # Apresentando a solução estimada

  puts "\n"
  puts '~=~= Solução estimada pelo método de Jacobi =~=~'
  puts "\n"

  # Realizando o arredondamento da solução

  n = vetor_x_b.num_of_lines

  n.times do |i|
    # Arredondando para 6 casas decimais
    vetor_x_b.element(i, 0, vetor_x_b.element(i, 0).round(6))
  end

  vetor_x_b.show_matrix

  # Verificando os resultados

  # Matriz de coeficientes do sistema
  matriz_b_coeficientes = Matrix.new([[ 8,   -4,    0, -1,    0,    0],
                                      [ 0, -2.5,  4.5,  0,    0,   -2],
                                      [ 0,   -5,    0, -2,  8.5, -1.5],
                                      [-4, 11.5, -2.5,  0,   -5,    0],
                                      [-1,    0,    0,  3,   -2,    0],
                                      [ 0,    0,   -2,  0, -1.5,    8]])

  # Realizando a multiplicação da matriz de coeficientes pelo vetor solução

  teste_b = Operations.multiplies(matriz_b_coeficientes, vetor_x_b)

  # Arredondamento do teste

  n = teste_b.num_of_lines

  n.times do |i|
    teste_b.element(i, 0, teste_b.element(i, 0).round(6))
  end

  # Apresentando o resultado da multiplicação entre a matriz de coeficientes e o vetor solução

  puts "\n"
  puts 'Apresentando o resultado da multiplicação entre a matriz de coeficientes e o vetor solução.'
  puts "\n"
  puts '~=~= Resultado da multiplicação =~=~'
  puts "\n"

  teste_b.show_matrix

  puts "\n"
  puts 'Podemos verificar que o resultado é, aproximadamente, igual a coluna 7 da matriz, antes do processo de pivotação.'
  puts "\n"
  puts "O número de iterações foi: #{num_de_iteracoes}."
  puts '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

  # Método de Gauss-Seidel

  puts "\n"
  puts '~= Método de Gauss-Seidel =~'

  # Matriz escolhida
  m_c = [[ 8,   -4,    0, -1,    0,    0,  20], # Matriz estendida
         [ 0, -2.5,  4.5,  0,    0,   -2,  14],
         [ 0,   -5,    0, -2,  8.5, -1.5, -30],
         [-4, 11.5, -2.5,  0,   -5,    0, -12],
         [-1,    0,    0,  3,   -2,    0,   8],
         [ 0,    0,   -2,  0, -1.5,    8,   0]]

  # Instânciando um objeto com a classe Matrix
  #
  matriz_c = Matrix.new(m_c)

  puts "\n"
  puts '~=~= Matriz estendida =~=~'
  puts "\n"
  # Apresentando a matriz
  matriz_c.show_matrix

  # Realizando o processo de pivotação
  matriz_c = Operations.pivot(matriz_c)

  puts "\n"
  puts '-=-= Matriz após o processo de pivotação =~=~'
  puts "\n"
  # Exibindo a matriz
  matriz_c.show_matrix

  puts "\n"
  puts '~=~= Solução encontrada com o método iterativo de Gauss-Seidel =~=~'
  puts "\n"

  # Encontrando a solução estimada
  vetor_x_c, num_de_iteracoes = Methods.gauss_seidel([0, 0, 0, 0, 0, 0], matriz_c, 0)

  # Arredondamento das solução

  n = vetor_x_c.num_of_lines

  n.times do |i|
    # Arredondando para 6 casas decimais
    vetor_x_c.element(i, 0, vetor_x_c.element(i, 0).round(6))
  end

  # Apresentando o vetor solução
  vetor_x_c.show_matrix

  # Verificando os resultados

  # Matriz de coeficientes do sistema
  matriz_c_coeficientes = Matrix.new([[ 8,   -4,    0, -1,    0,    0],
                                      [ 0, -2.5,  4.5,  0,    0,   -2],
                                      [ 0,   -5,    0, -2,  8.5, -1.5],
                                      [-4, 11.5, -2.5,  0,   -5,    0],
                                      [-1,    0,    0,  3,   -2,    0],
                                      [ 0,    0,   -2,  0, -1.5,    8]])

  # Realizando a multiplicação da matriz de coeficientes pelo vetor solução

  teste_c = Operations.multiplies(matriz_c_coeficientes, vetor_x_c)

  # Arredondamento do teste

  n = teste_c.num_of_lines

  n.times do |i|
    teste_c.element(i, 0, teste_c.element(i, 0).round(6))
  end

  # Apresentando o resultado da multiplicação entre a matriz de coeficientes e o vetor solução

  puts "\n"
  puts 'Apresentando o resultado da multiplicação entre a matriz de coeficientes e o vetor solução.'
  puts "\n"
  puts '~=~= Resultado da multiplicação =~=~'
  puts "\n"

  teste_b.show_matrix

  puts "\n"
  puts 'Podemos verificar que o resultado é, aproximadamente, igual a coluna 7 da matriz, antes do processo de pivotação.'
  puts "\n"
  puts "O número de iterações foi: #{num_de_iteracoes}."
  puts '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

end
