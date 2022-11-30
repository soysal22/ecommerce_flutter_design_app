import 'package:ecommerce/screens/productDetail.dart';
import 'package:ecommerce/utilities/constants.dart';
import 'package:flutter/material.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constansts.ROUTE_PRODUCT_DETAIL: (context) => ProductDetail()
  };
}
