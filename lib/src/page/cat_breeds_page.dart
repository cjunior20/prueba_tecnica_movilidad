import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tecnica/src/bloc/provider_bloc.dart';
import 'package:prueba_tecnica/src/model/cat_breed_model.dart';
import 'package:prueba_tecnica/src/widgets/show_cat_breeds_widget.dart';
import 'package:prueba_tecnica/src/widgets/show_loading_widget.dart';

class CatBreedPage extends StatefulWidget {
  const CatBreedPage({Key? key}) : super(key: key);

  @override
  State<CatBreedPage> createState() => _CatBreedPageState();
}

class _CatBreedPageState extends State<CatBreedPage> {
  final _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final catBeerdBloc = ProviderBloc.catBreeds(context);
    catBeerdBloc.getCatBreeds();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CatBreeds'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(14),
              vertical: ScreenUtil().setHeight(10),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(8),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.indigo),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: _searchTextController,
              onSubmitted: (value) {
                catBeerdBloc.searchCatBreed(_searchTextController.text.trim());
              },
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    catBeerdBloc.searchCatBreed(_searchTextController.text.trim());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(10)),
          Expanded(
            child: StreamBuilder<bool>(
                stream: catBeerdBloc.loadingStream,
                builder: (_, loaddingSnapshot) {
                  if (!loaddingSnapshot.hasData) return const ShowLoadingWidget();
                  if (loaddingSnapshot.data!) return const ShowLoadingWidget();
                  return StreamBuilder<List<CatBreedModel>>(
                      stream: catBeerdBloc.catBreedsStream,
                      builder: (_, catBreedsSnapshot) {
                        if (!catBreedsSnapshot.hasData) return const ShowLoadingWidget();
                        if (catBreedsSnapshot.data!.isEmpty) return const Center(child: Text('No information avilable'));
                        return ShowCatBreedWidget(
                          catBreeds: catBreedsSnapshot.data!,
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
