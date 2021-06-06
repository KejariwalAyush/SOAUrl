import 'package:flutter/material.dart';

class KLoadingWidget extends StatelessWidget {
  const KLoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
