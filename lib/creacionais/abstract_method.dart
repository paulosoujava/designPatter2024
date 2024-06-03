/**
 * Abstract Method
 * permite que voce produz FmiliA SW OBJWROA
 * relacionados sem ter que especificar suas classes concretas
 *
 * A primeira  coisa que o padrao Abstract Daacotry sugere é declarar
 * explicitamente interfaces para cada produtos.
 * Todas as variantes de oesmo obejto podem ser movidas para uma
 * mesma hierarquia de classe
 */

abstract interface class  Chair{
  void hasLeg();
  void stOn();
}

class VictorianChair implements Chair{
  @override
  void hasLeg() {
    // TODO: implement hasLeg
  }
  @override
  void stOn() {
    // TODO: implement stOn
  }
}
class ModernChair implements Chair{
  @override
  void hasLeg() {
    // TODO: implement hasLeg
  }
  @override
  void stOn() {
    // TODO: implement stOn
  }
}


// O prox paso é declarar a fabrica abstrata, uma interface com uma lista
//de metodos de criacao para todos produtos que fazem parte da familia.
//Esses metodos devem retornar tipos abstratos

abstract interface class  FurnitureFactory{
  Chair createChair();

  //others
//  Sofa createSofa();
//  Table createTable();
//  Bed createBed();
}

class VictorianFurnitureFactory implements FurnitureFactory{
  @override
  Chair createChair() {
    return VictorianChair();
  }
}

class ModernFurnitureFactory implements FurnitureFactory{
  @override
  Chair createChair() {
    return ModernChair();
  }
}




// A interface de fábrica abstrata declara um conjunto de métodos
// que retornam diferentes produtos abstratos. Estes produtos são
// chamados uma família e estão relacionados por um tema ou
// conceito de alto nível. Produtos de uma família são
// geralmente capazes de colaborar entre si. Uma família de
// produtos pode ter várias variantes, mas os produtos de uma
// variante são incompatíveis com os produtos de outra variante.
abstract class GUIFactory {
  Button createButton();
  Checkbox createCheckbox();
}

// As fábricas concretas produzem uma família de produtos que
// pertencem a uma única variante. A fábrica garante que os
// produtos resultantes sejam compatíveis. Assinaturas dos
// métodos fabrica retornam um produto abstrato, enquanto que
// dentro do método um produto concreto é instanciado.
class WinFactory implements GUIFactory {
  Button createButton() {
    return WinButton();
  }

  Checkbox createCheckbox() {
    return WinCheckbox();
  }
}

// Cada fábrica concreta tem uma variante de produto correspondente.
class MacFactory implements GUIFactory {
  Button createButton() {
    return MacButton();
  }

  Checkbox createCheckbox() {
    return MacCheckbox();
  }
}

// Cada produto distinto de uma família de produtos deve ter uma
// interface base. Todas as variantes do produto devem
// implementar essa interface.
abstract class Button {
  void paint();
}

// Produtos concretos são criados por fábricas concretas
// correspondentes.
class WinButton implements Button {
  void paint() {
    // Renderiza um botão no estilo Windows.
  }
}

class MacButton implements Button {
  void paint() {
    // Renderiza um botão no estilo macOS.
  }
}

// Aqui está a interface base de outro produto. Todos os
// produtos podem interagir entre si, mas a interação apropriada
// só é possível entre produtos da mesma variante concreta.
abstract class Checkbox {
  void paint();
}

class WinCheckbox implements Checkbox {
  void paint() {
    // Renderiza uma caixa de seleção estilo Windows.
  }
}

class MacCheckbox implements Checkbox {
  void paint() {
    // Renderiza uma caixa de seleção no estilo macOS.
  }
}

// O código cliente trabalha com fábricas e produtos apenas
// através de tipos abstratos: GUIFactory, Button e Checkbox.
// Isso permite que você passe qualquer subclasse fábrica ou de
// produto para o código cliente sem quebrá-lo.
class Application {
  GUIFactory factory;
  late Button button;

  Application(this.factory);

  void createUI() {
    button = factory.createButton();
  }

  void paint() {
    button.paint();
  }
}

// A aplicação seleciona o tipo de fábrica dependendo da atual
// configuração do ambiente e cria o widget no tempo de execução
// (geralmente no estágio de inicialização).
class ApplicationConfigurator {
  void main() {
    var config = readApplicationConfigFile();

    GUIFactory factory;
    if (config.OS == "Windows") {
      factory = WinFactory();
    } else if (config.OS == "Mac") {
      factory = MacFactory();
    } else {
      throw Exception("Erro! Sistema operacional desconhecido.");
    }

    var app = Application(factory);
  }


}
class ApplicationConfig {
  String OS;
  ApplicationConfig(this.OS);
}

ApplicationConfig readApplicationConfigFile() {
  // Aqui você pode implementar a lógica para ler o arquivo de configuração.
  // Por simplicidade, estou apenas retornando uma configuração fixa.
  return ApplicationConfig("Windows");
}





/*
APLICABILIDADE
Use o Abstract Factory quando o seu código precisa lidar com várias
famílias de produtos relacionados, mas você deseja evitar depender
de classes concretas desses produtos. Isso é útil quando os tipos
 específicos de produtos podem ser desconhecidos antecipadamente
  ou quando você quer permitir escalabilidade futura sem modificar
  muito o código existente.

Considere implementar o Abstract Factory quando:
voce tem uma classe comm um conjunto de metodos fabrica que desfoquem sua
responsabilidade principal

Para implementar o Abstract Factory, você pode seguir estes passos:

1. Mapeie uma matriz de tipos de produtos distintos versus as variantes desses produtos.
2. Declare interfaces de produto abstratas para todos os tipos de produto e faça todas as classes concretas de produtos implementarem essas interfaces.
3. Declare a interface da fábrica abstrata com um conjunto de métodos de criação para todos os produtos abstratos.
4. Implemente um conjunto de classes fábricas concretas, uma para cada variante de produto.
5. Crie um código de inicialização da fábrica em algum lugar da aplicação, instanciando uma das classes fábricas concretas com base na configuração da aplicação ou no ambiente atual, e passe esse objeto fábrica para todas as classes que constroem produtos.
6. Escaneie o código e encontre todas as chamadas diretas para construtores de produtos, substituindo-as por chamadas para o método de criação apropriado no objeto fábrica.

 */










