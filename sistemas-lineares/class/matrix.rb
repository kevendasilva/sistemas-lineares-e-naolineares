require_relative '../module/showmatrix'
# Classe matriz
class Matrix
  include Showmatrix

  attr_reader :type, :matrix, :reverse, :dimensions

  # Construtor da classe
  def initialize(input = [], type = 'm', line_or_column = nil)
    @matrix = input
    @matrix_string = Showmatrix.show_matrix(@matrix)
    @type = type
    reverse_def
    dimension(type, line_or_column)
  end

  # Dimensoes da matriz
  def dimension(type, line_or_column)
    @dimensions = []
    # Caso esteja vazia
    if @matrix.empty?
      @@dimensions.push(0, 0)
    # Caso seja uma matriz
    elsif type == 'm'
      @dimensions.push(@matrix.size, @matrix[0].size)
    # Caso seja um vetor
    elsif type == 'v'
      case line_or_column
      when 'l'
        @dimensions.push(1, @matrix[0].size)
      when 'c'
        @dimensions.push(@matrix[0].size, 1)
      end
    end
  end

  # Em construcao
  def reverse_def
    @reverse = false
  end

  def matrix=(input, type = 'm', line_or_column = nil)
    @matrix = input
    @type = 'm'
    dimension(type, line_or_column)
  end

  # Numero de linhas da matriz
  def num_of_lines
    @dimensions[0]
  end

  # Numero de colunas da matriz
  def num_of_columns
    @dimensions[1]
  end

  # Alterando elementos de uma matriz
  def element(line, column, element = nil)
    if element.nil?
      @matrix[line][column]
    else
      @matrix[line][column] = element
    end
  end

  # Alterando linhas de uma matriz
  def line(line, new_line = nil)
    if new_line.nil?
      @matrix[line]
    else
      @matrix[line] = new_line
    end
  end

  # Imprimindo uma matriz
  def show_matrix
    @matrix_string.size.times do |i|
      show_line(@matrix_string[i])
    end
  end

  # Imprimindo uma linha
  def show_line(line)
    string_line = '|'
    line.size.times do |i|
      string_line += if i < line.size - 1
                       "#{line[i]}  "
                     else
                       "#{line[i]}|"
                     end
    end
    string_line += '^T' if @type == 'c'
    puts string_line
  end
end
