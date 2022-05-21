
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner_example/page/home.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2,   microseconds: 67), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Home(
            title: 'QR Code',
          ))); 
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: 
          Container(
            color: Colors.white,
            
            
            child: Lottie.asset(
              'assets/qr.json',
              height: size.height ,
              width: size.width,
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ),
          
        
      
    );
  }
}
