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


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _pageController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffeff1fa),
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
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
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
                icon: ImageIcon(AssetImage('assets/drawable-hdpi/home.png'),size: 24,),
                title: Text(
                  "HOME",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                )),
            BottomNavigationBarItem(title: Text("Add"), icon: ImageIcon(AssetImage('assets/drawable-hdpi/add.png'),size: 24,)),
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
                icon: ImageIcon(AssetImage('assets/drawable-hdpi/cart.png'),size: 24,)),
          ],
          onTap: (index) {
            if (index == 1) {
             _scaffoldKey.currentState.showSnackBar(SnackBar(
               backgroundColor: Color(0xffeb7a27),
               content: Text("Tap on a item to add it to cart!",
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontFamily: 'OpenSans',
                 fontWeight: FontWeight.w600,
               ),
               ),
             ));
            } else {
              setState(() {
                this.index = index;
              });
              _pageController.jumpToPage(index);
            }
          },
        ),
      ),
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            BlocProvider<HomeBloc>(
              create: (context) => HomeBloc(Repository()),
              child: HomePage(),
            ),
            CartPage(returnToHome: returnToHome,),
          ],
        ),
      ),
    );
  }
  void returnToHome(){
    setState(() {
      this.index = 0;
    });
    _pageController.jumpToPage(0);
  }
}
