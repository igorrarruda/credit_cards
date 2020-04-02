import 'package:credit_card/controllers/my_app_controller.dart';
import 'package:credit_card/widgets/balance.dart';
import 'package:credit_card/widgets/balance_details.dart';
import 'package:credit_card/widgets/cred_card.dart';
import 'package:credit_card/widgets/my_app_bar.dart';
import 'package:credit_card/widgets/panel_top.dart';
import 'package:credit_card/widgets/panel_top_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<MyAppController>(context, listen: false).hideSheet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MyAppBar(),
          PanelTop(),
          PanelTopTwo(),
          Balance(),
          CredCard(),
          BalanceDetails(),
        ],
      ),
    );
  }
}
