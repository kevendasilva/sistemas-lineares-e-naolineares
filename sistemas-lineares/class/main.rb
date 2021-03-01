require_relative 'matrix'
require_relative '../module/methods'
require_relative '../module/operations'
require_relative '../module/showmatrix'
# Classe main
class Main
  include Methods
  include Operations
  include Showmatrix

  m = [[ 4,  -2,   -3,   6,   12], # Matriz estendida
       [-6,   7,  6.5,  -6, -6.5],
       [ 1, 7.5, 6.25, 5.5,   16],
       [-12, 22, 15.5,  -1,   17]]

  puts 'Matriz antes do processo de pivotação'
  matriz = Matrix.new(m)
  matriz.show_matrix
  puts 'Matriz depois da operação'
  matriz_pivot = Operations.pivot(matriz)
  matriz_pivot.show_matrix
end
