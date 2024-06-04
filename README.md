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






Agregação: Imagine um sanduíche. Ele é feito de vários ingredientes diferentes, como pão, alface, queijo e carne. Cada ingrediente pode existir separadamente e ser parte de outros sanduíches. Mas juntos, formam um sanduíche delicioso!

Composição: Agora, pense em um carro. Ele é feito de várias partes, como motor, rodas, volante e assentos. Essas partes não fazem muito sentido sozinhas, mas quando estão todas juntas, você tem um carro que pode te levar para onde você quiser!

Herança: Vamos falar sobre famílias. Seu avô e seu pai são parte da mesma família, certo? Seu pai pode ter características semelhantes ao seu avô, como cor dos olhos ou forma do nariz. Herança na programação é como isso, onde uma classe pode herdar características e comportamentos de outra classe, como um "pai" passando características para um "filho".

Polimorfismo: Imagine um controle remoto. Ele pode controlar diferentes dispositivos, como uma TV, um DVD player ou um sistema de som. Mesmo botões que fazem coisas diferentes em cada dispositivo, como o botão "play", funcionam de maneira diferente dependendo do que você está controlando. Isso é polimorfismo, onde coisas diferentes podem ser tratadas da mesma maneira, mas executam comportamentos diferentes.

Interface: Pense em um manual de instruções. Ele diz o que você pode fazer com um objeto, mas não como fazê-lo. Interfaces na programação são como isso, elas definem o que uma classe deve fazer, mas não como ela faz. É como uma promessa de que uma classe vai ter certos comportamentos.

Classe Abstrata: Vamos imaginar uma casa. Ela tem paredes, portas, janelas e telhado. Mas você não pode realmente viver em uma casa sem um plano, certo? Uma classe abstrata é como esse plano, ela define o que uma casa deve ter, mas você não pode realmente construir uma casa baseada apenas nela. Ela precisa ser estendida e implementada em classes concretas para se tornar útil.


#Padrões de Projeto (Design Patterns - GoF)
Por Otávio Miranda
Curso: https://www.youtube.com/playlist?list=PLbIBj8vQhvm0VY5YrMrafWaQY2EnJ3j8H

Resoluções em Dart
Singleton aula 4
https://www.youtube.com/watch?v=x9h8MgAvi_I&list=PLbIBj8vQhvm0VY5YrMrafWaQY2EnJ3j8H&index=4
Intenção Oficial
 Garantir que uma classe tenha somente um instância no programa e fornecer um ponto 
 de acesso global para a mesma.

Aplicabilidade
Use-o quando uma classe precisa ter somente uma instância disponível em todo o seu programa
Use o quando precerer que está usando variáveis globais para manter partes importantes do 
programa, como variáveis de configuração que são usadas por toda a aplicação

Bom
Acesso controlado a instancia unica
É fcil permitir um número maiord de instancias caso mude de ideia
Usa o Lazy instantiation, o Singleton só é criado no momento do uso
Substitui variaveis globasi

Ruim
É mais dificil de testar
Vioal o principio da responsabilidade unica
Requer tratamento especial em casos de ocorrencia
Erich Gama (autor) descreveu que este seria o unico padrão que ele 
removeria se fosse refatorar o livro

Aula 5 (Singleton)
https://www.youtube.com/watch?v=JnCWTbICOWg&list=PLbIBj8vQhvm0VY5YrMrafWaQY2EnJ3j8H&index=5
source code:
lib/creacionais/singleton/db/my_db.dart

Builder
https://www.youtube.com/watch?v=2VwLvwsIu-8&list=PLbIBj8vQhvm0VY5YrMrafWaQY2EnJ3j8H&index=6
Intenção Oficial
Separar a construção de um objeto complexo
da sua representação de modo que o mesmo processo de construção
possa criar diferentes representações

Bom
Separa criacao da utilizacao
O cliente nao precisa criar objetos diretamente
O mesmo codigo pode construir objetos diferentes
Ajuda na aplicacao do principios SRP e OCP

Ruim
O codigo final pode se tornar muito complexo

source code:
lib/creacionais/builder/builder.dart
lib/creacionais/builder/builder2.dart


Prototype
https://www.youtube.com/watch?v=Z-_smcjkdwM&list=PLbIBj8vQhvm0VY5YrMrafWaQY2EnJ3j8H&index=8