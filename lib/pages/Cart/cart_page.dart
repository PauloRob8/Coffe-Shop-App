import 'package:CoffeShopApp/models/item.dart';
import 'package:CoffeShopApp/pages/Cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:neumorphic/neumorphic.dart';

class CartPage extends StatefulWidget {
  final VoidCallback returnToHome;

  const CartPage({Key key, this.returnToHome}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartCubit get cartCubit => CubitProvider.of<CartCubit>(context);

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Color(0xffeff1fa),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 130,
                  height: 130,
                  child: Image.asset('assets/drawable-hdpi/Profile pic.png'),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: 25,
                  ),
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.search,
                    size: 35,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Center(
                        child: Text(
                          "Your Orders",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'AbrilFatFace',
                            color: Color(0xff353e5a),
                            fontSize: 33,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CubitBuilder<CartCubit, CartState>(
                        cubit: cartCubit,
                        builder: (context, state) {
                          if (state.list.isEmpty) {
                            return Container(
                                height: 150,
                                child: Center(
                                    child: Text(
                                  "No items on the cart",
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Color(0xff353e5a),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )));
                          } else {
                            final itemList = state.list
                                .map((item) => buildItemCard(item))
                                .toList();
                            return Column(
                              children: <Widget>[
                                ...itemList,
                              ],
                            );
                          }
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 120,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Total",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Color(0xff353e5a),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          CubitBuilder<CartCubit, CartState>(
                              cubit: cartCubit,
                              builder: (context, state) {
                                return Text(
                                  "\$" +
                                      (cartCubit.getPrice.toStringAsFixed(2)),
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Color(0xff353e5a),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text(
                              "Success! Enjoy your Drink :)",
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Color(0xffeb7a27),
                            duration: Duration(seconds: 1),
                          ),
                        );
                        Future.delayed(Duration(milliseconds: 1200))
                            .then((value) {
                          cartCubit.checkout();
                          widget.returnToHome();
                        });
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
                            'CHECKOUT',
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
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemCard(Item item) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 23),
      child: Stack(
        fit: StackFit.loose,
        overflow: Overflow.visible,
        children: <Widget>[
          NeuCard(
            width: 300,
            height: 175,
            bevel: 16,
            curveType: CurveType.convex,
            decoration: NeumorphicDecoration(
              color: Color(0xffeff1fa),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 0.8),
            ),
          ),
          Positioned(
            top: -10,
            left: -20,
            child: Container(
              width: 122,
              height: 112,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Color(0xfff6aa74), Color(0xffeb7a27)],
                    stops: [0, 1],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x57ec7f2f),
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      spreadRadius: 0,
                    )
                  ]),
            ),
          ),
          Positioned(
            top: 10,
            left: 120,
            child: Container(
              width: 180,
              height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.name,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Color(0xff353e5a),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 75,
                            child: Text(
                              "Size",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Color(0xff353e5a),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            width: 75,
                            child: Text(
                              item.size,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Color(0xffacb5d3),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 75,
                            child: Text(
                              "Flavor",
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Color(0xff353e5a),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            width: 75,
                            child: Text(
                              item.flavor,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Color(0xffacb5d3),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 75,
                            child: Text(
                              "Topping",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  color: Color(0xff353e5a),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            width: 80,
                            child: Text(
                              item.topping,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Color(0xffacb5d3),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 25,
            child: Text(
              '\$ ${item.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Color(0xff353e5a),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: item.favorite == true
                ? IconShadowWidget(
                    Icon(
                      Icons.favorite,
                      color: Colors.red[600],
                    ),
                    showShadow: true,
                    shadowColor: Colors.red.shade600,
                  )
                : Container(),
          ),
          Positioned(
            top: -55,
            left: -40,
            child: Container(
              width: 160,
              height: 175,
              child: Image.asset(item.image),
            ),
          ),
        ],
      ),
    );
  }
}
