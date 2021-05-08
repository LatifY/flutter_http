class Product{
  int id;
  int categoryId;
  String productName;
  String quantityPerUnit;
  double unitPrice;
  int unitsInStock;

  Product(){}
  Product.withId(this.id, this.categoryId, this.productName, this.quantityPerUnit, this.unitPrice, this.unitsInStock){}

  Product.fromJson(Map json){
    id = json["id"];
    categoryId = json["categoryId"];
    productName = json["productName"];
    quantityPerUnit = json["quantityPerUnit"];
    unitPrice = double.tryParse(json["unitPrice"].toString());
    unitsInStock = json["unitsInStock"];
  }

  Map toJson(){
    Map map = new Map();
    map["id"] = id;
    map["categoryId"] = categoryId;
    map["productName"] = productName;
    map["quantityPerUnit"] = quantityPerUnit;
    map["unitPrice"] = unitPrice;
    map["unitsInStock"] = unitsInStock;
    return map;
  }
}