class ApiModel {
  String? iD;
  String? message;
  Global? global;
  List<Countries>? countries;
  String? date;

  ApiModel({this.iD, this.message, this.global, this.countries, this.date});

  ApiModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    message = json['Message'];
    global = json['Global'] != null ? Global.fromJson(json['Global']) : null;
    if (json['Countries'] != null) {
      countries = <Countries>[];
      json['Countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Message'] = message;
    if (global != null) {
      data['Global'] = global!.toJson();
    }
    if (countries != null) {
      data['Countries'] = countries!.map((v) => v.toJson()).toList();
    }
    data['Date'] = date;
    return data;
  }
}

class Global {
  int? newConfirmed;
  int? totalConfirmed;
  int? newDeaths;
  int? totalDeaths;
  int? newRecovered;
  int? totalRecovered;
  String? date;

  Global(
      {this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered,
      this.date});

  Global.fromJson(Map<String, dynamic> json) {
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['NewConfirmed'] = newConfirmed;
    data['TotalConfirmed'] = totalConfirmed;
    data['NewDeaths'] = newDeaths;
    data['TotalDeaths'] = totalDeaths;
    data['NewRecovered'] = newRecovered;
    data['TotalRecovered'] = totalRecovered;
    data['Date'] = date;
    return data;
  }
}

class Countries {
  String? iD;
  String? country;
  String? countryCode;
  String? slug;
  int? newConfirmed;
  int? totalConfirmed;
  int? newDeaths;
  int? totalDeaths;
  int? newRecovered;
  int? totalRecovered;
  String? date;
  Premium? premium;

  Countries(
      {this.iD,
      this.country,
      this.countryCode,
      this.slug,
      this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered,
      this.date,
      this.premium});

  Countries.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    country = json['Country'];
    countryCode = json['CountryCode'];
    slug = json['Slug'];
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
    date = json['Date'];
    premium =
        json['Premium'] != null ? Premium.fromJson(json['Premium']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Country'] = country;
    data['CountryCode'] = countryCode;
    data['Slug'] = slug;
    data['NewConfirmed'] = newConfirmed;
    data['TotalConfirmed'] = totalConfirmed;
    data['NewDeaths'] = newDeaths;
    data['TotalDeaths'] = totalDeaths;
    data['NewRecovered'] = newRecovered;
    data['TotalRecovered'] = totalRecovered;
    data['Date'] = date;
    if (premium != null) {
      data['Premium'] = premium!.toJson();
    }
    return data;
  }
}

class Premium {
  CountryStats? countryStats;

  Premium({this.countryStats});

  Premium.fromJson(Map<String, dynamic> json) {
    countryStats = json['CountryStats'] != null
        ? CountryStats.fromJson(json['CountryStats'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (countryStats != null) {
      data['CountryStats'] = countryStats!.toJson();
    }
    return data;
  }
}

class CountryStats {
  String? iD;
  String? countryISO;
  String? country;
  String? continent;
  int? population;
  double? populationDensity;
  double? medianAge;
  double? aged65Older;
  double? aged70Older;
  int? extremePoverty;
  double? gdpPerCapita;
  int? cvdDeathRate;
  double? diabetesPrevalence;
  double? handwashingFacilities;
  double? hospitalBedsPerThousand;
  double? lifeExpectancy;
  int? femaleSmokers;
  int? maleSmokers;

  CountryStats(
      {this.iD,
      this.countryISO,
      this.country,
      this.continent,
      this.population,
      this.populationDensity,
      this.medianAge,
      this.aged65Older,
      this.aged70Older,
      this.extremePoverty,
      this.gdpPerCapita,
      this.cvdDeathRate,
      this.diabetesPrevalence,
      this.handwashingFacilities,
      this.hospitalBedsPerThousand,
      this.lifeExpectancy,
      this.femaleSmokers,
      this.maleSmokers});

  CountryStats.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    countryISO = json['CountryISO'];
    country = json['Country'];
    continent = json['Continent'];
    population = json['Population'];
    populationDensity = json['PopulationDensity'];
    medianAge = json['MedianAge'];
    aged65Older = json['Aged65Older'];
    aged70Older = json['Aged70Older'];
    extremePoverty = json['ExtremePoverty'];
    gdpPerCapita = json['GdpPerCapita'];
    cvdDeathRate = json['CvdDeathRate'];
    diabetesPrevalence = json['DiabetesPrevalence'];
    handwashingFacilities = json['HandwashingFacilities'];
    hospitalBedsPerThousand = json['HospitalBedsPerThousand'];
    lifeExpectancy = json['LifeExpectancy'];
    femaleSmokers = json['FemaleSmokers'];
    maleSmokers = json['MaleSmokers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['CountryISO'] = countryISO;
    data['Country'] = country;
    data['Continent'] = continent;
    data['Population'] = population;
    data['PopulationDensity'] = populationDensity;
    data['MedianAge'] = medianAge;
    data['Aged65Older'] = aged65Older;
    data['Aged70Older'] = aged70Older;
    data['ExtremePoverty'] = extremePoverty;
    data['GdpPerCapita'] = gdpPerCapita;
    data['CvdDeathRate'] = cvdDeathRate;
    data['DiabetesPrevalence'] = diabetesPrevalence;
    data['HandwashingFacilities'] = handwashingFacilities;
    data['HospitalBedsPerThousand'] = hospitalBedsPerThousand;
    data['LifeExpectancy'] = lifeExpectancy;
    data['FemaleSmokers'] = femaleSmokers;
    data['MaleSmokers'] = maleSmokers;
    return data;
  }
}
