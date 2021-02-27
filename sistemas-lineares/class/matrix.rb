require_relative '../module/showmatrix'
# Classe matriz
class Matrix
  include Showmatrix

  @@matrix = []
  @@reverse = false
  @@dimensions = [0, 0]

  # Construtor da classe
  def initialize(input = [])
    set_matrix(input)
    set_dimensions
    set_reverse
  end

  # Dimensões da matriz
  def set_dimensions
    @@dimensions[0] = @@matrix.size
    @@dimensions[1] = @@matrix[0].size
  end

  # Em construção
  def set_reverse
    @@reverse
  end

  # Definindo a matriz
  def set_matrix(input)
    @@matrix = input
  end

  # Dimensões da matriz
  def get_dimensions
    @@reverse
  end

  # A matriz admite inversa?
  def get_reverse
    @@reverse
  end

  # Retornando a matrix
  def get_matrix
    @@matrix
  end

  # Número de linhas da matriz
  def num_of_lines
    @@dimensions[0]
  end

  # Número de colunas da matriz
  def num_of_columns
    @@dimensions[1]
  end

  # Alterando elementos de uma matriz
  def element(line, column, element = nil)
    if element.nil?
      @@matrix[line][column]
    else
      @@matrix[line][column] = element
    end
  end

  # Alterando linhas de uma matriz
  def line(line, new_line = nil)
    if new_line.nil?
      @@matrix[line]
    else
      @@matrix[line] = new_line
    end
  end

  # Imprimindo a matriz
  def show_matrix
    Showmatrix.show_matrix(@@matrix)
  end
end
