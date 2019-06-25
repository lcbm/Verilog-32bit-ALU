# Projeto de Infraestrutura de Hardware

**Grupo**: Leonardo Melo, Maria do Carmo, Tiago Valença e Victor Almeida.

**Entrega:** 27 de junho de 2019, até o horário de fim da aula de infraestrutura de hardware.

## Projeto

Entregar um relatório contendo a resposta das questões a seguir. Todos os código-fonte utilizados devem ser anexados à entrega. A qualidade do relatório (coesão, coerência, clareza, organização, entre outros pontos necessários a um documento) também consistirá em ponto de avaliação.

### Verilog

Implemente uma ULA e seu controlador em verilog. A ULA deve ser similar à utilizada no seu projeto 2, incluindo um indicativo de overflow. Apresente a forma de onda da entrada e saída da sua ULA para as instruções a seguir:

| Instrução         | Operação                            |
|:------------------|:------------------------------------|
| add rd, rs, rt    | rd = rs + rt.                       |
| addi rd, rs, imm  | rd = rs + imm.                      |
| sub rd, rs, rt    | rd = rs - rt.                       |
| and rd, rs, rt    | rd = rs && rt                       |
| andi rd, rs, imm  | rd = rs && imm                      |
| or rd, rs, rt     | rd = rs || rt                       |
| sll rd, rt, shamt | rd = rt << shamt                    |
| srl rd, rt, shamt | rd = rt >> shamt. Ignora o sinal    |
| sra rd, rt, shamt | rd = rt >> shamt. Preserva o sinal. |
| slt rs, rt, rd    | rd = (rs < rt) ? 1 : 0. Seta rd para 1 caso rs seja menor que rt. 0 caso contrário. |

### MIPS

Utilizando o simulador MARS para o microcontrolador MIPS e este [código de exemplo](http://courses.missouristate.edu/KenVollmar/MARS/Fibonacci.asm), analise o comportamento da memória cache utilizando a ferramenta *Data Cache Simulation Tool*. Para cada conjunto de experimentos, altere APENAS a característica que será analisada. Informe no relatório qual a configuração completa utilizada em cada experimento. Faça experimentos variando:

1. Tipo de mapeamento
    * Direto
    * Completamente associativo
    * Associativo de grau 2
    * Associativo de grau 4

2. Número de blocos: 1, 2, 4, 8, 16

3. Tamanho do bloco em palavras: 1, 2, 4, 8, 16
