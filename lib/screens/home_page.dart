import 'package:covid19/core/consts.dart';
import 'package:covid19/screens/statistic_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            padding: EdgeInsets.only(top: 25),
            child: Stack(
              children: <Widget>[
                Image.asset('assets/virus2.png'),
                _buildHeader(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: 'Шинж тэмдэг: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black87,
                        ),
                        children: [
                          TextSpan(
                            text: 'COVID 19',
                            style: TextStyle(
                              color: AppColors.mainColor,
                            ),
                          )
                        ]),
                  ),
                  Container(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            _buildSymptons('assets/1.png', 'халуурах'),
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                            ),
                            _buildSymptons('assets/2.png', 'ханиалгах'),
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                            ),
                            _buildSymptons('assets/3.png', 'толгой өвдөх'),
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                            ),
                            _buildSymptons('assets/4.png', 'цээж хорсох'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Урьдчилан сэргийлэх аргууд',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            _buildPrevetion('assets/a1.png',
                                'олон нийтийн газар\n\t\t\t\t\t\tочихгүй байх'),
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                            ),
                            _buildPrevetion('assets/a2.png', 'Гэртээ байх'),
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                            ),
                            _buildPrevetion('assets/a3.png', 'Амаа таглах'),
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                            ),
                            _buildPrevetion('assets/a4.png', 'Амаа таглах'),
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                            ),
                            _buildPrevetion(
                                'assets/a6.png', 'Чийгтэй цэвэрлэгээ хийх'),
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                            ),
                            _buildPrevetion('assets/a8.png', 'Зай барих'),
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                            ),
                            _buildPrevetion('assets/a9.png', 'Маск зүүх'),
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                            ),
                            _buildPrevetion('assets/a10.png', 'Гараа угаах'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => StatisticPage(),
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
                          'Бүртгэгдсэн тохиолдол',
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
    );
  }
}

_buildPrevetion(String image, String text) {
  return Column(
    children: <Widget>[
      Container(
        width: 150,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 2),
                spreadRadius: 1,
                blurRadius: 3,
              )
            ]),
        padding: EdgeInsets.only(top: 10),
        child: Image.asset(image),
      ),
      Text(text)
    ],
  );
}

_buildSymptons(String image, String text) {
  return Column(
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            gradient: LinearGradient(colors:
            [
              AppColors.mainColor.withOpacity(0.01),
              Colors.white,
            ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 2),
                spreadRadius: 1,
                blurRadius: 3,
              )
            ]),
        padding: EdgeInsets.only(top: 10),
        child: Image.asset(image),
      ),
      Text(text)
    ],
  );
}

Widget _buildAppbar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: null,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Icon(Icons.notifications, color: Colors.white,size: 30,),
      )
    ],
  );
}

Widget _buildHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _buildAppbar(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'COVID 19',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'Корона вирус',
          style: TextStyle(
            color: Colors.white,
            height: 1.5,
          ),
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'Вирусны тархалтыг зогсооход иргэн бүрийн оролцоо чухал',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10),),
                      Icon(Icons.call, color: Colors.white,),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
                      Text(
                        'Залгах',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  )),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: RaisedButton(
                color: Colors.red,
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10),),
                    Icon(Icons.message, color: Colors.white,),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
                    Text(
                      'Мессеж илгээх',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(50),
                )),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
