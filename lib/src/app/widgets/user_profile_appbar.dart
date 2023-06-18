import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final String userId;
  MainAppBar({required this.title, required this.userId});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 150.0);

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        PreferredSize(
            child: ClipPath(
              clipper: WaveClip(),
              child: Container(
                padding: EdgeInsets.only(top: padding.top, left: 10),
                alignment: Alignment.topLeft,
                color: cPrimaryColor2,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_sharp),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight + 100)),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: FadeInImage(
                    image: NetworkImage(
                        'https://randomuser.me/api/portraits/men/$userId.jpg'),
                    fit: BoxFit.fill,
                    width: size.width * 0.24,
                    placeholder: AssetImage("assets/images/placeholder.png"),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 1,
                  child: CircleAvatar(
                    backgroundColor: cPrimaryColor,
                    radius: 12,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    Path path = new Path();

    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
