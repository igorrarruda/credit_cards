import 'package:flutter/material.dart';

class BackCard extends Container {
  final Color color;

  BackCard({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 10),
            blurRadius: 5,
          )
        ],
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: RotatedBox(
        quarterTurns: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              height: 40,
              color: Colors.black26,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 50),
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 15),
                color: Colors.white,
                height: 40,
                width: 180,
                child: Text(
                  "4002 442",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20),
              child: Text(
                "1234 1234 1234 1234",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: color,
                  shadows: [
                    Shadow(color: Colors.black38, offset: Offset(0, 1))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                right: 20,
              ),
              child: Text(
                "Service Hotline / 0800 223 543",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
