import 'package:fctech_inc_task/src/app/constants/constants.dart';
import 'package:fctech_inc_task/src/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeView extends View {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState(HomeController());
  }
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState(HomeController controller) : super(controller);

  @override
  Widget get view {
    EdgeInsets padding = MediaQuery.of(context).padding;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        backgroundColor: cPrimaryColor,
        title: Text('User'),
      ),
      body: Column(
        children: [Text("tamam")],
      ),
    );
  }
}
