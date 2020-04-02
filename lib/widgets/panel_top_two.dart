import 'package:credit_card/controllers/my_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanelTopTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyAppController>(
      builder: (BuildContext context, MyAppController notifier, Widget child) {
        double progress =
            Provider.of<MyAppController>(context, listen: false).sheetState !=
                    null
                ? Provider.of<MyAppController>(context, listen: false)
                    .sheetState
                    .progress
                : 0.0;
        return AnimatedOpacity(
          duration: Duration(milliseconds: 100),
          opacity: progress > 0.2 ? 0 : 1,
          child: AnimatedPadding(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInCubic,
            padding: EdgeInsetsDirectional.only(
                top: notifier.currentIndex == -1 ? 20 : 0),
            child: AnimatedOpacity(
              opacity: notifier.currentIndex == -1 ? 0 : 1,
              duration: Duration(milliseconds: 300),
              child: Container(
                width: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Full Card',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 14),
                      AnimatedPadding(
                        duration: Duration(milliseconds: 500),
                        padding: EdgeInsetsDirectional.only(
                            top: notifier.currentIndex == -1 ? 30 : 0),
                        child: Text(
                          'Rotate the card to view the security code',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
