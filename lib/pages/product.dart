import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_modern_and_vintage/pages/image_view.dart';
import 'package:the_modern_and_vintage/pages/numeric.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {

  List<String> items = [
    'https://images.unsplash.com/photo-1526947425960-945c6e72858f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1493723843671-1d655e66ac1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1557704595-ecd34dc3a4b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=810&q=80',
    'https://images.unsplash.com/photo-1661394982175-3fbec4a4c941?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80'
  ];

  int numberOfItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffdcda),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
        title: Text(
          'Product Description',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFffdcda),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top:10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 250,
                          enlargeCenterPage: true,
                          initialPage: 0,
                          viewportFraction: 0.75
                        ),
                        items: items.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ImageView(url: i),
                                    )
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Colors.white
                                  ),
                                  child: Image.network(
                                    i,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: Colors.black,
                        thickness: 1.5,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product Name',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Product Description\nProduct Description',
                              // maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Price:',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '₹ 199',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NumericStepButton(
                      maxValue: 10, 
                      onChanged: (value){
                        setState(() {
                          numberOfItem = value;
                        });
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: 50,
                      margin: const EdgeInsets.only(left: 10, right: 20),
                      child: TextButton(
                        onPressed: (){},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          'Buy Now',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}