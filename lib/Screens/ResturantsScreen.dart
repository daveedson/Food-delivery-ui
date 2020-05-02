import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';

class ResturantScreen extends StatefulWidget {

  final Restaurant restaurant;

  ResturantScreen({this.restaurant}); 

  @override
  _ResturantScreenState createState() => _ResturantScreenState();
}

class _ResturantScreenState extends State<ResturantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                              child: Image(
                  image: AssetImage(widget.restaurant.imageUrl),
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  ),
              ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30.0,), 
                        onPressed: (){
                            Navigator.pop(context);
                      },
                      ),
                       IconButton(
                        icon: Icon(Icons.favorite,color: Theme.of(context).primaryColor,size: 35.0,), 
                        onPressed: (){

                      },
                      ),
                      
                    ],
                  ),
                )
            ],
          )
        ],
      )
      
    );
  }
}