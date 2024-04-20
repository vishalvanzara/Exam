import 'package:ecommerce/cartscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Secondpage extends StatefulWidget {
  final String image;
  final String name;
  final double Price;

  const Secondpage(
      {super.key,
      required this.image,
      required this.name,
      required this.Price});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  double total = calculateTotalPrice(cartData);
  List<Map<String, dynamic>> emoji = [
    {
      'pic': '🥕',
    },
    {
      'pic': '🍎',
    },
    {
      'pic': '🥒',
    },
    {
      'pic': '🥑',
    },
    {
      'pic': '🥬',
    },
  ];
  int number = 1;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back, color: Colors.white, size: 28)),
               Padding(
                 padding: const EdgeInsets.only(left: 110),
                 child: Container(
                   width: 20,
                   height: 7,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(25)
                   ),
                 ),
               ),
            Container(
              width: 7,
              height: 17,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 110),
              child: Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  CupertinoIcons.heart,
                  size: 28,
                  color: Colors.white,
                )),
          ],
        ),
        backgroundColor:Color.fromARGB(253, 84, 218, 50),
      ),
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            color: Color.fromARGB(253, 84, 218, 50),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(widget.image), fit: BoxFit.fitWidth),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 40,
                        spreadRadius: 5,
                        blurStyle: BlurStyle.normal,
                        color: Color.fromARGB(253, 84, 218, 50),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 95,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(253, 84, 218, 50),
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                             if(number>0) number--;
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Icon(
                              CupertinoIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          number.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              number++;
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Icon(
                              CupertinoIcons.plus,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          letterSpacing: 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Fresh Avocado, shrimps salad with lettuce green mix,'),
                Text('cherry tomatoes,A herbs and olive oil,lemon dressing.'),
                Padding(
                  padding: const EdgeInsets.only(right: 180),
                  child: RichText(
                    text: TextSpan(
                      text: 'healthy food...',
                      style: TextStyle(color: Colors.black),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'ReadMore',
                            style: TextStyle(
                                color:Color.fromARGB(253, 84, 218, 50),
                                letterSpacing: 1))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '⭐',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              letterSpacing: 2),
                          children: const <TextSpan>[
                            TextSpan(
                                text: ' 4.5',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '🔥',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          children: const <TextSpan>[
                            TextSpan(
                                text: '100 Kcal',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '⏲️',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                                text: '5-10 Min',
                                style: TextStyle(
                                    fontSize: 18,
                                     fontWeight: FontWeight.bold,
                                    color: Colors.black))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Ingradients',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      ...emoji.map((e) => Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 17, bottom: 20),
                            child: Container(
                              width: 55,
                              height: height-785,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color.fromARGB(86, 199, 198, 195),
                              ),
                              child: Center(
                                child: Text(
                                  e['pic'],
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {

                    var cart = {
                      'name': widget.name,
                      'image': widget.image,
                      'price': widget.Price,
                      'qty': number,
                      'total': number*widget.Price,

                    };

                    cartData.add(cart);
                    print(cartData.length);

                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                CartScreen(qty: number , price: widget.Price, /*price: widget.Price*/)));
                  },
                  child: Container(
                    width: 350,
                    height: height-775,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(253, 84, 218, 50),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Add To Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
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