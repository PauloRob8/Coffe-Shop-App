import 'package:CoffeShopApp/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  Item teste = Item(favorite: false,name: "Classic Latte",price: 4.5);

  Widget coffeShopItem(){
    return Container(
      child: Material(
        color: Color(0xffeff1fa),
        child: Stack(
          fit: StackFit.loose,
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: <Widget>[
          Container(
            width: 140,
            height: 199,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white,width: 2),
              color: Color(0xffeff1fa),
              boxShadow: [BoxShadow(
                color: Color(0x0d7582a8),
                offset: Offset(0, 3),
                blurRadius: 9,
                spreadRadius: 0,
              )],
            ),
          ),
          Positioned(
            top: -10,
            child: Container(
            width: 112,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: [Color(0xfff6aa74),
                Color(0xffeb7a27)],stops: [0,1],
                ),
                boxShadow: [BoxShadow(
                  color: Color(0x57ec7f2f),
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )]
            ),
          ),
          ),
          Positioned(
            top: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Classic Latte",
                style: TextStyle(
                  color: Color(0xff353e5a),
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                  fontFamily: 'OpenSans'
                )
              ,),
              Container(
                width: 125,
                child: ListTile(
                  leading: Icon(Icons.favorite_border,
                  color: Color(0xff353e5a),),
                  trailing: Text("\$ " + "${teste.price}",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                  ),),
                ),
              )
              ],
            ),
          ),
        ],)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
        child: Container(
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
              margin: EdgeInsets.only(top: 8),
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 150),
                  width: 150,
                  height: 150,
                  child: Image.asset('lib/assets/drawable-hdpi/Profile pic.png')),
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
              fontSize: 33,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),),
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.only(right: 10,left: 30),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              height: size.height *0.60,
              child: CupertinoScrollbar(
                  child: GridView.count(
                  mainAxisSpacing: 50,
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  children: List.generate(5, (index){
                    return coffeShopItem();
                  }),
                ),
              ),
          ),
        ],
        ),
      ),
    );
  }
}