import 'package:scoped_model/scoped_model.dart';

class DataModel extends Model {
  bool _isMale;
  double _height;
  int _age;
  double _weight;

  DataModel(this._isMale, this._height, this._age, this._weight);

  bool get isMale => _isMale;
  double get height => _height;
  double get weight => _weight;
  int get age => _age;

  void toggleGender(bool male) {
    _isMale = male;
    notifyListeners();
  }

  void changeHeight(double newHeight) {
    _height = newHeight;
    notifyListeners();
  }

  void incrementAge() {
    _age++;
    notifyListeners();
  }

  void decrementAge() {
    _age--;
    notifyListeners();
  }

  void incrementWeight() {
    _weight++;
    notifyListeners();
  }

  void decrementWeight() {
    _weight--;
    notifyListeners();
  }
}