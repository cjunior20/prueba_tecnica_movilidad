import 'package:prueba_tecnica/src/api/cat_breeds_api.dart';
import 'package:prueba_tecnica/src/model/cat_breed_model.dart';
import 'package:rxdart/rxdart.dart';

class CatBreedsBloc {
  final _api = CatBreedsApi();

  final _catBreedsController = BehaviorSubject<List<CatBreedModel>>();
  Stream<List<CatBreedModel>> get catBreedsStream => _catBreedsController.stream;

  final _loadingController = BehaviorSubject<bool>();
  Stream<bool> get loadingStream => _loadingController.stream;

  dispose() {
    _catBreedsController.close();
    _loadingController.close();
  }

  void getCatBreeds() async {
    _loadingController.sink.add(true);
    _catBreedsController.sink.add(await _api.getCatBreeds());
    _loadingController.sink.add(false);
  }

  void searchCatBreed(String nameBreed) async {
    _loadingController.sink.add(true);
    _catBreedsController.sink.add(nameBreed.isEmpty ? await _api.getCatBreeds() : await searchCatBreedByName(nameBreed));
    _loadingController.sink.add(false);
  }

  Future<List<CatBreedModel>> searchCatBreedByName(String nameBreed) async {
    final listBreeds = await _api.getCatBreeds();
    return listBreeds.where((catBreed) {
      final nameBreedModel = catBreed.nameBreed!.toUpperCase();
      final query = nameBreed.toUpperCase();

      return nameBreedModel.contains(query);
    }).toList();
  }
}
