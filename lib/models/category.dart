class Category{
  int id;
  String categoryName;
  String seoUrl;

  Category(){}
  Category.withId(this.id, this.categoryName, this.seoUrl){}

  Category.fromJson(Map json){
    id = json["id"];
    categoryName = json["categoryName"];
    seoUrl = json["seoUrl"];
  }

  Map toJson(){
    Map map = new Map();
    map["id"] = id;
    map["categoryName"] = categoryName;
    map["seoUrl"] = seoUrl;
    return map;
  }
}