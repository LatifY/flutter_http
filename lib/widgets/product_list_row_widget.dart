import 'package:flutter/material.dart';
import 'package:flutter_http/models/product.dart';

class ProductListRowWidget extends StatelessWidget{
  Product product;

  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }
  
  Widget buildProductItemCard(BuildContext context){
    return InkWell(
     child: Card(
       child: Column(
         children: [
           Container(
             child: Image.network("https://webstockreview.net/images600_/colors-clipart-headphone-6.png"),
             height: 120,
             width: MediaQuery.of(context).size.width/2,
           ),
           Text(product.productName, textAlign: TextAlign.center, style: TextStyle(fontSize: 14),),
           SizedBox(height: 10,),
           Text("${product.unitPrice} TL - ${product.unitsInStock} Adet", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black45),)
         ],
       ),
     ),
    );
  }

}