import 'package:calculadora_imc/data/food_data.dart';
import 'package:flutter/material.dart';

const categoryHeight = 55.0;
const productHeight = 120.0;

class RappiBLOC with ChangeNotifier {
  List<RappiTabCategory> tabs = [];
  List<RappiItem> items = [];

  TabController tabController;
  ScrollController scrollController = ScrollController();
  bool _listen = true;

  void init(TickerProvider ticker) {
    tabController =
        TabController(length: rappiCategories.length, vsync: ticker);

    double offsetFrom = 0.0;
    double offsetTo = 0.0;

    for (int i = 0; i < rappiCategories.length; i++) {
      final category = rappiCategories[i];

      if (i > 0) {
        offsetFrom += rappiCategories[i - 1].products.length * productHeight;
      }

      if (i < rappiCategories.length - 1) {
        offsetTo =
            offsetFrom + rappiCategories[i + 1].products.length * productHeight;
      } else {
        offsetTo = double.infinity;
      }

      tabs.add(RappiTabCategory(
          category: category,
          selected: (i == 0),
          offsetFrom: categoryHeight * 1 + offsetFrom,
          offsetTo: offsetTo));
      items.add(RappiItem(category: category));
      for (int j = 0; j < category.products.length; j++) {
        final product = category.products[j];
        items.add(RappiItem(product: product));
      }
    }
    scrollController.addListener(_onScrollListener);
  }

  void _onScrollListener() {
    if (_listen) {
      for (int i = 0; i < tabs.length; i++) {
        final tab = tabs[i];
        if (scrollController.offset >= tab.offsetFrom &&
            scrollController.offset <= tab.offsetTo &&
            !tab.selected) {
          onCategorySelected(i, animationRequired: false);
          tabController.animateTo(i);
          break;
        }
      }
    }
  }

  void onCategorySelected(int index, {bool animationRequired = true}) async {
    final selected = tabs[index];
    for (int i = 0; i < tabs.length; i++) {
      final condition = selected.category.name == tabs[i].category.name;
      tabs[i] = tabs[i].copyWith(condition);
    }
    notifyListeners();
    if (animationRequired) {
      _listen = false;
      await scrollController.animateTo(
        selected.offsetFrom,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
      _listen = true;
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScrollListener);
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }
}

class RappiTabCategory {
  final RappiCategory category;
  final bool selected;
  final double offsetFrom;
  final double offsetTo;

  RappiTabCategory(
      {@required this.offsetTo,
      @required this.category,
      @required this.selected,
      @required this.offsetFrom});

  RappiTabCategory copyWith(bool selected) => RappiTabCategory(
      category: category,
      selected: selected,
      offsetFrom: offsetFrom,
      offsetTo: offsetTo);
}

class RappiItem {
  final RappiCategory category;
  final RappiProduct product;
  bool get isCategory => category != null;

  RappiItem({this.category, this.product});
}
