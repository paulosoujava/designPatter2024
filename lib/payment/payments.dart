
abstract interface class PaymentProcess {
  String processPayment(double amount);
}
class CreditCardProcessor implements PaymentProcess {
  @override
  String processPayment(double amount) {
    return "Credit card payment of $amount";
  }
}
class PayPalProcessor implements PaymentProcess {
  @override
  String processPayment(double amount) {
    return "PayPal payment of $amount";
  }
}
class BankTransferProcessor implements PaymentProcess {
  @override
  String processPayment(double amount) {
    return "BankTransfer payment of $amount";
  }
}

class AbstractFactoryExecutePayment {
   void call(PaymentProcess paymentProcess, double amount) {
    print(paymentProcess.processPayment(amount));
  }
}

main() {
  final paymentProcess = AbstractFactoryExecutePayment();
  paymentProcess(CreditCardProcessor(), 100.0);
  paymentProcess(PayPalProcessor(), 200.0);
  paymentProcess(BankTransferProcessor(), 300.0);
}