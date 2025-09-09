
import 'dart:ffi';

abstract class Bank {
  int pay(int amout);

}

class CreditCardPayment extends Bank{

  int pay(int amout) {
    int saveamount = 200;
    int totalamount = saveamount +amout;
    return totalamount;
  }

}

class UPIPayment extends Bank {
  int pay(int amout) {
    int savedAmount = 400;
    int totalAmount = savedAmount + amout;
    return totalAmount;
  }

}


void main() {

CreditCardPayment c = CreditCardPayment();
print(c.pay(100));

UPIPayment u = UPIPayment();
print(u.pay(200));


}

