# Implementação dos métodos
module Methods
  include Operations

  def self.vector(matrix_gauss, diag)
    line = []
    line.push(matrix_gauss.line(diag))
    Matrix.new(line, 'v', 'l')
  end

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
end
