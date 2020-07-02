import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(onPressed: (){
          Navigator.of(context).pop();
        }),
      ),
    );
  }
}
