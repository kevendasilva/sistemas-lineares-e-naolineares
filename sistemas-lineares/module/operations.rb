# Operações utilizadas nos métodos
module Operations
  # Mensagem de erro
  def self.error_message
    puts "(!) Impossível realizar operação (!)\n       Verifique as entradas!"
  end

  # Pegando uma coluna de uma matriz
  def self.take_column(column, matrix)
    result = []
    matrix.size.times do |i|
      result.push(matrix[i][column])
    end
    result
  end

  # Trocando a posição de duas linhas
  def self.switch_line(line_a, line_b, matrix)
    aux = matrix[line_a]
    matrix[line_a] = matrix[line_b]
    matrix[b] = aux
    matrix
  end  

  # Soma
  def self.sum(input_a, input_b)
    result = []
    # Caso seja a soma de arrays e as dimensões sejam iguais
    if ((input_a.is_a? Array) && (input_b.is_a? Array) == true) && (input_a.size == input_b.size && input_a[0].size == input_b[0].size)
      case (input_a[0].is_a? Array) && (input_b[0].is_a? Array)
      when true # Caso seja a soma entre Arrays de arrays (matrizes)
        input_a.size.times do |i| # a.size representa o número de linhas
          line = []
          input_a[i].size.times do |j| # a[0].size representa o número de colunas
            line.push(input_a[i][j] + input_b[i][j])
          end
          result.push(line)
        end
      when false # Caso seja a soma entres arrays (linhas)
        input_a.size.times do |i| # a.size representa o número de colunas
          result.push(input_a[i] + input_b[i])
        end
      end
    else
      error_message
    end
    result
  end

  # Diferença
  def self.difference(input_a, input_b)
    result = []
    # Caso seja a subtração de arrays e as dimensões sejam iguais
    if ((input_a.is_a? Array) && (input_b.is_a? Array) == true) && (input_a.size == input_b.size && input_a[0].size == input_b[0].size)
      case (input_a[0].is_a? Array) && (input_b[0].is_a? Array)
      # Caso seja a subtração entre Arrays de arrays (matrizes)
      when true
        input_a.size.times do |i| # a.size representa o número de linhas
          line = []
          input_a[i].size.times do |j| # a[0].size representa o número de colunas
            line.push(input_a[i][j] - input_b[i][j])
          end
          result.push(line)
        end
      # Caso seja a subtração entres arrays (linhas)
      when false
        input_a.size.times do |i| # a.size representa o número de colunas
          result.push(input_a[i] - input_b[i])
        end
      end
    else
      error_message
    end
    result
  end

  def self.multiplies(input_a, input_b)
    result = []
    if (input_a.is_a? Array) && (input_b.is_a? Array)
      if (input_a[0].is_a? Array) && (input_b[0].is_a? Array) # Multiplicação entre matrizes
        if input_a[0].size == input_b.size # Se o número de colunas da matriz "a" é igual ao número de linhas da matriz "b"
          input_b[0].size.times do |column|
            column_i = take_column(column, input_b)
            result.push(multiplies(input_a, column_i))
          end
        else
          error_message
        end
      # Multiplicação entre uma matriz e um vetor
      elsif ((input_a[0].is_a? Array) && (input_b[0].is_a? Numeric)) || ((input_a[0].is_a? Numeric) && (input_b[0].is_a? Array))
        # Caso a entrada "a" seja um array
        if (input_a[0].is_a? Numeric) & (input_a.size == input_b.size)
          # Percorrendo as colunas da entrada "b", uma matriz
          input_b[0].size.times do |column|
            column_i = take_column(column, input_b)
            result.push(multiplies(input_a, column_i))
          end
        # Caso a entrada "a" seja uma matriz
        else
          # Percorrendo as colunas da entrada "a", uma matriz
          input_a[0].size.times do |column|
            column_i = take_column(column, input_a)
            result.push(multiplies(input_b, column_i))
          end
        end
      elsif (input_a[0].is_a? Numeric) && (input_b[0].is_a? Numeric)  # Multiplicação entre vetores
        result = 0
        input_a.size.times do |i|
          result += input_a[i] * input_b[i]
        end
      else
        error_message
      end
    # Multiplicação entre uma constante e uma matriz ou vetor
    elsif ((input_a.is_a? Numeric) && (input_b.is_a? Array)) || ((input_a.is_a? Array) && (input_b.is_a? Numeric))
      if input_a.is_a? Numeric # Caso a entrada "a" seja um número
        if input_b[0].is_a? Numeric # Se a entrada "b" for um vetor
          input_b.size.times do |i|
            result.push(input_a * input_b[i])
          end
        else # Se a entrada "b" for uma matriz
          input_b.size.times do |i|
            result.push(multiplies(input_a, input_b[i])) # Multiplicando cada linha pela entrada "a"
          end
        end
      else # Caso a entrada "a" seja um array
        if input_a[0].is_a? Numeric # Se a entrada "a" for um vetor
          input_a.size.times do |i|
            result.push(input_b * input_a[i])
          end
        else # Se a entrada "a" for uma matriz
          input_a.size.times do |i|
            result.push(multiplies(input_a[i], input_b)) # Multiplicando cada linha pela entrada "b"
          end
        end
      end
    else
      error_message
    end
    result
  end

  # Realizando a pivotacao
  def self.pivot(matrix)
    line = 1
    a = 0
    num_of_lines = matrix.size - 1
    num_of_lines.times do
      line_before = line
      num_of_iterations = matrix.size - line
      bigger = [matrix[a][a], a]
      num_of_iterations.times do
        if matrix[line][a].abs > bigger[0]
          bigger[0] = matrix[line][a]
          bigger[1] = line
        end
        line += 1
      end
      matrix = switch_line(a, bigger[1], matrix) if bigger[1] != a
      line = line_before + 1
      a += 1
    end
    matrix
  end
end
