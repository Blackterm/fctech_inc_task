import 'package:fctech_inc_task/src/app/constants/constants.dart';
import 'package:fctech_inc_task/src/app/pages/home/home_controller.dart';
import 'package:fctech_inc_task/src/data/repositories/data_home_page_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeView extends View {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState(HomeController(DataHomepageRepository()));
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
        body: Container(
          child: ControlledWidgetBuilder<HomeController>(
              builder: (context, controller) {
            return controller.usersList != null &&
                    controller.usersList!.length != 0
                ? ListView.builder(
                    padding: EdgeInsets.all(18),
                    itemCount: controller.usersList?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: FadeInImage(
                              image: NetworkImage(
                                  'https://randomuser.me/api/portraits/men/$index.jpg'),
                              fit: BoxFit.fill,
                              width: size.width * 0.12,
                              placeholder:
                                  AssetImage("assets/images/placeholder.png"),
                            ),
                          ),
                          title: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              controller.usersList?[index].name ?? "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Text(
                            controller.usersList?[index].company?.catchPhrase ??
                                "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Container(
                            width: size.width * 0.04,
                            height: size.height * 0.02,
                            decoration: BoxDecoration(
                                color: cPrimaryColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                              child: Text(
                                controller.usersList?[index].id.toString() ??
                                    "",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          shape: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey),
                          ),
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator());
          }),
        ));
  }
}
