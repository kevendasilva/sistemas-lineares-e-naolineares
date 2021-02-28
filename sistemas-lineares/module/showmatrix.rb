require_relative 'operations'
# Modulo utilizado para imprimir uma matriz
module Showmatrix
  include Operations

  # Igualando os elementos das colunas
  def self.add_space(num, item)
    result = ''
    num.times do
      result += ' '
    end
    result += item
    result
  end

  # Ajustando os elementos da colunas
  def self.adjust(column)
    max = 0
    # Definindo a maior string da coluna
    column.size.times do |i|
      max = column[i].size if column[i].size > max
    end
    # Adicionando espaços
    column.size.times do |i|
      column[i] = add_space(max - column[i].size, column[i])
    end
    column
  end

  # Transformando os elementos da matriz em string
  def self.matrix_to_string(matrix_string)
    # Passa a matrix para string
    matrix_string.size.times do |line|
      matrix_string[0].size.times do |column|
        matrix_string[line][column] = matrix_string[line][column].to_s
      end
    end
    matrix_string
  end

  # Pegando uma coluna de uma matriz
  def self.take_column(column, matrix_string)
    result = []
    matrix_string.size.times do |i|
      result.push(matrix_string[i][column])
    end
    result
  end

  # Ajustando a matriz
  def self.adjust_matrix(matrix_string)
    matrix_string = matrix_to_string(matrix_string)
    matrix_string[0].size.times do |i|
      matrix_string = Operations.replace_column(i, adjust(take_column(i, matrix_string)), matrix_string)
    end
    matrix_string
  end

  # Imprimindo uma matriz
  def self.show_matrix(matrix)
    # Alocando um novo espaço na memória, em vez de criar uma referência para o atributo matrix
    matrix_string = Marshal.load(Marshal.dump(matrix))
    adjust_matrix(matrix_string)
=begin
    m.size.times do |i|
      show_line(m[i], type)
    end
=end
  end
end
