import 'package:CoffeShopApp/models/item.dart';
import 'package:CoffeShopApp/pages/AddToCart/add_to_cart_provider.dart';
import 'package:CoffeShopApp/pages/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:neumorphic/neumorphic.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffeff1fa),
      body: SafeArea(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                  child: sideNavOptionsBar(size, homeBloc)),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    CupertinoScrollbar(
                      child: ListView(
                        padding: EdgeInsets.only(top: 50),
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 25),
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.search,
                              size: 35,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 15),
                            child: Center(
                              child: Text(
                                "Good Morning, \nJennifer!",
                                textAlign: TextAlign.justify,
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
                          BlocBuilder<HomeBloc, HomeState>(
                              bloc: homeBloc,
                              builder: (context, state) {
                                if (state is FilteredItems) {
                                  return buildGridView(state.items);
                                } else if (state is HomeLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return Container();
                              }),
                        ],
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.white,
                            Colors.white,
                            Colors.transparent
                          ],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: Container(
                        height: 70,
                        color: Color(0xffeff1fa),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 50),
                      width: 130,
                      height: 130,
                      child: Image.asset(
                          'lib/assets/drawable-hdpi/Profile pic.png'),
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

  Widget sideNavOptionsBar(Size size, HomeBloc homeBloc) {
    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        margin: EdgeInsets.only(right: 120),
        height: 20,
        child: BlocBuilder<HomeBloc, HomeState>(
            bloc: homeBloc,
            builder: (context, state) {
              print(state);
              if (state is FilteredItems) {
                return filterButtons(state.currentIndex, homeBloc);
              }
              return Container();
            }),
      ),
    );
  }

  Widget filterButtons(int currentIndex, HomeBloc bloc) {
    final selectedItems =
        List.generate(3, (index) => index == currentIndex ? true : false);
    return ToggleButtons(
      fillColor: Colors.transparent,
      color: Color(0xff828eb4),
      selectedColor: Color(0xffeb7a27),
      renderBorder: false,
      isSelected: selectedItems,
      onPressed: (int index) {
        bloc.add(ChangePageFilter(index: index));
      },
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.centerStart,
          child: Text("Tea",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              )),
        ),
        Container(
          width: 130,
          alignment: AlignmentDirectional.topCenter,
          child: Text("Coffee",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              )),
        ),
        Container(
          alignment: AlignmentDirectional.centerEnd,
          child: Text("Recent Orders",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              )),
        ),
      ],
    );
  }

  Widget buildGridView(List<Item> list) {
    return GridView.count(
      padding: EdgeInsets.only(top: 20, right: 5, left: 5),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 15,
      crossAxisCount: 2,
      childAspectRatio: 0.8,
      children: List.generate(list.length, (index) {
        return coffeShopItem(list[index], context);
      }),
    );
  }

  Widget coffeShopItem(Item item, BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddToCartProvider(item: item)));
        },
        child: Material(
          color: Color(0xffeff1fa),
          child: Stack(
            fit: StackFit.loose,
            overflow: Overflow.visible,
            alignment: Alignment.topCenter,
            children: <Widget>[
              NeuCard(
                width: 138,
                height: 190,
                bevel: 2,
                curveType: CurveType.concave,
                decoration: NeumorphicDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white54, width: 2),
                  color: Color(0xfff6f6fb),
                ),
              ),
              Positioned(
                top: -10,
                child: Container(
                  width: 112,
                  height: 100,
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
                top: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${item.name}",
                      style: TextStyle(
                          color: Color(0xff353e5a),
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                          fontFamily: 'OpenSans'),
                    ),
                    Container(
                      width: 140,
                      child: ListTile(
                        leading: item.favorite == false
                            ? IconButton(
                                highlightColor: Colors.red,
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {
                                  setState(() {
                                    item.favorite = !item.favorite;
                                  });
                                },
                                color: Color(0xff353e5a),
                              )
                            : IconButton(
                                icon: IconShadowWidget(
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                  showShadow: true,
                                  shadowColor: Colors.red.shade500,
                                ),
                                onPressed: () {
                                  setState(() {
                                    item.favorite = !item.favorite;
                                  });
                                },
                                color: Colors.red[600],
                              ),
                        trailing: Text(
                          "\$ " + "${item.price.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: -50,
                child: Container(
                  width: 160,
                  height: 160,
                  child: Image.asset(item.image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
