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
    final AddtocartBloc addtocartBloc = BlocProvider.of<AddtocartBloc>(context);
    int counter = 1;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xfff5f8ff),
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
                itemOptions(context),
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
                          addtocartBloc.add(DecrementValue(value: counter));
                          print(counter);
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
                            bloc: AddtocartBloc(),
                            builder: (context, state) {
                              if (state is AmountChanged) {
                                return Text(
                                  state.value.toString(),
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Color(0xff353e5a),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  ),
                                );
                              }
                              return Text(
                                addtocartBloc.value.toString(),
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  color: Color(0xff353e5a),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                              );
                            }),
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
                          addtocartBloc.add(IncrementValue(value: counter));
                          print(counter);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CartPage()));
                  },
                  child: Container(
                    width: 200,
                    height: 52,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          stops: [0, 1],
                          begin: Alignment(-0.99, -0.10),
                          end: Alignment(0.99, 0.10),
                          colors: [Color(0xfff6aa74), Color(0xffeb7a27)]),
                    ),
                    child: Center(
                      child: Text(
                        'ADD TO CART',
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

  Widget itemOptions(BuildContext context) {
    return NeuCard(
      width: 310,
      height: 265,
      bevel: 14,
      curveType: CurveType.flat,
      decoration: NeumorphicDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xfff5f8ff),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(left: 25, right: 25),
            title: Text("Size"),
            subtitle: Text(item.size),
            trailing: FloatingActionButton(
              elevation: 5,
              backgroundColor: Color(0xffffffff),
              heroTag: 'btn1',
              child: Icon(
                Icons.arrow_forward,
                color: Colors.grey[600],
              ),
              onPressed: () {
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Divider(),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25, right: 25),
            title: Text("Flavor"),
            subtitle: Text(item.flavor),
            trailing: FloatingActionButton(
              elevation: 5,
              backgroundColor: Color(0xffffffff),
              heroTag: 'btn2',
              child: Icon(
                Icons.arrow_forward,
                color: Colors.grey[600],
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Divider(),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25, right: 25),
            title: Text("Topping"),
            subtitle: Text(item.topping),
            trailing: FloatingActionButton(
              elevation: 5,
              backgroundColor: Color(0xffffffff),
              heroTag: 'btn3',
              child: Icon(
                Icons.arrow_forward,
                color: Colors.grey[600],
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  getItemFromPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String item = preferences.getString('item');
    return item as Item;
  }
}
