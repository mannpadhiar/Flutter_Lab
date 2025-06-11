import 'package:flutter/material.dart';
import 'package:sem_5/E-commerce/controller/e_commerce_controller.dart';

class EcommerceView extends StatefulWidget {
  const EcommerceView({super.key});

  @override
  State<EcommerceView> createState() => _EcommerceViewState();
}

class _EcommerceViewState extends State<EcommerceView>
    with TickerProviderStateMixin {
  final ECommerceController _controller = ECommerceController();
  int currIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey[100],
        body: TabBarView(
          controller: _tabController,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      border: Border.all(color: Colors.white,width: 2),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Darshan University, Rajkot',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on,size: 12,color: Colors.grey,),
                                Text(
                                  'Your Location',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.greenAccent[100],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.shopping_bag,
                                color: Color(0xff00720f),
                              ),
                              SizedBox(width: 3),
                              Text(
                                _controller.cartItems.length.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  // SizedBox(height: 25,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text('FlashSale',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900,color: Colors.white),),
                  //     const Text('Popular',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900)),
                  //     const Text('NewArrival',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900,color: Colors.grey)),
                  //   ],
                  // ),
                  SizedBox(height: 8),
                  Expanded(
                    child: GridView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 300,
                      ),
                      itemCount: _controller.products.length,
                      itemBuilder:
                          (context, index) => Container(
                            child: Card(
                              color: Colors.white,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Color(0xFFFBFFE0), Colors.white],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Image.asset('lib/assets/images/image1.png',scale: 3,)
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                _controller.products[index].name,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.currency_rupee,
                                                        size: 16,
                                                        color: Colors.green,
                                                      ),
                                                      Text(
                                                        _controller
                                                            .products[index]
                                                            .price
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      _controller.addToCart(
                                                        _controller.products[index],
                                                      );
                                                      setState(() {});
                                                    },
                                                    icon: CircleAvatar(
                                                      radius: 18,
                                                      child: const Icon(Icons.add),
                                                      backgroundColor:
                                                      Colors.orange,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Text(_controller.products[index].description.substring(0,4))
                                      ],
                                    ),
                                    Positioned(
                                      top: 8,
                                      left: 8,
                                      child: CircleAvatar(
                                        radius: 18,
                                        child: IconButton(onPressed: () {
                                          _controller.addFavouriteProduct(index, !_controller.products[index].isFav);
                                          setState(() {});
                                        }, icon: Icon(_controller.products[index].isFav?Icons.favorite:Icons.favorite_outline_rounded,size: 20,color: Colors.deepPurple,),)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      border: Border.all(color: Colors.white,width: 2),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Darshan University,rajkot',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on,size: 12,color: Colors.grey,),
                                Text(
                                  'Your Location',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.greenAccent[100],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.shopping_bag,
                                color: Color(0xff00720f),
                              ),
                              SizedBox(width: 3),
                              Text(
                                _controller.cartItems.length.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _controller.cartItems.isEmpty?
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_shopping_cart_outlined,size: 80,color: Colors.orange[200],),
                      Text('Cart is Empty',style: TextStyle(color: Colors.black26,fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
                    :Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 300,
                    ),
                    itemCount: _controller.cartItems.length,
                    itemBuilder: (context, index) => Card(
                      color: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFFEFFE0), Colors.white],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Image.asset('lib/assets/images/image1.png',scale: 3,)
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          _controller.cartItems[index].name,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.currency_rupee,
                                                  size: 16,
                                                  color: Colors.green,
                                                ),
                                                Text(
                                                  _controller
                                                      .cartItems[index]
                                                      .price
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.blue,
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                                ),
                                                onPressed: () {

                                                },
                                                child: Text('Buy Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Text(_controller.products[index].description.substring(0,4))
                                ],
                              ),
                              Positioned(
                                right: 2,
                                top: 2,
                                child: IconButton(
                                  onPressed: () {
                                    _controller.removeToCart(_controller.cartItems[index]);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.close,size: 24,),
                                ),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(20),
            //   child: BottomNavigationBar(
            //     type: BottomNavigationBarType.shifting,
            //     showSelectedLabels: false,
            //     showUnselectedLabels: false,
            //     backgroundColor: Colors.white,
            //     onTap: (value) {
            //       currIndex = value;
            //       setState(() {});
            //     },
            //     currentIndex: currIndex,
            //     items: [
            //       BottomNavigationBarItem(
            //         icon: Icon(Icons.home),
            //         label: 'Home',
            //         activeIcon: Container(
            //           padding: EdgeInsets.symmetric(vertical: 10),
            //           decoration: BoxDecoration(
            //               color: Colors.green,
            //               borderRadius: BorderRadius.circular(20)
            //           ),
            //           child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Icon(Icons.home),
            //             SizedBox(width: 1,),
            //             Text('Home',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
            //           ],
            //                             ),
            //         ),
            //       ),
            //       BottomNavigationBarItem(
            //         icon: Icon(Icons.shopping_cart,color: Colors.black,),
            //         label: 'Favourite',
            //         activeIcon: Container(
            //           padding: EdgeInsets.symmetric(vertical: 10),
            //           decoration: BoxDecoration(
            //             color: Colors.green,
            //             borderRadius: BorderRadius.circular(20)
            //           ),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               Icon(Icons.shopping_cart,color: Colors.black,),
            //               SizedBox(width: 1,),
            //               Text('Cart',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
            //             ],
            //           ),
            //         )
            //       ),
            //     ],
            //   ),
            // ),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green[100],
              ),
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.home),
                        const SizedBox(width: 2),
                        const Text('Home'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.shopping_cart),
                        const SizedBox(width: 2),
                        const Text('Cart'),
                      ],
                    ),
                  ),
                ],
                indicator: BoxDecoration(
                  color: Color(0xFF0C6938),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


