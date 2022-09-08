import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tecnica/src/model/cat_breed_model.dart';
import 'package:prueba_tecnica/src/page/detail_cat_breed_page.dart';
import 'package:prueba_tecnica/src/widgets/show_loading_widget.dart';

class ShowCatBreedWidget extends StatelessWidget {
  const ShowCatBreedWidget({Key? key, required this.catBreeds}) : super(key: key);
  final List<CatBreedModel> catBreeds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catBreeds.length,
      itemBuilder: (_, index) {
        return itemCatBreed(context, catBreeds[index]);
      },
    );
  }

  Widget itemCatBreed(BuildContext context, CatBreedModel beerdModel) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10), vertical: ScreenUtil().setHeight(6)),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.transparent.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                beerdModel.nameBreed!,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(16),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return DetailCatBreedPage(
                            catBreed: beerdModel,
                          );
                        },
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          var begin = const Offset(0.0, 1.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end).chain(
                            CurveTween(curve: curve),
                          );

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: const Text('Más...')),
            ],
          ),
          Container(
            height: ScreenUtil().setHeight(beerdModel.heightImageBreed! * 0.1),
            width: ScreenUtil().setHeight(beerdModel.widthImageBreed! * 0.1),
            margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: CachedNetworkImage(
              placeholder: (context, url) => const ShowLoadingWidget(),
              errorWidget: (context, url, error) => Image.asset('assets/svg/cat.svg'),
              imageUrl: '${beerdModel.urlImageBreed}',
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                beerdModel.originBreed ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(100),
                child: Text(
                  beerdModel.temperamentBreed ?? '',
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: ScreenUtil().setSp(14),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
