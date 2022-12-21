import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_modern_and_vintage/pages/home.dart';
import 'package:the_modern_and_vintage/pages/image_view.dart';
import 'package:the_modern_and_vintage/pages/login.dart';
import 'package:the_modern_and_vintage/pages/product.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Modern & Vintage',
      theme: ThemeData(                                                                        
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(),
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/product': (context) => const Product(),
        '/imageView':(context) => const ImageView(url: ''),
      },
    );
  }
}
