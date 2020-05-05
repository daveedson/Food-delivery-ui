import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 170.0,
      child: Row(
        children: <Widget>[
          Expanded(
                      child: Row(
              children: <Widget>[
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage(
                          order.food.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        order.food.name,
                        style:
                            TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        order.restaurant.name,
                        style:
                            TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              width: 0.9,
                              color: Colors.black54,
                            ),
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '-',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(order.quantity.toString()),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              '+',
                              style:TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600) ,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
                      child: Text(
              
              '\$${order.quantity * order.food.price}',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
      
    );
  }

  @override
  Widget build(BuildContext context) {

    double totalPrice = 0;
    currentUser.cart.forEach(
      (Order order) => totalPrice += order.quantity * order.food.price,
    ); 

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart (${currentUser.cart.length})',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    if(index<currentUser.cart.length){
            Order order = currentUser.cart[index];
            return _buildCartItem(order);
            }
            return Padding(
              padding: EdgeInsets.all(20.0),
                          child: Column(
                children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Estimated delivery time',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('25min',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600
                        ) ,),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total Cost',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('\$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.greenAccent[700],
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600
                        ) ,),
                      ],
                    ),
                    SizedBox(height: 80.0,)
                ],
              ),

            );
            
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1.0,
              color: Colors.grey,
            );
          },
          itemCount: currentUser.cart.length +1),
          
          bottomSheet: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0)),
                      child: Container(
              height: 80.0,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: FlatButton
                (child: Text('CHECKOUT',style:TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2.0)),
                 onPressed: () {},),
              )
            ),
          ),
    );
  }
}
