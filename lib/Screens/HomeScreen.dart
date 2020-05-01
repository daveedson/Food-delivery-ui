

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
      body: ListView(
        children:<Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
                      child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0),
                borderSide: BorderSide(width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0),
                borderSide: BorderSide(width: 0.5,color: Theme.of(context).primaryColor),
                ),
                hintText: 'Search Food or Resturant',
                prefixIcon: Icon(Icons.search,//adding of icon in the text Field
                size: 30.0,
                ),
                suffixIcon: IconButton(icon: Icon(Icons.clear), 
                onPressed: (){

                },
                )
              )
            ),
          )
        ]
      ),
    );
  }
}