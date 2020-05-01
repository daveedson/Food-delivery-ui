

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.account_circle,color: Colors.white,),
        iconSize: 30.0,
        onPressed: (){},
        ),
        title: Text('Food Delivery',style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          FlatButton(onPressed: (){}, 
          child: Text('Cart (${currentUser.cart.length})',
          style: TextStyle(fontSize: 20.0,color: Colors.white),
          ),
          ),
        ],
      ),
    );
  }
}