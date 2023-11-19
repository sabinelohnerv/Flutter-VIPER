import 'package:viper_project/modules/item_detail/interactor/item_detail_interactor.dart';
import 'package:viper_project/modules/item_detail/view/item_detail_view.dart';
import 'package:viper_project/modules/items/entity/item_model.dart';


class ItemDetailPresenter {
  final ItemDetailInteractor _interactor;
  late ItemDetailView _view;

  ItemDetailPresenter(this._interactor);

  void onViewReady(ItemDetailView view, Item item) {
    _view = view;
    _view.displayItemDetails(item);
  }

  void onAddItem(int itemId) {
    _interactor.addItem(itemId);
    _view.onItemAdded();
  }
}
