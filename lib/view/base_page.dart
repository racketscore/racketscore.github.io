import 'package:flutter/material.dart';

import '../presentation/utils.dart';

abstract class BasePage extends StatefulWidget {}

abstract class BasePageState<T extends StatefulWidget> extends State<T>
    with TickerProviderStateMixin {
  late ScreenOrientation screenOrientation;
  double currentWidth = 0;
  bool isMobile = false;
  bool isDesktop = false;
  bool _isPageInitialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentWidth = MediaQuery.of(context).size.width;
    isMobile = currentWidth < 650;
    isDesktop = currentWidth > 940;
    screenOrientation = Utils.getScreenOrientation(context);
    if(!_isPageInitialized) {
      loadData();
    }
    _isPageInitialized = true;
  }

  void loadData() {}

  showSnackBar(String text, context) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Color(0xffb74093),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

/* final SleekCircularSlider loadingWidget = SleekCircularSlider(
    onChangeStart: (double value) {},
    onChangeEnd: (double value) {},
    appearance: CircularSliderAppearance(
        customWidths: CustomSliderWidths(trackWidth: 2, progressBarWidth: 8, shadowWidth: 16),
        customColors:  CustomSliderColors(
            dotColor: Colors.white.withOpacity(0.1),
            trackColor: Color(0xffFF6AA0).withOpacity(0.2),
            progressBarColors: [
              Color(0xffFFE855),
              Color(0xffFF6AA0),

            ],
            shadowColor:  Color(0xffFFE855),
            shadowMaxOpacity: 0.05),
        startAngle: 180,
        angleRange: 360,
        size: 130.0,
        spinnerMode: true),
    min: 0,
    max: 100,
    initialValue: 50.0,
  );*/
}
