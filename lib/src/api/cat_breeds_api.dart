import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_tecnica/src/model/cat_breed_model.dart';

class CatBreedsApi {
  Future<List<CatBreedModel>> getCatBreeds() async {
    List<CatBreedModel> catBreedList = [];
    try {
      const url = 'https://api.thecatapi.com/v1/breeds';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        for (var i = 0; i < data.length; i++) {
          catBreedList.add(CatBreedModel.fromJson(data[i]));
        }

        // List<CatBreedModel> catBreedList = <CatBreedModel>[
        //   ...(data as List<dynamic>)
        //       .map(
        //         (dynamic value) => CatBreedModel.fromJson(value as Map<String, dynamic>),
        //       )
        //       .toList()
        // ];
        // print(catBreedList);

        return catBreedList;
      } else {
        return catBreedList;
      }
    } catch (e) {
      return catBreedList;
    }
  }
}
