import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;

  stable var STARTTIME = Time.now();
  Debug.print(debug_show(STARTTIME));

  public func topUp(amount: Float) {
    currentValue += amount;
    //Debug.print(debug_show(currentValue));
  };

  //Allow users to withdraw an amount from the currentValue
  //Decrease the currentValue specified
  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else {
      Debug.print("Amount specified cannot be greater than currentValue");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let CURRENTTIME = Time.now();
    let TIMEELAPSED = CURRENTTIME - STARTTIME;
    let TIMEELAPSED_INSECOND = TIMEELAPSED / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(TIMEELAPSED_INSECOND));
    STARTTIME := CURRENTTIME;
  }



  //topUp();

}