import 'package:scoped_model/scoped_model.dart';

class DataModel extends Model {
  bool isMale;
  double height;
  double age;
  double weight;

  DataModel(this.isMale, this.height, this.age, this.weight);

  changeHeight(double newHeight) {
    height = newHeight;
    notifyListeners();
  }

  incrementAge() {
    age++;
    notifyListeners();
  }

  incrementWeight() {
    weight++;
    notifyListeners();
  }
}