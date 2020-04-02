import 'package:flutter/material.dart';

class FrontCard extends Container {
  final String backgroundImage;
  final Color color;
  final String operatorImage;

  FrontCard({
    Key key,
    this.backgroundImage,
    this.color,
    this.operatorImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            RotatedBox(
              quarterTurns: 1,
              child: Image.asset(
                backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Credit Card",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.asset(
                          'assets/images/white-signal.png',
                          width: 45,
                          height: 45,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/sim-card-chip.png',
                          width: 70,
                          height: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 7.0),
                          child: Text(
                            "1234 1234 1234 1234",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "CARD HOLDER",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "Dimest",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          operatorImage,
                          width: 60,
                          height: 60,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 10),
            blurRadius: 5,
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
