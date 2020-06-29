import 'package:CoffeShopApp/models/item.dart';
import 'package:CoffeShopApp/pages/widgets/shop_item_widget.dart';
import 'package:CoffeShopApp/pages/widgets/side_options_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget{

  Item teste = Item(favorite: false,name: "Iced Caramel Mocca",price: 4.5);
  var selectedList = [true,false,false]; 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffeff1fa),
          boxShadow: [BoxShadow(
            color: Color(0x0d7582a8),
            offset: Offset(0,3),
            blurRadius: 9,
            spreadRadius: 0,
          )]
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10,left: 5),
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Container(
                  width: 130,
                  height: 130,
                  child: Image.asset('lib/assets/drawable-hdpi/Profile pic.png', fit: BoxFit.fill,)),
                Container(
                  margin: EdgeInsets.only(right:25),
                  child: Icon(Icons.search,
                    size: 35,
                    color: Color(0xff353e5a),
                  ),
                ),
              ],)
            ),
            Text("Good Morning, \nJennifer!",
            style: TextStyle(
              fontFamily: 'AbrilFatFace',
              color: Color(0xff353e5a),
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),),
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              height: size.height *0.60,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  sideNavOptionsBar(size, selectedList),
                  Container(
                    width: size.width * 0.80,
                    child: CupertinoScrollbar(
                        child: GridView.count(
                        mainAxisSpacing: 55,
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        children: List.generate(5, (index){
                          return coffeShopItem(teste);
                        }),
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Color(0xfff8faff),
          boxShadow: [BoxShadow(
            color: Color(0x26353e5a),
            offset: Offset(0,-3),
            blurRadius: 20,
            spreadRadius: 0
          )],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            )),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(icon: Icon(FontAwesomeIcons.home,), onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.plus), onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.shoppingCart), onPressed: null)
              ],
            )
      ),
    );
  }
}