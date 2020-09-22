import 'package:covid19/core/consts.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.mainColor,
          AppColors.mainColor.withOpacity(0.1),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/logo.png')),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Image.asset('assets/virus.png')),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .25,
            right: 25,
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              child: Image.asset('assets/person.png'),
            ),
          ),
          Positioned(
            bottom: 50,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Корона вирус(COVID-19)',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'шинэ төрлийн корона вирусээс хамтдаа\nсэргийлье',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => Home(),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(1, 1),
                            spreadRadius: 1,
                            blurRadius: 10,
                          )
                        ],
                      ),
                      width: MediaQuery.of(context).size.width * .85,
                      height: 60,
                      child: Center(
                        child: Text(
                          'Эхлэх',
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
