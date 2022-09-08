import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tecnica/src/model/cat_breed_model.dart';
import 'package:prueba_tecnica/src/widgets/detail_cat_widget.dart';
import 'package:prueba_tecnica/src/widgets/show_loading_widget.dart';

class DetailCatBreedPage extends StatelessWidget {
  const DetailCatBreedPage({Key? key, required this.catBreed}) : super(key: key);
  final CatBreedModel catBreed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(catBreed.nameBreed!),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16), vertical: ScreenUtil().setHeight(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height.round() * 0.5,
                width: MediaQuery.of(context).size.width.round() * 1,
                margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                child: CachedNetworkImage(
                  placeholder: (context, url) => const ShowLoadingWidget(),
                  errorWidget: (context, url, error) => Image.asset('assets/svg/cat.svg'),
                  imageUrl: '${catBreed.urlImageBreed}',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Expanded(child: DetailCatBreedWidget(catBreed: catBreed)),
          ],
        ),
      ),
    );
  }
}
