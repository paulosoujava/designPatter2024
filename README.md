# Padrões de Projetos

Mas o que seria um padrão de projeto?
São soluções já prontas para problemas já conhecido em projetos de software.
Eles descrevem soluções típicas para alguns problemas.

Um padrão consite em:
Propósito, que desecreve brevemente o problema e a solução
Motivação: Explicação  mais afundo do problema e a solução que o padrão torna possivel
Estrutura: Mostram cada parte do padrão e como se relacionam
Códigos: Exemplos em algumas linguagens

Os padrões podem ser categorizado por seu propósito ou intenção.

Criacionais: Fornencendo mecanismos de criação de objetos que aumentam a
flexibilidade e a reutilização de código.

Estruturais: Explicam como montar objetos e classes em estruturas
maiores, enquanto ainda mantém as estruturas flexíveis e eficientes

Comportamentais: Cuidam da comunicação eficiente e da assinalação de
responsabilidade entre objetos

Quando uma solução é repetida de novo  e de novo 
em vários projetos, alguém vau eventualmente colocar um nome 
para descrever a solução em detlahes, é basicamente asssim que um
padrão é descoberto

Caracteristicas de um bom projeto
 1 - Reutilização de Código
 2 - Extensibilidade "Mudança é a única constante na vida de um programador."

Formas para se ter um bom projeto

1 Encapsule o que varia, identifique aspectos da sua aplicação que variam e separe-os
dos que permanecem os mesmos. Isso serve para minimizar os efeitos causados pelas mudanças

Encapsulamento à nível de método
 Supomos que em algum lugar do seu projeto vc tenha um método
obterTotalPedidos que calcula o total final de  um pedido, incluindo impostos.
Podemos antecipar que o código relacionado a impostos precisa mudaer no futuro.
Este será umm metodo que ira mudar com frequencia, mas até o nome do 
metodo não se importa como os impostos são calculados.
Extraia a logica do cálculo do imposto em um método separado, escondendo-o
do método original, as mudanças relacionadas a impostos se tornanram isoladas
em um único metodo

Encapsulamento a nível de classe
Com o tempo vc pode querer mais responsabilidades em um metodo que é
usado para fazer uma coisa simples. Comportamentos adicionais quase sempre vem
com seus proprios campos de ajuda e métodos que eventualmente desfocam a responsabilidade
primaria da classe que o contem. Extrair tudo para uma nova classe pode tornar as coisas
mais claras e simples

Programe para uma interface, não para uma implementação
dependa de abstrações e nao de classes concretas.

Prefira composição sobre herança
 Herança basicamente reutiliza código similar
 Porém qunado seu programa tem um monte de classe e começar a mudar
 tudo fica difícil e muitas vezes custosos.
Alguns problemas:
   - Uma subclasse não pode reduzir a interface da superclasse
   - Quando sobrescrevendo métodos você precisa se certificar
      que o novo comportamento e compativel com o comportamento base
   - A herança quebra o encapsulamento da super classe
   - As subclasses estão firmemente acopladas as superclasses
   - Tentar reutilizar códifo através da herança pode levar a criação
   -  de hierarquias de heranças paralelas

Enquanto a Herança representa uma relação É UM(a) entre classes
(Um carro É UM transporte)
a composição representa a relação TEM UM(a) (Um carro tem uma(a) motor)
Este principio tamem se aplica a agregação, uma versao mais relaxada
da composicao onde um objeto pode ter uma referencia para um outro mas nao gerencia
seu ciclo de vida. Ex:
um carro TEM UM motorista, mas ele ou ela podem usar outro carro ou apenas 
caminhar sem o carro


A Herança pode OCASIONAR UM EXPLOSAO DE SUBCLASSES

COMPOSICAO: diferentes "dimesoes"de funcionalidade extraidas para
suas proprias hierarquias de classe

SOLID
é uma sigla mnemônica em ingles para cinco principios de projetos 
destinados a fazer dos projetos de software algo mais compreensivo,
flexivel e sustentavel.

Single Responsability principle, principio da responsabilidade unica
Tente fazer com que cada classe seja responsavel por uma unica parte
da funcionalidade fornecida pelo software.
Objetivo principal é reduzir a complexidade.
Se uma classe tem muita coisa, teremos que mudar cada
vez que algo precisa ser mudado e enquanto fazemos isso
o risco de quebrar algo em que nem devieramos ter mexido é grande



Open/Closed Principle
Principio aberto/fechad
As classes devem ser abertas para extensao mas fechadas para modificaçao
A ideia principal deste principio é prevenir que o codigo existente quebre
quando voce implementa novas funcionalidades
Uma classe é aberto se vc pode estende-la, produzir uma
subclasse e fazer o que quiser com ela, adicionar novos metodos ou campos
sobrescrever o comportamento base.
Uma classe pode ser tanto aberta para extensao e fechada para modificacao ao 
mesmo tempo



Principio da substituicao de Liskov
Qndo estendo uma clase, lembre se que vc deve ser capaz
de passar objetos da subclasse em lugar de objetos da classe mae sem quebrar
o codigo cliente.
Uma subclasse NAO DEVE fortalecer pre condicoes
Uma subclasse NAO DEVE enfraquecer pre condicoes




Principio de segregacao de interface
Clientes nao devem ser forcados a depender de metodos que nao usam
Reduza as interfaces a ponto que as classes nao precise implementar
o que nao for usar



Dependency Inversion Principle
Clases de alto nivel nao deveriam depender de
classes de baixo nivel. Ambos devem depender de anstracoes
As Abstracores nao devem depender de detalhes.
Detalhes devem depender de abstracoes
Este principio sugere trocar a direcao desta dependencia






# designPatter2024
# designPatter2024
# designPatter2024
