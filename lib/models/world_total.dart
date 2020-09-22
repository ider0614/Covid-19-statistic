
class WorldTotal{
  int totalConfirmed;
  int totalDeaths;
  int totalRecovered;
  WorldTotal.fromJson(Map<String, dynamic> json){
    this.totalConfirmed = json["TotalConfirmed"];
    this.totalDeaths = json["TotalDeaths"];
    this.totalRecovered = json["TotalRecovered"];
  }



}
