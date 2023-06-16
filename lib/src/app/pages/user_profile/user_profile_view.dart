import 'package:fctech_inc_task/src/app/pages/user_profile/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UserProfileView extends View {
  @override
  State<StatefulWidget> createState() {
    return _UserProfileViewState(UserProfileController());
  }
}

class _UserProfileViewState
    extends ViewState<UserProfileView, UserProfileController> {
  _UserProfileViewState(UserProfileController controller) : super(controller);

  @override
  Widget get view {
    EdgeInsets padding = MediaQuery.of(context).padding;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      body: Column(
        children: [Text("Okey")],
      ),
    );
  }
}
