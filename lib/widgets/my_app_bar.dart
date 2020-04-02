import 'package:credit_card/controllers/my_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12 +
          MediaQuery.of(context).padding.top,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Provider.of<MyAppController>(context, listen: false)
                    .setCurrentIndex(-1);
              },
            ),
            Consumer<MyAppController>(
              builder: (context, value, child) {
                return AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: value.currentIndex != -1 ? 1 : 0,
                  child: child,
                );
              },
              child: IconButton(
                icon: Icon(Icons.check_circle_outline),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
