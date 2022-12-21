import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';

  Future<void> getDetails()async{
    DocumentSnapshot qsP = await FirebaseFirestore.instance.collection('test').doc('newTest').get();
    var data = qsP.data() as Map<String, dynamic>;
    setState(() {
      username = data['testt'];
    });
  }

  String email = '';

  Future<String> signup(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    String _googleEmail = googleUser!.email;
    if(googleUser!=null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;
      if(user!=null) {
         // go to home screen
         print("jbfjbe");
         setState(() {
           email = user.providerData[0].email!;
         });
      }
    }
    return email;
  }

  // Future<User> signInWithGoogle() async {
  //   GoogleSignIn _googleSignIn = GoogleSignIn();
  //   GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
  //   String _googleUserEmail = _googleUser.email; //BURADA GMAİL OTURUMUNDAN
  //   // DİREKT OLARAK MAİL ADRESİNİ ALMAYA ÇALIŞIYORUM.
  //   if (_googleUser != null) {
  //     GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
  //     if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
  //       AuthResult sonuc = await _firebaseAuth.signInWithCredential(
  //           GoogleAuthProvider.getCredential(
  //               idToken: _googleAuth.idToken,
  //               accessToken: _googleAuth.accessToken));
  //       FirebaseUser _user = sonuc.user;
  //       sonuc.user.updateEmail(_googleUserEmail);
  //       //Burada Email Adresini Güncelliyoruz.
  //       //Böylece null olan değer doluyor.
  //       return _userFromFirebase(_user);
  //     } else {
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFffdcda),
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  left: 0,
                  bottom: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/art.png',
                        height: 350,
                        width: 250,
                      ),
                      const SizedBox(
                        height: 25
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height:7,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1.5, color: Colors.black)
                              )
                            ),
                            child: const Text(""),
                          ),
                          Text(
                            "The Modern & Vintage",
                            style: GoogleFonts.dancingScript(
                              fontSize: 31,
                              backgroundColor: const Color(0xFFffdcda),
                            )
                          ),
                        ]
                      ),
                    ]
                  )
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Text(
                            "The M&V",
                            style: GoogleFonts.lora(
                              color: Colors.black,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              letterSpacing: 2.58
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(top: 20, right: 40),
                          child: Text(
                            "- Welcome to a new world of ",
                            style: GoogleFonts.lora(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(right: 40),
                          child: Text(
                            "experiences ...",
                            style: GoogleFonts.lora(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom:20),
                          child: Text(
                            "Sign in now to Get Started",
                            style: GoogleFonts.handlee(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.5)
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          width: 240,
                          height: 48,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                            onPressed: ()async{
                              // await signup(context);
                              // await getDetails();
                              Navigator.pushNamed(context, '/home');
                            },
                            child: Text(
                              "Sign In With Google",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}