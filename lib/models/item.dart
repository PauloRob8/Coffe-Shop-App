class Item{
  String name;
  String type;
  double price;
  bool favorite;
  String size;
  String flavor;
  String topping;

  Item({
    this.name,this.favorite,this.price,this.flavor,this.size,this.topping,this.type
  });

  factory Item.fromJson(Map<String,dynamic> json){
    return Item(
      name: json['name'],
      type: json['type'],
      price: double.parse(json['price']),
      favorite: bool.fromEnvironment(json['favorite']),
      size: json['size'],
      flavor: json['flavor'],
      topping: json['topping'],
    );
  }
}