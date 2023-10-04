import 'package:ex_task/ex_task.dart' as ex_task;
import 'package:dio/dio.dart';

import 'models/getProd/getProd.dart';
import 'models/product/product.dart';

void main(List<String> arguments) async {
  Dio httpCLient = Dio();
  String url = 'https://dummyjson.com/products';
  var response = await httpCLient.get(url);
  GetProd getProd = GetProd.fromJson(response.data);
  List<String> brandList = ["Apple", "Samsung"];
  List<dynamic> productList = [];
  List<dynamic> result = [];

  // for (var el in getProd.p) {
  //   productList.add(el);
  // }
  productList.addAll(getProd.p);
  result=productList.where((el) => brandList.contains(el.brand)).toList();
  // result = productList.where((el) => brandList.contains(el)).toList();
  print(result.length);

}
