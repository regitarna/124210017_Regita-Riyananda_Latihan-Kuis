import 'package:flutter/material.dart';
import 'package:latihan_responsi/data/data_reports.dart';

class DetailReports extends StatelessWidget {
  final Reports user;

  DetailReports(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Reports Detail",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20, left: 50, right: 50),
          child: Card(
            child: SizedBox(
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        "${user.title ?? ""} ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Summary: ${user.summary ?? ""}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}