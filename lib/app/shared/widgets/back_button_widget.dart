import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_challenge_20210610/app/shared/widgets/icon_button_widget.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButtonWidget(
      onPressed: () {
        Modular.to.pop();
      },
      icon: CupertinoIcons.back,
      color: Colors.blue,
    );
  }
}
