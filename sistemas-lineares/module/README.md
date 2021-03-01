# **Informações sobre os Módulos**

Informações úteis sobre os módulos implementados.

## Módulo Methods

O módulo **Methods** reúne todas as implementações dos métodos, abordados nesse trabalho.

### Método de eliminação de Gauss

Dentro do módulo **Operations**, é possível utilizar a função *pivot* para realizar o método com pivotação da matriz.

## Módulo Operations

Já o módulo **Operations** foi utilizado para encapsular as funções que realizam operações com objetos da classe Matrix. As principais funções são listadas a seguir.

### **Sum**

Essa função realiza a "soma" de dois objetos da classe Matrix, ou seja, a soma de duas matrizes.

### **Difference**

A função realiza a "diferença" entre dois objetos da classe Matrix, ou seja, a diferença entre duas matrizes.

### **Multiplies**

Multiplica duas matriz, caso a regra da multiplicação de matrizes seja satisfeita. E, realiza a multiplicação de uma constante por uma matriz (essa ordem deve ser seguida, primeiro a constante e depois a matriz).

#### **Exemplo**

`multiplies`: realizando a multiplicação de uma constante por um vetor linha.

```
vetor_linha = Matrix.new([[1, 3]], 'v', 'l')
vetor_mult = Operations.multiplies(3, vetor_linha)
vetor_mult.show_matrix
|3  9|
```

## Módulo Showmatrix

Esse módulo é utilizado para "imprimir" uma matriz. Nele são utilizadas funções que transformam os número em string e, ajuste são realizados. De modo que, cada elemento de uma coluna, esteja alinhado com os demais elementos da mesma coluna.

## Módulo Properties

O módulo **Properties** reúne algumas funções especiais. Como por exemplo, a função `sub_regressiva`, utilizada para determinar as soluções de um sistema linear.