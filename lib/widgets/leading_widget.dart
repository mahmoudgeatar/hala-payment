import 'package:flutter/material.dart';
import 'package:hala/statics/color.dart';

class LoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: purple,
      ),
    );
  }
}
