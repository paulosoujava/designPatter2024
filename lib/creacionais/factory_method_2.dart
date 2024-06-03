// Interface para o produto
abstract class Button {
  void render();
  void onClick(Function() f);
}

// Produto concreto para Windows
class WindowsButton implements Button {
  @override
  void render() {
    // Renderiza o botão para Windows
  }

  @override
  void onClick(Function() f) {
    // Implementação do clique para Windows
  }
}

// Produto concreto para Web
class HtmlButton implements Button {
  @override
  void render() {
    // Renderiza o botão para Web
  }

  @override
  void onClick(Function() f) {
    // Implementação do clique para Web
  }
}

// Interface para a fábrica
abstract class Dialog {
  Button createButton();
  void render();
}

// Criador concreto para Windows
class WindowsDialog extends Dialog {
  @override
  Button createButton() {
    return WindowsButton();
  }

  @override
  void render() {
    // Renderiza o diálogo para Windows
  }
}

// Criador concreto para Web
class WebDialog extends Dialog {
  @override
  Button createButton() {
    return HtmlButton();
  }

  @override
  void render() {
    // Renderiza o diálogo para Web
  }
}

// Cliente
class Client {
  late Dialog dialog;

  void initialize() {
    // Determina qual diálogo criar com base no sistema operacional
    const config = "Windows";
    if (config == "Windows") {
      dialog = WindowsDialog();
    } else if (config == "Web") {
      dialog = WebDialog();
    } else {
      throw Exception("Erro! Sistema operacional desconhecido.");
    }
  }

  void main() {
    initialize();
    dialog.render();
  }
}

// Configuração do sistema operacional
class Config {
  final String os;

  Config(this.os);
}

void main() {
  // Exemplo de uso
  final client = Client();
  client.main();
}
