import 'dart:async';

import 'package:covid19/bloc/abstract_bloc.dart';
import 'package:covid19/models/all_country.dart';
import 'package:covid19/models/world_total.dart';
import 'package:covid19/service/world_service.dart';

class MainBloc extends AbstractBloc {
  StreamController<WorldTotal> worldTotalStreamControllor;
  StreamController<List<AllCountry>> countriesStreamControllor;
  WorldService _service;
  List<AllCountry> countries;

  MainBloc() {
    worldTotalStreamControllor = StreamController.broadcast();
    countriesStreamControllor = StreamController.broadcast();
    _service = WorldService();
    _fetchData();
    _fetchDataCountries();
  }

  void _fetchData() {
    _service
        .fetchCases()
        .then((covidData) => worldTotalStreamControllor.add(covidData));
  }

  get covidDataStream => worldTotalStreamControllor.stream;

  void _fetchDataCountries() {
    _service.fetchCountry().then((countries) {
      this.countries = countries;
      countriesStreamControllor.add(countries);
    });
  }

  get covidCountryStream => countriesStreamControllor.stream;

  void searchByCountryName(String searchValue) {
    if (searchValue == null || searchValue.isEmpty)
      countriesStreamControllor.add(countries);
    else {
      List<AllCountry> filteredContries = countries
          .where((country) => country.countryName
              .toLowerCase()
              .contains(searchValue.toLowerCase()))
          .toList();
      countriesStreamControllor.add(filteredContries);
    }
  }

  void sortByTotalConfirmed() {
    countries.sort((a, b) => b.totalConfirmed.compareTo(a.totalConfirmed));
    countriesStreamControllor.add(countries);
  }

  void sortByTotalRecovered() {
    countries.sort((a, b) => b.totalRecovered.compareTo(a.totalRecovered));
    countriesStreamControllor.add(countries);
  }

  void sortByTotalDeath() {
    countries.sort((a, b) => b.totalDeaths.compareTo(a.totalDeaths));
    countriesStreamControllor.add(countries);
  }
}
