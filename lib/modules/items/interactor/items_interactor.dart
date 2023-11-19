import 'package:viper_project/modules/items/entity/item_model.dart';

class ItemsInteractor {
  List<Item> fetchItems() {
    return [
      Item(id: 1, name: "Formal Shirt", image: 'shirt', price: '35.99'),
      Item(id: 2, name: "Knitted Sweater", image: 'sweater', price: '59.89'),
      Item(id: 3, name: "Curdoroy Pants", image: 'pants', price: '75.99'),
      Item(id: 4, name: "Bodycon Dress", image: 'dress', price: '32.89'),
      Item(id: 5, name: "Teddy Pullover", image: 'pullover', price: '46.99'),
    ];
  }
}
