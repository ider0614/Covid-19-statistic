class AllCountry{
      String countryName;
      String countryCode;
      String slug;
      int newConfirmed;
      int totalConfirmed;
      int newDeaths;
      int totalDeaths;
      int newRecovered;
      int totalRecovered;
      DateTime date;
      AllCountry.fromJson(Map<String, dynamic> json){
        this.countryName = json["Country"];
        this.countryCode =json["CountryCode"];
        this.slug = json["Slug"];
        this.newConfirmed = json["NewConfirmed"];
        this.totalConfirmed = json["TotalConfirmed"];
        this.newDeaths = json["NewDeaths"];
        this.totalDeaths = json["TotalDeaths"];
        this.newRecovered = json["NewRecovered"];
        this.totalRecovered = json["TotalRecovered"];
        this.date = DateTime.parse(json["Date"]);

      }

}