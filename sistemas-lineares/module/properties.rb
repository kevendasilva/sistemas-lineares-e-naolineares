# Propriedades de uma matriz
module Properties
  # Pegando uma coluna de uma matriz
  def self.take_column(column, matrix)
    result = []
    matrix.num_of_lines.times do |i|
      result.push(matrix.element(i, column))
    end
    result
  end

  # Trocando a posicao de duas linhas
  def self.switch_line(line_a, line_b, matrix)
    aux = matrix.line(line_a)
    matrix.line(line_a, line_b)
    matrix.line(line_b, aux)
    matrix
  end

  # Substituindo uma coluna
  def self.replace_column(column, new_column, matrix)
    matrix.size.times do |i|
      matrix[i][column] = new_column[i]
    end
    matrix
  end
end
