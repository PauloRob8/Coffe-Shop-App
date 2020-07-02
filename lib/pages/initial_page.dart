import 'package:CoffeShopApp/pages/AddToCart/add_to_cart_page.dart';
import 'package:CoffeShopApp/pages/Cart/cart_page.dart';
import 'package:CoffeShopApp/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/bloc/home_bloc.dart';
import 'home/home_page.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  PageController pageController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
            color: Color(0xfff8faff),
            boxShadow: [
              BoxShadow(
                  color: Color(0x26353e5a),
                  offset: Offset(0, -3),
                  blurRadius: 20,
                  spreadRadius: 0)
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
        child: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Color(0xffeb7a27),
          unselectedItemColor: Color(0xff828eb4),
          backgroundColor: Colors.transparent,
          elevation: 0,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  "HOME",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                )),
            BottomNavigationBarItem(title: Text("Add"), icon: Icon(Icons.add)),
            BottomNavigationBarItem(
                title: Text(
                  "CART",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                icon: Icon(Icons.shopping_cart)),
          ],
          onTap: (index) {
            if (index == 1) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddToCart()));
            } else {
              setState(() {
                this.index = index;
              });
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 400), curve: Curves.linear);
            }
          },
        ),
      ),
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            BlocProvider<HomeBloc>(
              create: (context) => HomeBloc(Repository())..add(AppStarted()),
              child: HomePage(),
            ),
            CartPage(),
          ],
        ),
      ),
    );
  }
}
