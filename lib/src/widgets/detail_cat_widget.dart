import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tecnica/src/model/cat_breed_model.dart';

class DetailCatBreedWidget extends StatelessWidget {
  const DetailCatBreedWidget({Key? key, required this.catBreed}) : super(key: key);
  final CatBreedModel catBreed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Origin: ${catBreed.originBreed ?? ''}',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(8)),
          Text(
            catBreed.temperamentBreed ?? '',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(8)),
          Text(
            'Life span: ${catBreed.lifeSpanBreed ?? ''} years',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(8)),
          Text(
            'Weight Imperial: ${catBreed.weightImperialBreed ?? ''} Pound',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(8)),
          Text(
            'Weight Metric: ${catBreed.weightMetricBreed ?? ''} Kilogram',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(8)),
          Text(
            catBreed.descriptionBreed ?? '',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        ],
      ),
    );
  }
}
