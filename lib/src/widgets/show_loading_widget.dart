import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowLoadingWidget extends StatelessWidget {
  const ShowLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: (Platform.isAndroid) ? const CircularProgressIndicator() : const CupertinoActivityIndicator());
  }
}
