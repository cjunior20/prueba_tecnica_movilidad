import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prueba_tecnica/core/util/constants.dart';
import 'package:prueba_tecnica/src/bloc/provider_bloc.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      final catBreeds = ProviderBloc.catBreeds(context);
      catBreeds.getCatBreeds();
      Navigator.pushNamedAndRemoveUntil(context, CAT_BREEDS, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'CatBreeds',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.indigo,
              fontSize: ScreenUtil().setSp(30),
            ),
          ),
          Center(
            child: SizedBox(
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(300),
              child: SvgPicture.asset(
                'assets/svg/cat.svg',
                color: Colors.indigo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
