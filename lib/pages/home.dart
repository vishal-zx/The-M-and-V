import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffdcda),
      appBar: AppBar(
        elevation: 2,
        toolbarOpacity: 1.0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'The Modern & Vintage',
            style: GoogleFonts.handlee(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: const Color(0xFFffdcda),
      ),
      body: Container(
        margin: const EdgeInsets.only(top:10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.81,
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/product');
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 155,
                          width: double.maxFinite,
                          child: Image.asset(
                            'assets/images/art.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 5,
                          child:Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(5),
                            // width: 45,
                            child: Text(
                              '₹ 199',
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        'Purple soft something something very little',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black,
                        )
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}