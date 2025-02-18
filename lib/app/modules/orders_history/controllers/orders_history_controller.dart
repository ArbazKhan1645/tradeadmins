import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/modules/orders_history/models/price_level_model.dart';
import 'package:partner_hub/app/modules/orders_history/models/product_bulk_price_model.dart';
import 'package:partner_hub/app/modules/orders_history/models/products_model.dart';

class OrdersHistoryController extends GetxController {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool isloaded = false;

  int endindex = 15;
  int startingIndex = 0;

  init() {
    if (products.length < 15) {
      endindex = products.length;
    } else {
      endindex = 15;
    }
    isloaded = true;
    update();
  }

  increaselength() {
    int practiceShowsRows = endindex + 15;
    if (practiceShowsRows <= products.length) {
      endindex = practiceShowsRows;
      startingIndex = endindex - 15;
    } else {
      endindex = products.length;
      int lastDigit = endindex % 15;
      if (lastDigit != 0) {
        startingIndex = endindex - lastDigit;
      } else {
        startingIndex = endindex - 15;
      }
    }
    update();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void decreaseLength() {
    if (endindex == products.length) {
      int lastDigit = endindex % 15;
      if (lastDigit != 0) {
        endindex -= lastDigit;
        startingIndex = endindex - 15;
      } else {
        endindex -= 15;
        startingIndex = endindex - 15;
      }
    } else {
      endindex = (endindex > 15) ? endindex - 15 : 15;
      startingIndex = endindex - 15;
    }
    update();
  }

  returnProductList() {
    if (products.length < 15) {
      return products;
    }
    return products.sublist(startingIndex, endindex);
  }

  List<ProductModel> products = [
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
    ProductModel(name: 'burger', qty: 2, id: 10),
    ProductModel(name: 'pizza', qty: 2, id: 1),
    ProductModel(name: 'pepsi', qty: 2, id: 2),
    ProductModel(name: 'biryani', qty: 2, id: 3),
  ];

  List<PricelevelModel> pricelevelList = [
    PricelevelModel(name: 'Price Level 1', id: 0),
    PricelevelModel(name: 'Price Level 2', id: 1),
    PricelevelModel(name: 'Price Level 3', id: 2),
    PricelevelModel(name: 'Price Level 4', id: 3),
    PricelevelModel(name: 'Price Level 5', id: 4),
    PricelevelModel(name: 'Price Level 6', id: 5),
    PricelevelModel(name: 'Price Level 7', id: 6),
    PricelevelModel(name: 'Price Level 8', id: 7),
  ];

  List<ProductBulkPriceModel> bulkPriceList = [
    ProductBulkPriceModel(price: '10000', productUUid: 1, priceLevel: 2),
    ProductBulkPriceModel(price: '400', productUUid: 10, priceLevel: 5),
    ProductBulkPriceModel(price: '435', productUUid: 3, priceLevel: 7)
  ];
}
