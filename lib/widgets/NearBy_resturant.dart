import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/constants/textstyle.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/ratingStars.dart';


class Nearby_Resturants extends StatelessWidget {
 

    //todo study this block..
  _buildResturants(){

    List<Widget> resturantList = [];  
    restaurants.forEach((Restaurant resturant){
      resturantList.add(
        Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                width: 1.0,
                color: Colors.grey[300],
              )
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                    image: AssetImage(resturant.imageUrl),
                    ),
                ),
                Container(
                  margin: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        resturant.name,
                        style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                       RatingStars(resturant.rating),
                      Text(
                        resturant.address,
                        style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,

                      ),
                      SizedBox(height: 4.0,),
                      Text('1 kilometer away',
                      style: TextStyle(fontWeight: FontWeight.bold,),
                      overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
        )
      );
    });
    return Column(children: resturantList);

  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            
            'Near By Resturants',
            style: kheadings,
            ),
        ),
        _buildResturants(),
        
      ],
    );
  }
}