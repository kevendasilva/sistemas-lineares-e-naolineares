# Operações utilizadas nos métodos
module Operations
  # Mensagem de erro
  def self.error_message
    puts "(!) Impossível realizar operação (!)\n       Verifique as entradas!"
  end

  # Trocando a posição de duas linhas
  def self.switch_line(line_a, line_b, matrix)
    aux = matrix.line(line_a)
    matrix.line(line_a, matrix.line(line_b))
    matrix.line(line_b, aux) 
    matrix
  end

  # Pegando uma coluna de uma matriz
  def self.take_column(column, matrix)
    result = []
    matrix.num_of_lines.times do |i|
      result.push(matrix.element(i, column))
    end
    result
  end

  # Substituindo uma coluna
  def self.replace_column(column, new_column, matrix)
    matrix.size.times do |i|
      matrix[i][column] = new_column[i]
    end
    matrix
  end

  # OK
  # Soma
  def self.sum(input_a, input_b)
    result = []
    # A soma será realizada somente se a dimensões da matrizes forem iguais
    if (input_a.instance_of? Matrix) && (input_b.instance_of? Matrix) && (input_a.dimensions == input_b.dimensions)
      # Caso seja um vetor coluna
      if input_a.num_of_columns == 1
        line = []
        input_a.num_of_lines.times do |j| # O número de linhas
          line.push(input_a.element(0, j) + input_b.element(0, j))
        end
        result.push(line)
        result = Matrix.new(result, 'v', 'c')
      # Caso sejam vetores linha ou duas matrizes qualquer
      else
        input_a.num_of_lines.times do |i|
          line = []
          input_a.num_of_columns.times do |j|
            line.push(input_a.element(i, j) + input_b.element(i, j))
          end
          result.push(line)
        end
        result = if input_a.num_of_lines == 1
                   Matrix.new(result, 'v', 'l')
                 else
                   Matrix.new(result)
                 end
      end
    else
      error_message
    end
    result
  end

  # OK
  # Diferença
  def self.difference(input_a, input_b)
    result = []
    # A diferença será realizada somente se as dimensões das matrizes forem iguais
    if (input_a.instance_of? Matrix) && (input_b.instance_of? Matrix) && (input_a.dimensions == input_b.dimensions)
      # Caso seja um vetor coluna
      if input_a.num_of_columns == 1
        line = []
        input_a.num_of_lines.times do |j| # O número de linhas
          line.push(input_a.element(0, j) - input_b.element(0, j))
        end
        result.push(line)
        result = Matrix.new(result, 'v', 'c')
      # Caso sejam vetores linha ou duas matrizes qualquer
      else
        input_a.num_of_lines.times do |i|
          line = []
          input_a.num_of_columns.times do |j|
            line.push(input_a.element(i, j) - input_b.element(i, j))
          end
          result.push(line)
        end
        result = if input_a.num_of_lines == 1
                   Matrix.new(result, 'v', 'l')
                 else
                   Matrix.new(result)
                 end
      end
    else
      error_message
    end
    result
  end

  def self.multiplies_aux(input_a, input_b, line, column)
    result = 0
    input_a.num_of_columns.times do |j|
      result += input_a.element(line, j) * input_b.element(j, column)
    end
    result
  end

  def self.multiplies(input_a, input_b)
    result = []
    # Multiplicacao entre matrizes
    if (input_a.instance_of? Matrix) && (input_b.instance_of? Matrix) && (input_a.num_of_columns == input_b.num_of_lines)
      input_a.num_of_lines.times do |i|
        line = []
        input_b.num_of_columns.times do |j|
          line.push(multiplies_aux(input_a, input_b, i, j))
        end
        result.push(line)
      end
      result = Matrix.new(result)
    # Uma constante vezes uma matriz
    elsif (input_a.is_a? Numeric) && (input_b.instance_of? Matrix)
      # Caso seja um vetor coluna
      if input_b.num_of_columns == 1
        column = []
        input_b.num_of_lines.times do |j|
          column.push(input_a * input_b.element(j, 0))
        end
        result.push(column)
        result = Matrix.new(result, 'v', 'c')
        # Caso seja um vetor linha ou matriz
      else
        input_b.num_of_lines.times do |i|
          line = []
          input_b.num_of_columns.times do |j|
            line.push(input_a * input_b.element(i, j))
          end
          result.push(line)
        end
        result = if input_b.num_of_lines == 1
                   Matrix.new(result, 'v', 'l')  # Caso seja um vetor linha
                 else
                   Matrix.new(result) # Caso seja uma matriz
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
    num_of_lines = matrix.num_of_lines - 1
    num_of_lines.times do
      line_before = line
      num_of_iterations = matrix.num_of_lines - line
      bigger = [matrix.element(a, a), a]
      num_of_iterations.times do
        if matrix.element(line, a).abs > bigger[0]
          bigger[0] = matrix.element(line, a)
          bigger[1] = line
        end
        line += 1
      end
      matrix = switch_line(a, bigger[1], matrix) if bigger[1] != a
      line = line_before + 1
      a += 1
    end
    # Veficando se, após o processo de pivotação ainda existe um elemento pivô igual a zero
    matrix.num_of_lines.times do |d|
      # Caso exista, o fluxo é desviado para o método pivot_adjust, que tem como objetivo 
      # alterar as linhas da matriz de modo que nenhum pivô seja nulo (supondo que o sistema
      # linear descrito pela matriz possui solução)
      pivot_adjust(matrix, d) if matrix.element(d, d).zero?
    end
    matrix
  end

  # Ajuste de pivotação
  def self.pivot_adjust(matrix, d)
    # Caso o elemento pivô seja zero, é preciso procurar uma nova linha, cujo elemento pivô não
    # se anule no processo de troca.
    # Ou seja, caso uma linha d possua o elemento pivô, na posição (d, d), igual a zero
    # procure uma linha l, com d diferente de l, de modo que o elemento (l, d) (novo pivô da linha d)
    # seja diferente de zero, e o elemento da linha d, na posição (d, l), seja diferente de zero.
    #
    # Percorrrendo todas as linhas da matriz
    find = false
    l = 0
    while !find && l < matrix.num_of_lines
      if (l != d) && (matrix.element(l, d) != 0) && (matrix.element(d, l) != 0)
        matrix = switch_line(l, d, matrix)
        find = true
      end
      l += 1
    end
    matrix
  end
end
