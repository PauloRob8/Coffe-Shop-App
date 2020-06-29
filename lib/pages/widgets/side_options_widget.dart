import 'package:flutter/material.dart';

Widget sideNavOptionsBar(Size size,List<bool> selectedList) { 
  return RotatedBox(
    quarterTurns: -1,
    child: Container(
      child: ToggleButtons(
        selectedColor: Color(0xffeb7a27),
        disabledBorderColor: Colors.transparent,
        isSelected: selectedList,
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