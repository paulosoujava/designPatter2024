/*
Fornece uma interface para criar
objetos em uma suerclasse!
 Permite que as subclasses alterem o tipo
de objeto que serao criados

 Substitua chamadas diretas de construcao
 de objetos (usando o operador new por chamadas para
 um metodo fabrica especial) os objetos retornados
 por um metodo fabrica geralmetne sao chamados de produtos

 Pode parecer sem sentido, mas fazndo isto vc pode
 sobrescrever o comportamento de um objeto em uma subclasse
 de produtos que estao sendo criados pelo metodo fabrica
 Porem elas devem etr uma interface base em comum e alem
 disso o metodo fabrica na classe base deve ter seu tipo de retorno
 declarado como essa interface.
 O codigo que usa o metodo fabrica geralmetne sao chamados de
 cliente
 */

// Interface comum a todos os
//objetos que podem ser produzidos
// pelo criador e suas subclasses
abstract interface class Transport {
  Transport deliver();
}

//PRODUTOS CONCRETOS, COM IMPLEMENTACOES
//DIFERENTE
class Truck implements Transport {
  final String name;

  Truck(this.name);

  @override
  Transport deliver() {
    print("Truck $name delivered");
    return this;
  }
}

//PRODUTOS CONCRETOS, COM IMPLEMENTACOES
//DIFERENTE
class Ship implements Transport {
  final String name;

  Ship(this.name);

  @override
  Transport deliver() {
    print("Ship $name delivered");
    return this;
  }
}

//PRODUTOS CONCRETOS, COM IMPLEMENTACOES
//DIFERENTE
class Road implements Transport {
  final String name;

  Road(this.name);

  @override
  Transport deliver() {
    print("Road $name delivered");
    return this;
  }
}

abstract interface class TransportFactory {
  Transport createTransport();
}

//CREATOR METODO FABRICA QUE RETORNA NOVOS
// OBJETOS PRODUTO, TODO RETORNO DO METODO DEVE
// CORRESPONDER A INTERFACE DO PRODUTO
class AbstractFactoryCreate implements TransportFactory {
  final Transport transport;

  AbstractFactoryCreate(this.transport);

  //CRIADOR
  @override
  Transport createTransport() {
    return transport.deliver();
  }
}
//OR
enum TransportType {
  Truck,
  Ship,
  Road
}
class AbstractFactoryCreate2 {
   call(TransportType type) {
     if (type == TransportType.Truck) {
       return Truck("Truck");
     } else if (type == TransportType.Ship) {
       return Ship("Ship");
     } else if (type == TransportType.Road) {
       return Road("Road");
     }
   }
}
main() {
  final truck = AbstractFactoryCreate(Truck("Truck"));
  final ship = AbstractFactoryCreate(Ship("Ship"));
  final road = AbstractFactoryCreate(Road("Road"));

  truck.createTransport();
  ship.createTransport();
  road.createTransport();

  //OR
  final AbstractFactoryCreate2 abstractFactoryCreate2 = AbstractFactoryCreate2();
  abstractFactoryCreate2.call(TransportType.Truck);
  abstractFactoryCreate2.call(TransportType.Ship);
  abstractFactoryCreate2.call(TransportType.Road);
}


//APLICABILIDADE
//USE  FACTORY METHOD QUANDO NAO SOUBER DE ANTE MAO OS TIPOS DE
//DEPENDENCIAS EXATAS DOS OBJETOS COM OS QUAIS SEU CODIGO DEVE FUNCIONAR

//USE O FACTORY METHOD QUANDO DESEJAR FORNECER AOS USUARIOS DA SUA
//BIBLIOTECAOU FRAMEWORK UMA MANEIRA DE ESTENDER SEUS COMPONENTES INTERNOS

//REDUZA O CODIGO QUE CONSTROI COMPONENTES NO FRAMEWORK EM UM
//UNICO METODO FABRICA

//USE-O QUANDO DESEJA ECONOMIZAR RECURSOS DO SISTEMA REUTILIZANDO
//OBJETOS EXISTENTES EM VEZ DE RECRIA-LOS SEMPRE

/*
* COMO IMPLEMENTAR FACTORY METHOD
*
* 1-  FACA TODOS OS PRODUTOS IMPLEMENTAREM A MESMA INTERFACE
*      ESSA INTERFACE DEVE DECLARAR METODOS QUE FAZEM SENTIDO EM TODOS OS PRODUTOS
*
* 2 - ADICIONE UM METODO FABRICA VAZIO DENTRO DA CLASSE CRIADORA
*     O TIPO DE RETORNO DO METODO DEVE CORRESPONDER A INTERFACE COMUM DO PRODUTO
*
* 3 - NO CODIGO DA CLASSE CRIADORA ENCONTRE TODAS AS REFERENCIAS
*     AOS CONSTRUTORES DE PRODUTOS. UM POR UM, SUBSTITUA-OS POR CHAMADAS
*     AO METODO FABRICA, ENQUANTO EXTRAI O CODIGO DE CRIACAO DO PRODUTO
*     DESEJADO PARA O METODO FABRICA
*
* 4 - AGORA CRIE UM CONJUNTO DE SUBCLASSES CRIADORAS PARA CADA
*     TIPO DE PRODUTO LISTADO NO METODO DABRICA. SOBRESCREVA O METODO
*     FABRICA NAS SUBCLASSES E EXTRAIA OS PEDACOS APROPRIADOS DO CODIGO DE
*     CONSTRUCAO DO METODO BASE
*
* 5 - SE HOUVE MUITOS TIPOS DE PRODUTOS E NAO FIZER SENTIDO CRIAR
*     SUBCLASSES PARA TODOS ELES VC PODE REUTILIZAR O PARAMETRO DE CONTROLE
*     DA CLASSE BASE NAS SUBCLASSES
*
*
*benefícios de usar o padrão Abstract Factory para criar famílias de objetos
* relacionados, onde cada fábrica concreta é responsável por criar uma variedade
* específica de produtos. Isso promove a modularidade, a flexibilidade e a
*  facilidade de manutenção do código.
*
*Desacoplamento entre criador e produtos concretos:
*  Através do uso de interfaces, o criador e os produtos concretos são desacoplados.
*  O criador cria os produtos usando métodos abstratos, sem precisar se preocupar
*  com suas implementações específicas. Isso possibilita a criação de diferentes
*  tipos de produtos sem afetar o código do criador.

Responsabilidade única:
*  O código responsável pela criação dos produtos é centralizado em um único
* local do programa, geralmente nas subclasses concretas da fábrica abstrata.
*  Isso simplifica a manutenção do código, já que as alterações na criação dos
*  produtos são limitadas a essas subclasses.

Princípio aberto/fechado:
*  O padrão Abstract Factory facilita a adição de novos tipos de produtos no
*  programa sem alterar o código existente do cliente. Como o cliente interage
*  apenas com interfaces abstratas, novas implementações de produtos podem ser
*  adicionadas sem modificar o código do cliente.
*
*
* Negativo:
*  O código do cliente pode ficar muito grande e complexo.
*
*
* O Factory Method e o Abstract Factory são dois padrões de projeto que têm o
*  objetivo comum de criar objetos. No entanto, existem diferenças significativas
* entre os dois.

Propósito:

Factory Method: O Factory Method é usado para criar objetos de um tipo específico
*  dentro de uma hierarquia de classes. Ele define uma interface para criar um objeto,
*  mas permite que as subclasses decidam qual classe concreta deve ser instanciada.

Abstract Factory: O Abstract Factory é usado para criar famílias de objetos
* relacionados, sem especificar suas classes concretas. Ele fornece uma interface
*  para criar famílias de objetos relacionados ou dependentes sem especificar suas
* classes concretas.

Estrutura:

Factory Method: O Factory Method geralmente é implementado como um método
*  em uma classe abstrata que é estendida por classes concretas.
* Cada subclasse pode implementar o Factory Method para criar uma instância de
*  um tipo específico de objeto.

Abstract Factory: O Abstract Factory é implementado como uma hierarquia de
*  fábricas abstratas e suas respectivas implementações concretas.
*  Cada fábrica concreta é responsável por criar uma família específica
* de objetos relacionados.

Escopo:

Factory Method: O escopo do Factory Method está limitado à criação de um único tipo
*  de objeto em uma hierarquia de classes.

Abstract Factory: O Abstract Factory tem um escopo mais amplo,
*  pois pode criar famílias inteiras de objetos relacionados.

Flexibilidade:

Factory Method: O Factory Method oferece mais flexibilidade em termos de criação
* de objetos, pois permite que subclasses determinem qual classe concreta deve ser
*  instanciada.

Abstract Factory: O Abstract Factory oferece menos flexibilidade na criação de objetos
*  individuais, mas proporciona mais flexibilidade na criação de famílias inteiras
* de objetos relacionados.

Em resumo, o Factory Method é usado para criar objetos individuais dentro de uma
* hierarquia de classes, enquanto o Abstract Factory é usado para criar famílias de
* objetos relacionados sem especificar suas classes concretas.
*  Ambos os padrões têm seus próprios casos de uso e são aplicáveis em
* diferentes contextos de design de software.
*
* O FActory Method é uma especializacao do Template Method
* */
