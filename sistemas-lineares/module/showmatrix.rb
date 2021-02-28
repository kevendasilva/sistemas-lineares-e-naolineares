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
  def self.matrix_to_string(matrix)
    # Passa a matrix para string
    matrix.size.times do |line|
      matrix[0].size.times do |column|
        matrix[line][column] = matrix[line][column].to_s
      end
    end
    matrix
  end

  # Pegando uma coluna de uma matriz
  def self.take_column(column, matrix)
    result = []
    matrix.size.times do |i|
      result.push(matrix[i][column])
    end
    result
  end

  # Ajustando a matriz
  def self.adjust_matrix(matrix)
    matrix_string = matrix_to_string(matrix)
    matrix_string[0].size.times do |i|
      matrix_string = Operations.replace_column(i, adjust(take_column(i, matrix_string)), matrix_string)
    end
    matrix_string
  end

  # Imprimindo uma linha
  def self.show_line(line, type = 'm')
    string_line = '|'
    line.size.times do |i|
      string_line += if i < line.size - 1
                       "#{line[i]}  "
                     else
                       "#{line[i]}|"
                     end
    end
    string_line += '^T' if type == 'c'
    puts string_line
  end

  # Imprimindo uma matriz
  def self.show_matrix(matrix, type = 'm')
    m = adjust_matrix(matrix)
    m.size.times do |i|
      show_line(m[i], type)
    end
  end
end
