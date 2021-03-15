require_relative '../module/showmatrix'
# Classe matriz
class Matrix
  include Showmatrix # Adicionando o módulo

  attr_reader :dimensions, :reverse, :type, :matrix # Assessores da classe

  # Construtor da classe
  def initialize(input = [], type = 'm', line_or_column = nil)
    @matrix = input
    @type = type
    reverse_def
    dimension(type, line_or_column) # Definindo as dimensões da matriz
  end

  # Dimensões da matriz
  def dimension(type, line_or_column)
    @dimensions = []
    # Caso esteja vazia
    if @matrix.empty?
      @dimensions.push(0, 0)
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
    @type = type
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
      # Caso seja um vetor linha
      if @dimensions[0] == 1 && @type == 'v'
        @matrix[0][column]
      # Caso seja um vetor coluna
      elsif @dimensions[1] == 1 && @type == 'v'
        @matrix[0][line]
      else
        @matrix[line][column]
      end
    else
      # Caso seja um vetor linha
      if @dimensions[0] == 1 && @type == 'v'
        @matrix[0][column] = element
      # Caso seja um vetor coluna
      elsif @dimensions[1] == 1 && @type == 'v'
        @matrix[0][line] = element
      # Caso seja uma matriz
      else
        @matrix[line][column] = element
      end
    end
  end

  # Alterando linhas de uma matriz
  def line(line, new_line = nil)
    if new_line.nil?
      # Caso seja um vetor linha
      if @dimensions[0] == 1
        @matrix[0]
      # Caso seja um vetor coluna
      elsif @dimensions[1] == 1
        @matrix[0][line]
      # Caso seja uma matriz
      else
        @matrix[line]
      end
    # Caso deseje alterar uma linha
    else
      # Caso seja um vetor linha
      if @dimensions[0] == 1 && @type == 'v'
        @matrix[0] = new_line
      elsif @dimensions[1] == 1 && @type == 'v'
        # Caso seja um vetor coluna
        @matrix[0][line] = if new_line.instance_of? Array
                             new_line.pop
                           else
                             new_line
                           end
      else
        # Caso seja uma matriz
        @matrix[line] = new_line
      end
    end
  end

  # Imprimindo uma matriz
  def show_matrix
    @matrix_string = Showmatrix.show_matrix(@matrix) # Criando uma cópia da matriz e passa para caracter.
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
    string_line += '^T' if @type == 'v' && @dimensions[1] == 1
    puts string_line
  end

  private :show_line, :reverse_def, :dimension # Definindo a visibilidade de alguns métodos
end
