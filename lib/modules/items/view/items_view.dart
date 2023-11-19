import 'package:flutter/material.dart';
import 'package:viper_project/modules/items/entity/item_model.dart';
import 'package:viper_project/modules/items/presenter/items_presenter.dart';
import 'package:viper_project/modules/items/interactor/items_interactor.dart';
import 'package:viper_project/modules/items/router/items_router.dart';

abstract class ItemsView {
  void showItems(List<Item> items);
}

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ItemsScreenState();
  }
}

class _ItemsScreenState extends State<ItemsScreen> implements ItemsView {
  late ItemsPresenter _presenter;
  final ItemsRouter _router = ItemsRouter();
  List<Item> _items = [];

  @override
  void initState() {
    super.initState();
    _presenter = ItemsPresenter(ItemsInteractor());
    _presenter.onItemViewCreated(this);
  }

  @override
  void showItems(List<Item> items) {
    setState(() {
      _items = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Items")),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'assets/images/${_items[index].image}.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(_items[index].name),
                ],
              ),
              onTap: () =>
                  _router.navigateToItemDetail(context, _items[index]));
        },
      ),
    );
  }
}
