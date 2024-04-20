
import 'package:ecommerce/main.dart';
import 'package:ecommerce/pdf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final int qty;
  final double price;
  const CartScreen({super.key, required int this.qty, required double this.price});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double total = calculateTotalPrice(cartData);

    // double totalprice = cartData.fold(0, (Sum, e) =>  e['total']);
    double sum = 5 + total;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height - 600,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bgi.png'), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 140, left: 22, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                      print('abdcs');
                    },
                    child: Container(
                        width: 20,
                        height: 20,
                        child: Icon(CupertinoIcons.back,size: 29,color: Colors.white,)),
                  ),
                  Text('Cart',style: TextStyle(
                    color: Colors.white,
                    fontSize: 28
                  ),),
                  InkWell(

                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(CupertinoIcons.multiply,color: Colors.white,size: 28,))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
              child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Color.fromARGB(505,250,250,250))),

          ),
          Padding(
            padding: const EdgeInsets.only(top: 140, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: cartData
                          .map((e) => Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 360,
                                    height: 95,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                     color: Colors.white,
                                      boxShadow: [BoxShadow(
                                        blurStyle: BlurStyle.inner,
                                        blurRadius: 20
                                      )]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15,top: 5,bottom: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            e['image'],
                                            height: 100,
                                          ),
                                          SizedBox(width: 10,),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 13,bottom: 13),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(e['name'],style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16
                                                  ),),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Text('\$',style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16
                                                      ),),
                                                      Text(e['price'].toString(),style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16
                                                      ),),
                                                    ],
                                                  ),]
                                            ),
                                          ),
                                          SizedBox(width: 45,),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 15),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(CupertinoIcons.minus_circle_fill,size: 26,),
                                                    SizedBox(width: 5,),
                                                    Text(e['qty'].toString(),style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w500,
                                                    ),),
                                                    SizedBox(width: 5,),
                                                    Icon(CupertinoIcons.plus_circle_fill,size: 26,),
                                                  ],
                                                ),
                                               Row(
                                                 children: [
                                                   Text('\$'),
                                                   Text(e['total'].toString()),
                                                 ],
                                               ),
                                                InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        cartData.remove(e);
                                                      });
                                                    },
                                                    child: Icon(CupertinoIcons.delete,size: 19,)),
                                              ],
                                            ),
                                          ),
                                          ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 460),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(252, 250, 249, 249),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 355,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                blurStyle: BlurStyle.normal,
                                blurRadius: 0,
                                color: Colors.black)
                          ]),
                      child: Row(
                        children: [
                          Icon(Icons.discount_outlined),
                          Text('Promo Code'),
                          SizedBox(
                            width: 130,
                          ),
                          Container(
                            width: 105,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(253, 84, 218, 50),
                                borderRadius: BorderRadius.circular(35),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      blurStyle: BlurStyle.outer,
                                      color: Colors.green)
                                ]),
                            child: Center(
                                child: Text(
                              'Apply',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 570),
            child: Container(
              width: width,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20,top: 45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                        Text('$total',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                       // Text(widget.Total as String),
                      ],
                    ),
                    Container(
                      width: 380,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFC4C4C4),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$5.00',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                        ),
                        Text(
                          '$sum',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    Container(
                      width: 350,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(253, 84, 218, 50),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PdfData(proTotal: sum, proPrice: total,)));
                          },
                          child: Text(
                            'CHECKOUT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


double calculateTotalPrice(List<Map<String, dynamic>> cartData) {
  double totalPrice = 0.0;

  for (var e in cartData) {
    double price = e['total'];
    totalPrice += price;
  }

  return totalPrice;
}