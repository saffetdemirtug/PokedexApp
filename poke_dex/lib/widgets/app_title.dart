import 'package:flutter/material.dart';

import 'package:poke_dex/constants/constants.dart';
import 'package:poke_dex/constants/ui_hepler.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    String pokeballPath = "images/pokeball.png";

    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding:  UIHelper.getDefaultPadding(),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Constants.title,
                  style: Constants.getTitleTextStyle(),
                )),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                pokeballPath,
                width: UIHelper.getPokeBallWidth(),
                fit: BoxFit.fitWidth,
              ))
        ],
      ),
    );
  }
}
