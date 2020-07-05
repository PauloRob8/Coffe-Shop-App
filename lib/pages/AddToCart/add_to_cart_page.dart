import 'dart:convert';

import 'package:CoffeShopApp/models/item.dart';
import 'package:CoffeShopApp/pages/AddToCart/bloc/addtocart_bloc.dart';
import 'package:CoffeShopApp/pages/Cart/cart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddToCart extends StatelessWidget {
  final Item item;
  AddToCart({this.item});
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final AddtocartBloc addtocartBloc = BlocProvider.of<AddtocartBloc>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xffeff1fa),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 33, top: 15),
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 35,
                      color: Color(0xff353e5a),
                    ),
                  ),
                ),
                Stack(
                  fit: StackFit.loose,
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 178,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [Color(0xfff6aa74), Color(0xffeb7a27)],
                            stops: [0, 1],
                            begin: Alignment(-0.89, -0.45),
                            end: Alignment(0.89, 0.45),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x57ec7f2f),
                              offset: Offset(0, 4),
                              blurRadius: 20,
                            )
                          ]),
                    ),
                    Container(
                      child: Image.asset(
                        item.image,
                      ),
                      color: Colors.transparent,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'AbrilFatFace',
                    fontSize: 33,
                    color: Color(0xff353e5a),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '\$ ${item.price.toStringAsFixed(2)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Color(0xff353e5a),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal),
                ),
                SizedBox(
                  height: 15,
                ),
                itemOptions(context, addtocartBloc),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 18),
                      child: FloatingActionButton(
                        elevation: 3,
                        backgroundColor: Color(0xffffffff),
                        heroTag: 'btn4',
                        child: Icon(
                          Icons.remove,
                          color: Colors.grey[600],
                        ),
                        onPressed: () {
                          addtocartBloc.add(DecrementValue());
                        },
                      ),
                    ),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: BlocBuilder<AddtocartBloc, AddtocartState>(
                          bloc: addtocartBloc,
                          builder: (context, state) {
                            return buildCounterText(
                                addtocartBloc.value.toString());
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18),
                      child: FloatingActionButton(
                        elevation: 3,
                        backgroundColor: Color(0xffffffff),
                        heroTag: 'btn5',
                        child: Icon(
                          Icons.add,
                          color: Colors.grey[600],
                        ),
                        onPressed: () {
                          addtocartBloc.add(IncrementValue());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    addItemToPrefs(item,addtocartBloc);
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text(
                        "Item added to your cart!",
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Color(0xffeb7a27),
                      duration: Duration(seconds: 1),
                    ));
                    Future.delayed(
                      Duration(milliseconds: 1500),
                    ).then((value) => Navigator.of(context).pop());
                  },
                  child: Container(
                    width: 270,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                          stops: [0, 1],
                          begin: Alignment(-0.99, -0.10),
                          end: Alignment(0.99, 0.10),
                          colors: [Color(0xfff6aa74), Color(0xffeb7a27)]),
                    ),
                    child: Center(
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontFamily: 'OpenSans',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCounterText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'OpenSans',
        color: Color(0xff353e5a),
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
      ),
    );
  }

  Widget itemOptions(BuildContext context, AddtocartBloc addtocartBloc) {
    return NeuCard(
      width: 310,
      height: 265,
      bevel: 5,
      curveType: CurveType.concave,
      decoration: NeumorphicDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffeff1fa),
        border: Border.all(color: Colors.white, width: 0.8),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(left: 25, right: 25),
            title: Text(
              "Size",
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Color(0xff353e5a),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: BlocBuilder<AddtocartBloc, AddtocartState>(
                bloc: addtocartBloc,
                builder: (context, state) {
                  return Text(
                    addtocartBloc.item.size,
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Color(0xffacb5d3),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                }),
            trailing: FloatingActionButton(
              elevation: 5,
              backgroundColor: Color(0xffffffff),
              heroTag: 'btn1',
              child: Icon(
                Icons.arrow_forward,
                color: Colors.grey[600],
              ),
              onPressed: () {
                addtocartBloc.add(ChangeSize(item.size));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Divider(),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25, right: 25),
            title: Text(
              "Flavor",
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Color(0xff353e5a),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: BlocBuilder<AddtocartBloc, AddtocartState>(
                bloc: addtocartBloc,
                builder: (context, state) {
                  return Text(
                    addtocartBloc.item.flavor,
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Color(0xffacb5d3),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                }),
            trailing: FloatingActionButton(
              elevation: 5,
              backgroundColor: Color(0xffffffff),
              heroTag: 'btn2',
              child: Icon(
                Icons.arrow_forward,
                color: Colors.grey[600],
              ),
              onPressed: () {
                addtocartBloc.add(ChangeFlavor(item.flavor));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Divider(),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25, right: 25),
            title: Text(
              "Topping",
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Color(0xff353e5a),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: BlocBuilder<AddtocartBloc, AddtocartState>(
                bloc: addtocartBloc,
                builder: (context, state) {
                  return Text(
                    addtocartBloc.item.topping,
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Color(0xffacb5d3),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                }),
            trailing: FloatingActionButton(
              elevation: 5,
              backgroundColor: Color(0xffffffff),
              heroTag: 'btn3',
              child: Icon(
                Icons.arrow_forward,
                color: Colors.grey[600],
              ),
              onPressed: () {
                addtocartBloc.add(ChangeTopping(item.topping));
              },
            ),
          )
        ],
      ),
    );
  }

  addItemToPrefs(Item item,AddtocartBloc addtocartBloc) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String jsonStringItem = json.encode(item);
    await preferences.setString('item', jsonStringItem);
    await preferences.setString('amount', addtocartBloc.value.toString());
    
  }
}
