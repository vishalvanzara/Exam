import 'package:ecommerce/cartscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'Secondpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<Map<String, dynamic>> cartData = [];

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {

    });
  }
double range=0;
double start=20;
double end=80;
  List<Map<String, dynamic>> producData = [
    {
      'name': 'Salads',
    },
    {'name': 'Hot sale'},
    {'name': 'Popularity'}
  ];

  List<Map<String, dynamic>> listData = [
    {'name': 'Avocada Salad', 'image': 'assets/salad.png', 'price': 12.00},
    {'name': 'Fruits Salad', 'image': 'assets/Fruits.png', 'price': 11.00},
    {
      'name': 'Cucumber Salad',
      'image': 'assets/Cucumber.png',
      'price': 12.00
    },
    {'name': 'Avocada Salad', 'image': 'assets/salad.png', 'price': 12.00},
  ];
  int _value = 6;
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 30,
              ),
              Text(
                'ahemdabad',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18  ),
              ),
              SizedBox(
                width: 170,
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(86, 199, 198, 195),
                ),
                child: Icon(
                  Icons.menu_outlined,
                  size: 32,
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Find The',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                      children: const <TextSpan>[
                        TextSpan(
                            text: ' Best',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,

                                color: Colors.black))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                    height: 40,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Food',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                      children: const <TextSpan>[
                        TextSpan(
                            text: ' Around You',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                letterSpacing: 1))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(86, 199, 198, 195),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search_outlined,
                        size: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Search Your Favrourit Food',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Icon(
                        Icons.menu_open,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 250),
                child: RichText(
                  text: TextSpan(
                    text: 'Find',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: const <TextSpan>[
                      TextSpan(
                          text: '  5km >',
                          style:
                              TextStyle(fontSize: 15, color: Colors.deepOrange))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 35,top: 10,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   InkWell(
                      onTap:(){
                        setState(() {
                          index=0;
                        });
              },
                     child: Container(
                       width: 90,
                       height: 40,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color: index==0?Color.fromARGB(253, 84, 218, 50):Colors.white,
                           boxShadow: [BoxShadow(
                               blurStyle: BlurStyle.outer,
                               blurRadius: 2
                           )]
                       ),
                       child: Center(child: Text('Salad',style: TextStyle(
                         fontSize: 18,
                           color: index==0?Colors.white:Colors.black
                       ),)),
                     ),
                   ),

                    InkWell(
                      onTap:(){
                        setState(() {
                          index=1;
                        });
                      },
                      child: Container(
                        width: 90,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: index==1?Color.fromARGB(253, 84, 218, 50):Colors.white,
                            boxShadow: [BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 2
                            )]
                        ),
                        child: Center(child: Text('Hot sale',style: TextStyle(
                            fontSize: 18,
                          color: index==1?Colors.white:Colors.black
                        ),)),
                      ),
                    ),
                    InkWell(
                      onTap:(){
                        setState(() {
                          index=2;
                        });
                      },
                      child: Container(
                        width: 95,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: index==2?Color.fromARGB(253, 84, 218, 50):Colors.white,
                            boxShadow: [BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 2
                            )]
                        ),
                        child: Center(child: Text('Popularity',style: TextStyle(
                            fontSize: 18,
                            color: index==2?Colors.white:Colors.black
                        ),)),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ...listData
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Secondpage(
                                      image: e['image'],
                                      name: e['name'],
                                      Price: e['price'],
                                    )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 185,
                              height: 260,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(86, 199, 198, 195),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                e['image'].toString()),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    e['name'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Text(
                                        '20min',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      SizedBox(
                                        width: 45,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      Text(
                                        '4.5',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('\$',style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 19),),
                                      Text(
                                        e['price'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 19),
                                      ),
                                      SizedBox(width: 68, height: 51),
                                      InkWell(
                                        onTap: () {
                                          var cart = {
                                            'name': e['name'],
                                            'image': e['image'],
                                            'price': e['price'],
                                            'qty': 1,
                                            'total':e['price']
                                          };

                                          cartData.add(cart);
                                          print(cartData.length);

                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CartScreen(qty: 1, price: e['price'],)));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 9 ),
                                          child: Container(
                                            width: 45,
                                            height: 42,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(253, 84, 218, 50),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(15)),
                                            ),
                                            child: Icon(CupertinoIcons.plus,color: Colors.white,),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
             Slider(value: range,
                 max: 100,
                 min: 0,
                 onChanged:(double value){
               setState(() {
                 range=value;
               });
        }),
            ],
          ),
        ));
  }
}
