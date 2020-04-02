import 'package:credit_card/controllers/my_app_controller.dart';
import 'package:credit_card/widgets/item_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CredCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController _pageController =
        PageController(viewportFraction: 0.7);
    return Consumer<MyAppController>(
      builder: (BuildContext context, MyAppController value, Widget child) {
        return Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.08 +
                  MediaQuery.of(context).padding.top),
          child: PageView(
            physics: Provider.of<MyAppController>(context, listen: false)
                        .currentIndex ==
                    -1
                ? BouncingScrollPhysics()
                : NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              Provider.of<MyAppController>(context, listen: false)
                  .setPageIndex(index);
            },
            controller: _pageController,
            children: <Widget>[
              ItemPage(
                index: 0,
                color: Colors.purple[300],
                operatorImage: 'assets/images/MasterCard-Logo.png',
                backgroundImage: 'assets/images/background-card-1.jpg',
              ),
              ItemPage(
                index: 1,
                color: Colors.blue[300],
                operatorImage: 'assets/images/Visa_logo.png',
                backgroundImage: 'assets/images/background-card-2.jpg',
              ),
              ItemPage(
                index: 2,
                color: Colors.grey[800],
                operatorImage: 'assets/images/MasterCard-Logo.png',
                backgroundImage: 'assets/images/background-card-3.jpg',
              ),
            ],
          ),
        );
      },
    );
  }
}
