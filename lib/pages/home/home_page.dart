import 'package:CoffeShopApp/models/item.dart';
import 'package:CoffeShopApp/pages/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  var selectedList = [false, false, true];
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
              child: sideNavOptionsBar(size, selectedList, homeBloc),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    ListView(
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
                              if (state is HomeAllItens) {
                                return GridView.count(
                                  padding: EdgeInsets.only(top: 10),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  mainAxisSpacing: 15,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.8,
                                  children:
                                      List.generate(state.list.length, (index) {
                                    return coffeShopItem(state.list[index]);
                                  }),
                                );
                              } else if (state is HomeFilteredByCoffe) {
                                return Center(child: Text("Coffee"));
                              } else if (state is HomeFilteredByTea) {
                                return Center(child: Text("Tea"));
                              }
                              return Container();
                            }),
                      ],
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
                        height: 75,
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    FontAwesomeIcons.home,
                  ),
                  onPressed: () {}),
              IconButton(icon: Icon(FontAwesomeIcons.plus), onPressed: () {}),
              IconButton(
                  icon: Icon(FontAwesomeIcons.shoppingCart), onPressed: () {})
            ],
          )),
    );
  }

  Widget sideNavOptionsBar(
      Size size, List<bool> selectedList, HomeBloc homeBloc) {
    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        height: 20,
        child: BlocBuilder<HomeBloc,HomeState>(
          bloc: homeBloc,
          builder:(context,state) => ToggleButtons(
            fillColor: Colors.transparent,
            selectedColor: Colors.orange,
            renderBorder: false,
            isSelected: selectedList,
            onPressed: (int index) {
              homeBloc.add(ChangePageFilter(index: index));
            },
            children: <Widget>[
              Text("Tea",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  )),
              Text("Coffe",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  )),
              Text("Recent Orders",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget coffeShopItem(Item item) {
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
                  border: Border.all(color: Colors.white54, width: 2),
                  color: Color(0xffeff1fa),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0d7582a8),
                      spreadRadius: -10,
                    )
                  ],
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
                      width: 125,
                      child: ListTile(
                        leading: Icon(
                          Icons.favorite_border,
                          color: Color(0xff353e5a),
                        ),
                        trailing: Text(
                          "\$ " + "${item.price}",
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
            ],
          )),
    );
  }
}
