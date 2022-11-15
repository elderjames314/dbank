import Debug "mo:base/Debug";

actor DBank {
  stable var currentValue = 300;

  public func topUp(amount: Nat) {
    currentValue += amount;
    //Debug.print(debug_show(currentValue));
  };

  //Allow users to withdraw an amount from the currentValue
  //Decrease the currentValue specified
  public func withdraw(amount: Nat) {
    let tempValue: Int = currentValue - amount;
    if(tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else {
      Debug.print("Amount specified cannot be greater than currentValue");
    }
  };

  public query func checkBalance(): async Nat {
    return currentValue;
  }

  

  //topUp();

}