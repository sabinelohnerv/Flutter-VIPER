import 'package:flutter/material.dart';
import 'package:viper_project/modules/item_detail/view/item_detail_view.dart';
import 'package:viper_project/modules/items/entity/item_model.dart';

class ItemsRouter {
  void navigateToItemDetail(BuildContext context, Item item) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ItemDetailScreen(item: item),
    ));
  }
}
