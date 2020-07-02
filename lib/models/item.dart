class Item{
  String name;
  String type;
  double price;
  bool favorite;
  String size;
  String flavor;
  String topping;
  String image;

  Item({
    this.name,this.favorite,this.price,this.flavor,this.size,this.topping,this.type,this.image
  });

  factory Item.fromJson(Map<String,dynamic> json){
    return Item(
      name: json['name'],
      type: json['type'],
      image: json['image'],
      price: double.parse(json['price']),
      favorite: json['favorite'] == "true" ? true : false,
      size: json['size'],
      flavor: json['flavor'],
      topping: json['topping'],
    );
  }
}