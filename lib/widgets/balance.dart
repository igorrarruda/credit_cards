import 'package:credit_card/controllers/my_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Balance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyAppController>(
      builder: (BuildContext context, MyAppController notifier, Widget child) {
        return AnimatedOpacity(
          opacity: notifier.currentIndex != -1 ? 0 : 1,
          duration: Duration(milliseconds: 300),
          child: child,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          top: MediaQuery.of(context).size.height * 0.23 +
              MediaQuery.of(context).padding.top,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Balance",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "\$22890.00",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
