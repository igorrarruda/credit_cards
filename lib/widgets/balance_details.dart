import 'package:credit_card/controllers/my_app_controller.dart';
import 'package:credit_card/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class BalanceDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyAppController>(
      builder: (context, value, child) {
        return SlidingSheet(
          elevation: 8,
          cornerRadius: 16,
          color: ThemeData.dark().primaryColor,
          controller: Provider.of<MyAppController>(context, listen: false)
              .sheetController,
          listener: (state) {
            Provider.of<MyAppController>(context, listen: false)
                .setState(state);
          },
          snapSpec: SnapSpec(
            snap: true,
            snappings: [0.2, 0.6, 0.885],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          builder: (context, state) {
            return Material(
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height * 0.1,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Today',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          ItemList(
                            title: "Transfer info",
                            subTitle: "Enya",
                            value: "+\$ 2000.00",
                            color: Colors.red,
                            icon: Icon(Icons.send),
                          ),
                          ItemList(
                            title: "Nike",
                            subTitle: "Shoes",
                            value: "-\$ 145.50",
                            color: Colors.yellow,
                            icon: Icon(Icons.shopping_basket),
                          ),
                          ItemList(
                            title: "Apple Music",
                            subTitle: "Entretaniment",
                            value: "-\$ 100.00",
                            color: Colors.grey,
                            icon: Icon(Icons.music_note),
                          ),
                          ItemList(
                            title: "Transfer info",
                            subTitle: "Enya",
                            value: "+\$ 2000.00",
                            color: Colors.red,
                            icon: Icon(Icons.send),
                          ),
                          ItemList(
                            title: "Nike",
                            subTitle: "Shoes",
                            value: "-\$ 145.50",
                            color: Colors.yellow,
                            icon: Icon(Icons.shopping_basket),
                          ),
                          ItemList(
                            title: "Apple Music",
                            subTitle: "Entretaniment",
                            value: "-\$ 100.00",
                            color: Colors.grey,
                            icon: Icon(Icons.music_note),
                          ),
                          ItemList(
                            title: "Transfer info",
                            subTitle: "Enya",
                            value: "+\$ 2000.00",
                            color: Colors.red,
                            icon: Icon(Icons.send),
                          ),
                          ItemList(
                            title: "Nike",
                            subTitle: "Shoes",
                            value: "-\$ 145.50",
                            color: Colors.yellow,
                            icon: Icon(Icons.shopping_basket),
                          ),
                          ItemList(
                            title: "Apple Music",
                            subTitle: "Entretaniment",
                            value: "-\$ 100.00",
                            color: Colors.grey,
                            icon: Icon(Icons.music_note),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
