import 'package:CoffeShopApp/models/item.dart';
import 'package:flutter/material.dart';

Widget coffeShopItem(Item item){
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
              border: Border.all(color: Colors.white54,width: 2),
              color: Color(0xffeff1fa),
              boxShadow: [BoxShadow(
                color: Color(0x0d7582a8),
                spreadRadius: -10,
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
                Text("${item.name}",
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
                  trailing: Text("\$ " + "${item.price}",
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