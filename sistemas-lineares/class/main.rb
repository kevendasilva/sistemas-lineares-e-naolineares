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

  # O colchete mais externo não deve ser removido e, uma linha está dentro de um outro colchete.
  m = [[ 4,  -2,   -3,   6,   12], # Matriz estendida
       [-6,   7,  6.5,  -6, -6.5],
       [ 1, 7.5, 6.25, 5.5,   16],
       [-12, 22, 15.5,  -1,   17] ]

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
  vetor_x = Properties.sub_regressiva(matriz_gauss)
  # Apresentando as soluções
  #
  puts "\n"
  puts '~=~= Solução =~=~'
  puts "\n"
  puts 'Após o processo de substituição regressiva, obtive o seguinte vetor coluna:'
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
  puts 'Verifica-se que o vetor coluna obtido, é igual a coluna 5 da matriz estendida, antes do método da eliminação de Gauss'
end
