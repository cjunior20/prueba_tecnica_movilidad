import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tecnica/core/util/constants.dart';
import 'package:prueba_tecnica/core/util/router.dart';
import 'package:prueba_tecnica/src/bloc/provider_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderBloc(
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 812),
        builder: (BuildContext context, c) => MaterialApp(
          title: 'CatBreeds',
          debugShowCheckedModeBanner: false,
          builder: (BuildContext context, Widget? child) {
            final MediaQueryData data = MediaQuery.of(context);
            ScreenUtil.init(context);
            return MediaQuery(
              data: data.copyWith(textScaleFactor: data.textScaleFactor > 2.0 ? 1.2 : data.textScaleFactor),
              child: child!,
            );
          },
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            scaffoldBackgroundColor: const Color(0xFFF2F7F5),
            canvasColor: Colors.transparent,
          ),
          onGenerateRoute: Routers.generateRoute,
          initialRoute: SPLASH_ROUTE,
        ),
      ),
    );
  }
}
