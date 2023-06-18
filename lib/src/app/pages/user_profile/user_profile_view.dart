import 'package:fctech_inc_task/src/app/constants/constants.dart';
import 'package:fctech_inc_task/src/app/pages/user_profile/user_profile_controller.dart';
import 'package:fctech_inc_task/src/data/repositories/data_home_page_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../widgets/user_profile_appbar.dart';

class UserProfileView extends View {
  final String? userId;

  UserProfileView(this.userId);
  @override
  State<StatefulWidget> createState() {
    return _UserProfileViewState(
        UserProfileController(DataHomepageRepository(), userId!));
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
      appBar: MainAppBar(
        title: Text('data'),
        userId: widget.userId!,
      ),
      key: globalKey,
      body: ControlledWidgetBuilder<UserProfileController>(
          builder: (context, controller) {
        return controller.userDetail != null &&
                controller.userDetail!.id != null
            ? Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Text(
                                  'UserName : ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(controller.userDetail!.username!),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Text(
                                  'Full Name : ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(controller.userDetail!.name!),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Text(
                                  'Website : ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(controller.userDetail!.website!),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'Company',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Text(controller.userDetail!.company!.name!),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'Cath Phrase : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(controller
                                      .userDetail!.company!.catchPhrase!),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'Contract',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'Phone : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(controller.userDetail!.phone!),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'Email : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(controller.userDetail!.email!),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Address : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.7,
                                    child: Text(controller
                                            .userDetail!.address!.street! +
                                        ", " +
                                        controller.userDetail!.address!.suite! +
                                        ", " +
                                        controller.userDetail!.address!.city! +
                                        ", " +
                                        controller
                                            .userDetail!.address!.zipcode!),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator());
      }),
    );
  }
}
