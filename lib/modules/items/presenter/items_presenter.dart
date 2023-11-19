import 'package:viper_project/modules/items/interactor/items_interactor.dart';
import 'package:viper_project/modules/items/view/items_view.dart';

class ItemsPresenter {
  final ItemsInteractor _interactor;

  ItemsPresenter(this._interactor);

  void onItemViewCreated(ItemsView view) {
    var items = _interactor.fetchItems();
    view.showItems(items);
  }
}
