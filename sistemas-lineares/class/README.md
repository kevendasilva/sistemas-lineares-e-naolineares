# **Informações sobre as Classes**

Detalhes a respeito das classes utilizadas nesse trabalho.

## Classe Main

A classe **Main** reúne todos os `dados de entrada`. Nessa classe é definida a matriz utilizada na aplicação dos métodos (sistemas lineares), bem como comentários sobre o passo a passo da aplicação.

## Classe Matrix

A classe **Matrix** foi utilizada para definir uma estrutura de dados `mais abstrata`. De modo que, seja possível simplicar as operações realizadas nos métodos.

### Instanciando um objeto

Existem diferenças no momento de instânciar um objeto com a classe Matrix. Caso deseje ter uma matriz, escreva as linhas entre colchetes ([]), cada linha deve ser separada por uma vírgula, e no final, as linhas devem ser inseridas dentro de um novo par de colchetes. Se deseja criar um vetor, indique essa escolha inserindo um segundo parâmetro. Defina também, se o vetor é, um vetor linha ou coluna. Isso é feito a partir de um terceiro parâmetro.

#### **Exemplos**
    
`matriz`: Não é necessário passar outros parâmetros.

```
matriz = Matrix.new([[1, 2], [3,4]])
```

O resultado é uma matriz da forma:

```         
matriz.show_matrix
|1  2|
|3  4| 
```	

`vetor`: podemos criar dois tipos de vetores: linha ou coluna.

Caso seja um vetor linha: 

```
vetor_linha = Matrix.new([[1, 2]], 'v', 'l')
```

Caso seja um vetor coluna:
 
```
vetor_coluna = Matrix.new([[1, 2]], 'v', 'c')
```

Em ambos os casos, o segundo parâmentro ('v'), indica que será uma matriz do tipo vetor. E, o terceiro parâmetro 'l' ou 'c', definem se o vetor é linha ou coluna, respectivamente.

Alguns métodos são definidos nessa classe. O mais importante é o método "show_matrix" utilizado para apresentar a matriz. O método "reverse" ainda está em construção. Este deveria retornar, caso exista, a inversa da matriz definida anteriormente.
