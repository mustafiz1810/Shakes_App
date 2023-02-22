import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'widgets/shake_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  List<String> _shakes = [
    "assets/shake.png",
    "assets/shake1.png",
    "assets/shake2.png",
    "assets/shake3.png",
    "assets/shake4.webp",
  ];
  List<String> _coktails = [
    "assets/pngegg.png",
    "assets/—Pngtree—tequila sunrise cocktail in transparent_5048777.png",
    "assets/pngegg (1).png",
    "assets/pngegg (2).png",
    "assets/pngegg (3).png",
  ];
  List<String> _drink = [
    "assets/jack.png",
    "assets/absulot.png",
    "assets/rum.png",
    "assets/wine.png",
    "assets/scothc.png",
  ];

  bool _shakeSelected = true;
  bool _coffeeSelected = false;
  bool _cocktailsSelected = false;
  bool _softSelected = false;
  int _itemNumber = 0;
  var drinks;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this)
          ..addListener(() => setState(() {}));
    animation = Tween(begin: -200.0, end: 200.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.brown,
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 15, right: 15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 153, 33, 53).withOpacity(1),
              _cocktailsSelected == true ?
              Colors.deepOrangeAccent.shade100:
            _softSelected == true ?Colors.redAccent:Color(0xFF521f26),
            ])),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Transform.translate(
                offset: Offset(
                  animation.value,
                  animation.value,
                ),
                child: BlurryContainer(
                  height: 150,
                  width: 150,
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.red.withOpacity(.2),
                  blur: 2,
                  child: Container(),
                ),
              ),
            ),
            Bounce(
              child: Positioned(
                bottom: 60,
                left: 150,
                child: Transform.translate(
                  offset: Offset(animation.value * -1, animation.value * -1),
                  child: BlurryContainer(
                    height: 150,
                    width: 150,
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red.withOpacity(.2),
                    blur: 2,
                    child: Container(),
                  ),
                ),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome, Mustafiz!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "SHAKES",
                  style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontSize: 25,
                      fontFamily: "Electrolize",
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Search",
                      contentPadding: EdgeInsets.only(left: 10),
                      icon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.brown,
                          size: 30,
                        ),
                      )),
                ),
              ),

// * side bar and shakes items
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // * side navBar
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.5,
                            // color: Colors.black,
                            width: 360,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Positioned(
                                      right: 80,
                                      child: Transform.rotate(
                                        angle: pi * 1.5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: [
                                                // * soft juice
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _softSelected = true;
                                                      _coffeeSelected = false;
                                                      _shakeSelected = false;
                                                      _cocktailsSelected =
                                                          false;
                                                    });
                                                  },
                                                  child: Bounce(
                                                    delay: Duration(
                                                        milliseconds: 1000),
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      height: 70,
                                                      width: 110,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: _softSelected
                                                            ? Colors.red
                                                                .withOpacity(.5)
                                                            : Colors.white
                                                                .withOpacity(
                                                                    .1),
                                                      ),
                                                      padding: const EdgeInsets.all(5),
                                                      child: const Center(
                                                        child: Text(
                                                          "Drinks",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _softSelected = false;
                                                      _coffeeSelected = true;
                                                      _shakeSelected = false;
                                                      _cocktailsSelected =
                                                          false;
                                                    });
                                                  },
                                                  child: Bounce(
                                                    delay: Duration(
                                                        milliseconds: 800),
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      height: 70,
                                                      width: 100,
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: _coffeeSelected
                                                            ? Colors.red
                                                                .withOpacity(.5)
                                                            : Colors.white
                                                                .withOpacity(
                                                                    .1),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Coffees",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _softSelected = false;
                                                      _coffeeSelected = false;
                                                      _shakeSelected = false;
                                                      _cocktailsSelected = true;
                                                    });
                                                  },
                                                  child: Bounce(
                                                    delay: Duration(
                                                        milliseconds: 600),
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      height: 70,
                                                      width: 100,
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: _cocktailsSelected
                                                            ? Colors.red
                                                                .withOpacity(.5)
                                                            : Colors.white
                                                                .withOpacity(
                                                                    .1),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Cocktails",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _softSelected = false;
                                                      _coffeeSelected = false;
                                                      _shakeSelected = true;
                                                      _cocktailsSelected =
                                                          false;
                                                    });
                                                  },
                                                  child: Bounce(
                                                    delay: Duration(
                                                        milliseconds: 400),
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      height: 70,
                                                      width: 100,
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: _shakeSelected
                                                            ? Colors.red
                                                                .withOpacity(.5)
                                                            : Colors.white
                                                                .withOpacity(
                                                                    .1),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Shake",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),

                                  // * vertical divider
                                  Positioned(
                                    left: 100,
                                    top: 80,
                                    // bottom: 10,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 500,
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // * shakes list
                                  Positioned(
                                    left: 130,
                                    top: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Container(
                                        //   height: 200,
                                        //   width: 200,
                                        //   color: Colors.white,
                                        // ),
                                        _cocktailsSelected == true
                                            ? Align(
                                                alignment: Alignment.centerLeft,
                                                child: SizedBox(
                                                    height: 650,
                                                    width: 250,
                                                    child: ListWheelScrollView(
                                                      onSelectedItemChanged:
                                                          (a) {
                                                        print(a);
                                                        setState(() {
                                                          _itemNumber = a;
                                                        });
                                                      },
                                                      itemExtent: 250,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            print("Hel");
                                                          },
                                                          child: ShakeWidget(
                                                            shakes: "Berry Cocktail",
                                                            shakesImg:
                                                                _coktails[0],
                                                            price: "543",
                                                          ),
                                                        ),
                                                        ShakeWidget(
                                                          shakes: "Peach",
                                                          shakesImg:
                                                              _coktails[1],
                                                          price: "342",
                                                        ),
                                                        ShakeWidget(
                                                          shakes: "Lemon",
                                                          shakesImg:
                                                              _coktails[2],
                                                          price: "234",
                                                        ),
                                                        ShakeWidget(
                                                          shakes: "Margarita",
                                                          shakesImg:
                                                              _coktails[3],
                                                          price: "542",
                                                        ),
                                                        ShakeWidget(
                                                          shakes: "Blue Lagoon",
                                                          shakesImg:
                                                              _coktails[4],
                                                          price: "542",
                                                        ),
                                                      ],
                                                    )))
                                            :_softSelected == true?
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                                height: 650,
                                                width: 250,
                                                child: ListWheelScrollView(
                                                  onSelectedItemChanged:
                                                      (a) {
                                                    print(a);
                                                    setState(() {
                                                      _itemNumber = a;
                                                    });
                                                  },
                                                  itemExtent: 250,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        print("Hel");
                                                      },
                                                      child: ShakeWidget(
                                                        shakes: "Jack Daniels",
                                                        shakesImg:
                                                        _drink[0],
                                                        price: "5000 tk",
                                                      ),
                                                    ),
                                                    ShakeWidget(
                                                      shakes: "Absolut vodka",
                                                      shakesImg: _drink[1],
                                                      price: "6000 tk",
                                                    ),
                                                    ShakeWidget(
                                                      shakes: "Old Monk",
                                                      shakesImg: _drink[2],
                                                      price: "4000 tk",
                                                    ),
                                                    ShakeWidget(
                                                      shakes: "Wine",
                                                      shakesImg: _drink[3],
                                                      price: "25000 tk",
                                                    ),
                                                    ShakeWidget(
                                                      shakes: "Red lebel",
                                                      shakesImg: _drink[4],
                                                      price: "8000 tk",
                                                    ),
                                                  ],
                                                )))
                                           : Align(
                                                alignment: Alignment.centerLeft,
                                                child: SizedBox(
                                                    height: 650,
                                                    width: 250,
                                                    child: ListWheelScrollView(
                                                      onSelectedItemChanged:
                                                          (a) {
                                                        print(a);
                                                        setState(() {
                                                          _itemNumber = a;
                                                        });
                                                      },
                                                      itemExtent: 250,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            print("Hel");
                                                          },
                                                          child: ShakeWidget(
                                                            shakes: "Mix shake",
                                                            shakesImg:
                                                                _shakes[0],
                                                            price: "543",
                                                          ),
                                                        ),
                                                        ShakeWidget(
                                                          shakes: "Soft shake",
                                                          shakesImg: _shakes[1],
                                                          price: "342",
                                                        ),
                                                        ShakeWidget(
                                                          shakes: "Mech Shake",
                                                          shakesImg: _shakes[2],
                                                          price: "234",
                                                        ),
                                                        ShakeWidget(
                                                          shakes: "Berry Juice",
                                                          shakesImg: _shakes[3],
                                                          price: "542",
                                                        ),
                                                        ShakeWidget(
                                                          shakes: "Milk Juice",
                                                          shakesImg: _shakes[4],
                                                          price: "542",
                                                        ),
                                                      ],
                                                    )))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // * items list
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
