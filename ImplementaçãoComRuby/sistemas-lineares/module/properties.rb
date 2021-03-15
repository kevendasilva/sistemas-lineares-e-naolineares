# Propriedades de uma matriz
module Properties
  def self.a_ij(matrix, i, j) # Elemento a_ij
    matrix.element(i, j)
  end

  def self.b_i(matrix, i) # Elemento b_i
    matrix.element(i, matrix.num_of_lines)
  end

  def self.x_j(x, j) # Incógnita x_j
    x[j]
  end

  def self.sum(initial, final, i, matrix, x)
    sum = 0
    (initial..final).each do |j|
      sum += a_ij(matrix, i, j) * x_j(x, final - j)
    end
    sum
  end

  def self.initial(matrix, n) # Valor da incógnita final (x_n)
    b_n = matrix.element(n, n + 1)
    a_nn = matrix.element(n, n)
    b_n.to_f / a_nn
  end

  def self.reg_substitution(matrix)
    n = matrix.num_of_lines - 1
    x = [initial(matrix, n)]
    range = (0..(n - 1)).to_a.reverse
    range.each do |i|
      a_ij = a_ij(matrix, i, i).to_f
      b_i = b_i(matrix, i)
      x_i = (b_i - sum(i + 1, n, i, matrix, x)) / a_ij.to_f
      x.push(x_i)
    end
    Matrix.new([x.reverse], 'v', 'c')
  end
end
