abstract interface class PaymentExecute {
  void withPayment(double amount);
}

class Money implements PaymentExecute {
  @override
  void withPayment(double amount) {
   print("You payed $amount with money");
  }
}
class CreditCard implements PaymentExecute {
  @override
  void withPayment(double amount) {
   print("You payed $amount with credit card");
  }
}
class DebitCard implements PaymentExecute {
  @override
  void withPayment(double amount) {
   print("You payed $amount with debit card");
  }
}
class Pix implements PaymentExecute {
  @override
  void withPayment(double amount) {
   print("You payed $amount with pix");
  }
}

class AbstractFactoryExecutePayment {
   void call(PaymentExecute paymentExecute, double amount) {
    paymentExecute.withPayment(amount);
  }
}

main() {
  final paymentExecute = AbstractFactoryExecutePayment();
  paymentExecute(Money(), 100.0);
  paymentExecute(CreditCard(), 200.0);
  paymentExecute(DebitCard(), 300.0);
  paymentExecute(Pix(), 400.0);
}
