import 'package:flutter/material.dart';
import 'package:viper_project/modules/item_detail/interactor/item_detail_interactor.dart';
import 'package:viper_project/modules/item_detail/presenter/item_detail_presenter.dart';
import 'package:viper_project/modules/items/entity/item_model.dart';

abstract class ItemDetailView {
  void displayItemDetails(Item item);
  void onItemAdded();
}

class ItemDetailScreen extends StatefulWidget {
  final Item item;

  const ItemDetailScreen({super.key, required this.item});

  @override
  State<StatefulWidget> createState() {
    return _ItemDetailScreenState();
  }
}

class _ItemDetailScreenState extends State<ItemDetailScreen>
    implements ItemDetailView {
  late ItemDetailPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = ItemDetailPresenter(ItemDetailInteractor());
    _presenter.onViewReady(this, widget.item);
  }

  @override
  void displayItemDetails(Item item) {}

  @override
  void onItemAdded() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item.name)),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/images/${widget.item.image}.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.item.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${widget.item.price}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.green), 
                    foregroundColor:
                        MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: onItemAdded,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(
                        width: 2,
                      ),
                      Text('Añadir'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
