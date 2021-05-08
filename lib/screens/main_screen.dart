import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http/data/api/category_api.dart';
import 'package:flutter_http/data/api/product_api.dart';
import 'package:flutter_http/models/category.dart';
import 'package:flutter_http/models/product.dart';
import 'package:flutter_http/widgets/product_list_widget.dart';

//(B)(Lo)(C) BLoC
//Business Logic Components

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  List<Category> categories = List<Category>();
  List<Widget> categoryWidgets = List<Widget>();

  List<Product> products = List<Product>();
  List<Widget> productWidgets = List<Widget>();

  @override
  void initState() {
    getProducts();
    getCategoriesFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hepsiorada",
            style: TextStyle(color: Colors.white, fontSize: 30)),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return (Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: categoryWidgets),
          ),
          ProductListWidget(products)
        ],
      ),
    ));
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.categories = list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  void getCategoryWidgets() {
    for (var c in categories) {
      Widget widget = getCategoryWidget(c);
      categoryWidgets.add(widget);
    }
  }

  Widget getCategoryWidget(Category category) {
    return FlatButton(
      onPressed: (){
        getProductsByCategoryId(category.id);
      },
      child: Text(category.categoryName, style: TextStyle(color: Colors.redAccent)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.deepOrange)
      ),
    );
  }

  void getProductsByCategoryId(int categoryId){
    ProductApi.getProductsByCategoryId(categoryId).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products = list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }

  void getProducts(){
    ProductApi.getProducts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products = list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
