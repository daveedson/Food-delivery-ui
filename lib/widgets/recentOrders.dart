import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/constants/textstyle.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class RecentOrders extends StatelessWidget {

   //method build to build horizontal scroll view 
  _buildRecentOrders(BuildContext context,Order order){

      return Container(
        margin: EdgeInsets.all(10.0),
        width: 320.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: 1.0,
            color: Colors.grey[300],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
         Row(
            children: <Widget>[
            ClipRRect(
                 borderRadius: BorderRadius.circular(15.0),
               child: Image( 
               height: 100.0,
                width: 100.0,
                image: AssetImage(order.food.imageUrl),
                fit: BoxFit.cover,
               ),
            ),
        ],
          ),
         Expanded(
            child: Container(
             margin: EdgeInsets.all(12.0),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(
                    order.food.name,
                    style: ktextstyle,
                 ),
                 SizedBox(height: 4.0,),
                 Text(
                   order.restaurant.name,
                   style: ktextstyle,
                  overflow: TextOverflow.ellipsis,
                 ),
                SizedBox(height: 4.0,),

                 Text(
                   order.date,
                   style: ktextstyle,
                   overflow: TextOverflow.ellipsis,

                 )
               ],
             ),
           ),
         ),
         Container(
           margin: EdgeInsets.only(right: 20.0),
           width: 48.0,
           decoration: BoxDecoration(
             color:Theme.of(context).primaryColor,
             borderRadius: BorderRadius.circular(30.0),
           ),
           child: IconButton(icon: Icon(Icons.add,color: Colors.white,), onPressed: (){}),
         )
          ],
        ),

      );

  }


  @override
  Widget build(BuildContext context) {
    return Column(      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('Recent Orders',
          style: kheadings
            ),
        ),
        Container(
          height: 120.0,
        //  color: Colors.blue,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order  = currentUser.orders[index];
            return _buildRecentOrders(context,order);
           },
          ),
        )
      ],
    );
  }
}