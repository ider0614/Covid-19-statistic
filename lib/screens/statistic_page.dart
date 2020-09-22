

import 'package:covid19/bloc/main_bloc.dart';
import 'package:covid19/core/consts.dart';
import 'package:covid19/models/all_country.dart';
import 'package:covid19/models/world_total.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'abstract_screen.dart';

class StatisticPage extends AbstractScreen<MainBloc, _StatisticPageState> {
  @override
  _StatisticPageState builder() => _StatisticPageState();
}
class _StatisticPageState extends AbstractScreenState {
  String searchValueByCountryName;
  @override
  Widget stateBuilder() {
    return Scaffold(
      body: Column(
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
                Image.asset('assets/virus.png'),
                StreamBuilder<WorldTotal>(
                    stream: bloc.covidDataStream,
                    builder: (_, snapshot) {
                      if (snapshot.data == null)
                        return Container(
                            child: Text('NO DATA'));
                        return _buildHeader(snapshot.data);
                    }),
              ],
            ),
          ),
          StreamBuilder<List<AllCountry>>(
              stream: bloc.covidCountryStream,
              builder: (_, snapshot) {
                if (snapshot.data == null)
                  return Container(child: Text('No Country'));
                return Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: _buildList(snapshot.data),
                  ),
                );
              })
        ],
      ),
    );
  }
  Column _buildList(List<AllCountry> countries) {
    List<Container> list = [];
    countries.forEach((country) {
      String a = country.countryCode;
      //countries.where((country) => country.countryName.toLowerCase().startsWith((searchValueByCountryName??"").toLowerCase())).forEach((country) {
      list.add(
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.deepPurple, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(
                      'https://www.countryflags.io/${a}/flat/64.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: <Widget>[
                      Text('Халдварласан'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${country.totalConfirmed}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: <Widget>[
                      Text('Эдгэрсэн'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${country.totalRecovered}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: <Widget>[
                      Text('Нас барсан'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${country.totalDeaths}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: <Widget>[
        Expanded(
            child: SizedBox(
              height: 100,
              child: ListView(
            children: list,
          ),
        )),
      ],
    );
  }
  Widget _buildAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 50,
          height: 35,
          margin: EdgeInsets.all(16),
        ),
      ],
    );
  }
  Widget _buildHeader(WorldTotal data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildAppbar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'СТАТИСТИК',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(color: Colors.white),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ]),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  _buildStatisticItem(
                      Colors.blue, 'Бүртгэгдсэн', data.totalConfirmed),
                  SizedBox(
                    height: 5,
                  ),
                  _buildStatisticItem(
                      Colors.green, 'Эдгэрсэн', data.totalRecovered),
                  SizedBox(
                    height: 5,
                  ),
                  _buildStatisticItem(
                      Colors.red, 'Нас барсан', data.totalDeaths),
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 6,
                  ),
                  child: Row(
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: bloc.sortByTotalConfirmed,
                                child: Text("Бүртгэгдсэн тоогоор\n эрэмбэлэх"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: GestureDetector(
                                onTap: bloc.sortByTotalRecovered,
                                child: Text("Эдгэрсэн тоогоор\n эрэмбэлэх"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: bloc.sortByTotalDeath,
                                child: Text("Нас барсан тоогоор\n эрэмбэлэх"),
                              ),
                            )
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
        Container(
          height: 50,
          width: double.infinity,
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(16),
                hintText: 'Улсын нэрээр хайх'),
            onChanged: bloc.searchByCountryName,
            //onChanged: (valueToSearch) => setState(() => searchValueByCountryName = valueToSearch),
          ),
        ),
      ],
    );
  }

  _buildStatisticItem(Color color, String title, int counter) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.label, size: 20, color: color),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.black38,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('$counter'),
          ],
        )
      ],
    );
  }
  @override
  blocBuilder() => MainBloc();
}
