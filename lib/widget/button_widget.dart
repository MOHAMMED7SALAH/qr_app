import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  String lottie;

  ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.lottie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onClicked,
      child: Container(
        height: size.height * 0.2 ,
        width: size.width ,
        child: Column(
          children: [
            Container(
              height: size.height * 0.15 ,
        width: size.width * 0.8,
        child: Lottie.asset(
                lottie,
                
                height: size.height ,
                width: size.width,
                repeat: true,
                reverse: true,
                animate: true,
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),) ,
            
          ],
        ),
      ),
    );
  }
}
