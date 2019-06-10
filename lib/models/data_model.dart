import 'package:scoped_model/scoped_model.dart';

class DataModel extends Model {
  bool isMale;
  double height;
  int age;
  double weight;

  DataModel(this.isMale, this.height, this.age, this.weight);

  void changeHeight(double newHeight) {
    height = newHeight;
    notifyListeners();
  }

  void incrementAge() {
    age++;
    notifyListeners();
  }

  void decrementAge() {
    age--;
    notifyListeners();
  }

  void incrementWeight() {
    weight++;
    notifyListeners();
  }

  void decrementWeight() {
    weight--;
    notifyListeners();
  }
}