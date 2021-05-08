import 'package:flutter/material.dart';
import 'package:flutter_http/models/product.dart';
import 'package:flutter_http/widgets/product_list_row_widget.dart';



class ProductListWidget extends StatefulWidget{

  List<Product> products = new List<Product>();

  ProductListWidget(List<Product> products){
    this.products = products;
  }

  @override
  State<StatefulWidget> createState() {
    return ProductListWidgetState();
  }

}

class ProductListWidgetState extends State<ProductListWidget>{
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context){
    return Column(
      children: [
        SizedBox(height: 40),
        SizedBox(
          height: 600,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.products.length, (index) {
              Product product = widget.products[index];
              return ProductListRowWidget(product);
            }),
          ),
        ),
      ],
    );
  }


}

/*
Ğ
return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.deepOrange,
          ),
          title: Text(product.productName),
          subtitle: Text("Fiyat: ${product.unitPrice.toString()} Birim: ${product.quantityPerUnit} Adet: ${product.unitsInStock.toString()}")
        );

 */