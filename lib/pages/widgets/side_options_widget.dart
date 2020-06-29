import 'package:flutter/material.dart';

Widget sideNavOptionsBar(Size size,List<bool> selectedList) { 
  return RotatedBox(
    quarterTurns: -1,
    child: Container(
      margin: EdgeInsets.only(right:18),
      child: ToggleButtons(
        selectedColor: Color(0xffeb7a27),
        disabledBorderColor: Colors.transparent,
        borderColor: Colors.transparent,
        selectedBorderColor: Colors.transparent,
        isSelected: selectedList,
        onPressed: (int index){
          selectedList[index] = !selectedList[index];
        },
        children: <FlatButton>[
          FlatButton(
            onPressed: (){},
            child: Text("Tea",
            style: TextStyle(
              fontFamily: 'OpenSans',
              color: Color(0xff828eb4),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            )
            ),
          ),
          FlatButton(
            onPressed: (){},
            child: Text("Coffe",
            style: TextStyle(
              fontFamily: 'OpenSans',
              color: Color(0xff828eb4),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            )
            ),
          ),
          FlatButton(
            onPressed: (){},
            child: Text("Recent Orders",
            style: TextStyle(
              fontFamily: 'OpenSans',
              color: Color(0xff828eb4),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            )
            ),
          ),
        ],
      )
    ),
    );
}