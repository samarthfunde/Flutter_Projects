import 'package:expense_app/data/models/cat_model.dart';

void main() {
  var catModel = CatModel();

  // Getter
  print(catModel.catName); // Accessing the getter property directly

  // Setter
  catModel.setCatName("Fuel"); // Setting a new category name

  // Getter
  print(catModel.catName); // Accessing the getter property again
}
