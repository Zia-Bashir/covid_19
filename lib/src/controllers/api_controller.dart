import 'dart:convert';

import 'package:covid_19/src/models/covid_all_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  RxBool isLoading = false.obs;
  List countryList = [];

  @override
  void onReady() {
    getGlobal();
    getCountry();
    super.onReady();
    // ignore: avoid_print
    print("onready");
  }

  Future<CovidAllModel> getGlobal() async {
    try {
      isLoading.value = true;
      final response =
          await http.get(Uri.parse("https://disease.sh/v3/covid-19/all"));

      if (response.statusCode == 200) {
        isLoading.value = false;
        var data = jsonDecode(response.body);
        update();
        return CovidAllModel.fromJson(data);
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<dynamic>> getCountry() async {
    try {
      final response =
          await http.get(Uri.parse("https://disease.sh/v3/covid-19/countries"));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        update();
        return data;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
