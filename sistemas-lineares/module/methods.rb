require_relative 'properties'
# Implementação dos métodos
module Methods
  include Operations
  include Properties

  # Função auxiliar
  def self.vector(matrix_gauss, diag)
    line = []
    line.push(matrix_gauss.line(diag))
    Matrix.new(line, 'v', 'l')
  end

  # Método de eliminação de Gauss
  def self.gauss(matrix)
    matrix_gauss = Marshal.load(Marshal.dump(matrix))
    line = 1
    a = 0
    matrix_gauss.num_of_lines.times do
      line_before = line
      num_of_interations = matrix_gauss.num_of_lines - line
      num_of_interations.times do
        m = matrix_gauss.element(line, a).to_f / matrix_gauss.element(a, a)
        line_i = Operations.multiplies(m, vector(matrix_gauss, a))
        line_d = vector(matrix_gauss, line)
        line_d = Operations.difference(line_d, line_i)
        matrix_gauss.line(line, line_d.line(0))
        line += 1
      end
      line = line_before + 1
      a += 1
    end
    matrix_gauss
  end

  # Soma dos termos a_ij * x_j
  def self.sum(initial_solution, matrix, i, n)
    sum = 0
    (0..n).each do |j| # Laço de repetição com j variando de 0 a n
      # Realiza a soma do termo a_ij * x_j, somente se, i != j
      sum += Properties.a_ij(matrix, i, j) * initial_solution[j] if j != i
    end
    sum # Retorna a soma
  end

  def self.err_x_i(initial_solution, next_solution)
    err_x_i = []
    num_of_interations = initial_solution.size - 1
    num_of_interations.times do |i|
      if ((next_solution[i] - initial_solution[i]) / initial_solution[i]).abs < 0.00000001
        err_x_i.push(true)
      else
        err_x_i.push(false)
      end
    end
    err_x_i
  end

  # Método iterativo de Jacobit
  def self.jacobi(initial_solution, matrix)
    next_solution = []
    n = matrix.num_of_lines - 1
    (0..n).each do |i|
      next_solution.push((Properties.b_i(matrix, i) - sum(initial_solution, matrix, i, n)) / Properties.a_ij(matrix, i, i).to_f)
    end
    # Caso a nova solução estimada ainda não seja satisfatória, uma nova iteração deve ser iniciada.
    err_x_i = err_x_i(initial_solution, next_solution)
    # Caso o erro de uma das variáveis não atenda a condição estabelecida.
    if err_x_i.include? false 
      jacobi(next_solution, matrix)
    # Caso a solução encontrada seja satisfatória
    else
      Matrix.new([next_solution], 'v', 'c')
    end
  end
end
