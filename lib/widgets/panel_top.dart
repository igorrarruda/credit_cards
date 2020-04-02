import 'package:credit_card/controllers/my_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanelTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyAppController>(
      builder: (BuildContext context, MyAppController notifier, Widget child) {
        return AnimatedOpacity(
          opacity: notifier.currentIndex != -1 ? 0 : 1,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInCubic,
          child: child,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          top: MediaQuery.of(context).size.height * 0.1 +
              MediaQuery.of(context).padding.top,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Bank Cards',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://sguru.org/wp-content/uploads/2017/06/cool-anime-profile-pictures-50422.jpg"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
