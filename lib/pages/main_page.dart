import 'package:flutter/material.dart';
import 'package:weather_forecast/pages/Dashboard/widgets/left_panel.dart';
import 'package:weather_forecast/pages/Dashboard/widgets/navbar.dart';
import 'package:weather_forecast/pages/Dashboard/widgets/right_panel.dart';
import 'package:weather_forecast/utilities/responsive.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: NavberApp(),
        ),
        body: Responsive(
          mobile: Row(
            children: [
              Expanded(flex: 1, child: LeftPanel()),
              Expanded(flex: 3, child: RightPanel()),
            ],
          ),
          tablet: Row(
            children: [
              Expanded(flex: 3, child: LeftPanel()),
              Expanded(flex: 7, child: RightPanel()),
            ],
          ),
          destop: Row(
            children: [
              Expanded(flex: _size.width > 1340 ? 3 : 4, child: LeftPanel()),
              Expanded(flex: _size.width > 1340 ? 7 : 6, child: RightPanel()),
            ],
          ),
        ));
  }
}
