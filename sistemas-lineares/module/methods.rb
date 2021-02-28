require_relative 'operations'
# Implementação dos métodos
module Methods
  include Operations

  def self.gauss(matrix)
    line = 1
    a = 0
    num_of_lines = matrix.num_of_lines
    num_of_lines.times do
      line_before = line
      num_of_interations = matrix.num_of_lines - line
      num_of_interations.times do
        m = matrix.element(line, a).to_f / matrix.element(a, a)
        matrix.line(line, Operations.difference(matrix.line(line), Operations.multiplies(matrix.line(a), m)))
        line += 1
      end
      line = line_before + 1
      a += 1
    end
    matrix
  end
end
