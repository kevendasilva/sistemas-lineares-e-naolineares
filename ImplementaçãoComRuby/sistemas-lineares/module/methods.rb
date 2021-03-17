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
    matrix_gauss = Marshal.load(Marshal.dump(matrix)) # Criando uma copia do parãmetro de entrada
    line = 1 # A eliminação começa na "linha 1" (que na verdade é a linha 2)
    a = 0 # Coluna
    (matrix_gauss.num_of_lines - 1).times do # Percorrendo (n - 1) linhas da matriz. Começando a partir da segunda linha.
      line_before = line # "Salvando" o número da linha 
      num_of_interations = matrix_gauss.num_of_lines - line # Número de linhas que serão utilizadas nas operações.
      num_of_interations.times do
        m = matrix_gauss.element(line, a).to_f / matrix_gauss.element(a, a)
        line_i = Operations.multiplies(m, vector(matrix_gauss, a))
        line_d = vector(matrix_gauss, line)
        line_d = Operations.difference(line_d, line_i)
        matrix_gauss.line(line, line_d.line(0))
        line += 1 # Mudando para a próxima linha
      end
      line = line_before + 1 # linha retorna para a posição inicial mais 1.
      a += 1 # Mudando de coluna
    end
    matrix_gauss # Retornando o resultado
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

  def self.err_x_i(initial_solution, next_solution, arq)
    err_x_i = [] # Array contendo o erro de cada incógnita.
    err = [] # Erro de cada variável
    num_of_interations = initial_solution.size
    num_of_interations.times do |i| # Verificando o erro relativo estimado
      err_i = ((next_solution[i] - initial_solution[i]) / initial_solution[i]).abs
      err.push(err_i)
      if err_i < 0.03
        err_x_i.push(true) # Caso o erro da incógnita seja menor que o erro escolhido, o array recebe "true"
      else
        err_x_i.push(false) # Caso contrário, recebe "false"
      end
    end

    # Gravando os dados
    err.size.times do |i|
      err[i] = 999 if initial_solution[i].zero?
      input = %({"value":#{next_solution[i]}, "err":#{err[i]}})
      input += ',' if i < (err.size - 1)
      arq.puts input
    end
    arq.puts ']}'

    err_x_i
  end

  # Método iterativo de Jacobi
  def self.jacobi(initial_solution, matrix, ite, arq)
    ite += 1 # Contando de iterações
    next_solution = [] # Próxima solução
    n = matrix.num_of_lines - 1
    (0..n).each do |i| # Percorrendo os valores das incógnitas
      next_solution.push((Properties.b_i(matrix, i) - sum(initial_solution, matrix, i, n)) / Properties.a_ij(matrix, i, i).to_f)
    end

    # Inicio de uma nova iteração
    arq.puts %({"variable":[)

    # Caso a nova solução estimada ainda não seja satisfatória, uma nova iteração deve ser iniciada.
    err_x_i = err_x_i(initial_solution, next_solution, arq)
    # Caso o erro de uma das variáveis não atenda a condição estabelecida.
    if err_x_i.include? false
      # Nova iteração
      arq.puts ','
      jacobi(next_solution, matrix, ite, arq) # Uma nova iteração é iniciada.
    # Caso a solução encontrada seja satisfatória
    else
      # Fechando o arquivo
      arq.puts ']'
      arq.close
      [Matrix.new([next_solution], 'v', 'c'), ite] # Se não, a solução encontrada é retornada juntamente com o número de iterações.
    end
  end

  # Método iterativo de Gauss-Seidel
  def self.gauss_seidel(initial_solution, matrix, ite, arq)
    ite += 1 # Contado de iterações
    next_solution = Marshal.load(Marshal.dump(initial_solution)) # Fazendo uma cópia
    n = matrix.num_of_lines - 1
    (0..n).each do |i| # Diferentemente do método de Jacobi, no método de Gauss-Seidel as incógnitas são atualizadas na mesma iteração.
      next_solution[i] = (Properties.b_i(matrix, i) - sum(next_solution, matrix, i, n)) / Properties.a_ij(matrix, i, i).to_f
    end

    # Inicio de uma nova iteração
    arq.puts %({"variable":[)

    # Caso a nova solução estimada ainda não seja satisfatória, uma nova iteração deve ser iniciada.
    err_x_i = err_x_i(initial_solution, next_solution, arq)
    # Caso o erro de uma das variáveis não atenda a condição estabelecida.
    if err_x_i.include? false
      # Nova iteração
      arq.puts ','
      gauss_seidel(next_solution, matrix, ite, arq) # Uma nova iteração é iniciada.
    # Caso a solução encontrada seja satisfatória
    else
      # Fechando o arquivo
      arq.puts ']'
      arq.close
      [Matrix.new([next_solution], 'v', 'c'), ite] # Se não, a solução estimada é retornada juntamente com o número de iterações.
    end
  end
end
