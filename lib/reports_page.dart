import 'package:flutter/material.dart';
import 'package:latihan_responsi/api_data_source.dart';
import 'package:latihan_responsi/data/data_reports.dart';
import 'package:latihan_responsi/detail/detail_reports.dart';
import 'package:latihan_responsi/home_page.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Reports'), backgroundColor: Colors.pink[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadReports(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('ADA ERROR');
          }
          if (snapshot.hasData) {
            Reports users = Reports.fromJson(snapshot.data!);
            return ListView.builder(
              itemCount: users.results!.length,
              itemBuilder: (context, index) {
                var user = users.results![index];

                return ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailReports(users),
                      ),
                    );
                  },

                  title: Text('${user.title}'),
                  subtitle: Text('${user.summary}'),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}