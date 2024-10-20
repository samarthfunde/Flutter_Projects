import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  //changenotifier setstate ka kam krta hai and uske pass global control hota he
  int _count =
      50; //The underscore (_) before count makes this variable private, meaning it can only be accessed and modified within this class.
  int get count =>
      _count; //This is a getter method. It allows you to access the private variable _count outside of this class.

  void setCount() {
    _count++;
    notifyListeners(); // jab bhi sescount ko call kiya jayega to notifylistener count ki value ko increase krega
  }
}
