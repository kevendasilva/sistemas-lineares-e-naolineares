require_relative 'matrix'
require_relative '../module/methods'
require_relative '../module/properties'
require_relative '../module/operations'
# Classe para teste com a matriz 6x6 usada nos métodos iterativos
class Test
  include Properties
  include Methods
  include Operations

  # Testando o método de eliminação de Gauss com a matriz
  m = [[ 8,   -4,    0, -1,    0,    0,  20], # Matriz estendida
      [ 0, -2.5,  4.5,  0,    0,   -2,  14],
      [ 0,   -5,    0, -2,  8.5, -1.5, -30],
      [-4, 11.5, -2.5,  0,   -5,    0, -12],
      [-1,    0,    0,  3,   -2,    0,   8],
      [ 0,    0,   -2,  0, -1.5,    8,   0]]

  matrix = Matrix.new(m)

  # Apresentando a matriz

  puts '### Matriz antes do processo de eliminação de Gauss ###'
  puts "\n"
  matrix.show_matrix
  puts "\n \n"

  # Realizando o processo de pivotação com a matriz

  matrix = Operations.pivot(matrix)

  # Imprimindo o resultado da pivotação

  puts '### Matriz após o processo de pivotação ###'
  puts "\n"
  matrix.show_matrix
  puts "\n \n"

  # Utilizando o método de eliminação de Gauss

  matrix_gauss = Methods.gauss(matrix)

  # Apresentando a matriz triangular superior, resultante do método de eliminação de Gauss

  puts '### Matriz triangular superior, resultante do método de eliminação de Gauss ###'
  puts "\n"
  matrix_gauss.show_matrix
  puts "\n \n"

  puts 'Possível erro na implementação do método. O elemento na linha 6 e coluna 3 é diferente de zero.'
  puts 'Erro da linguagem? Verificar implementação.'
  puts 'Todavia, considerarei que esse elemento é igual a zero.'
  puts "\n \n"

  # Realizando o processo de substituíção regressiva

  vetor_x = Properties.reg_substitution(matrix_gauss)

  # Apresentando o resultado encontrado com o método

  puts '### Resultado encontrado ###'
  puts "\n"
  vetor_x.show_matrix
  puts "\n \n"
end
