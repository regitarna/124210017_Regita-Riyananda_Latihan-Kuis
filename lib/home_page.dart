import 'package:flutter/material.dart';
import 'package:latihan_responsi/blogs_page.dart';
import 'package:latihan_responsi/news_page.dart';
import 'package:latihan_responsi/reports_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPACE FLIGHT NEWS'),
        centerTitle: true,
        backgroundColor: Colors.pink[100],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildMenuCard(
            image: 'assets/news.jpg',
            title: 'NEWS',
            subtitle:
                'Get an overview of the latest Spaceflight news, from various sources! Easily link your user to the right websites',
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => NewsPage(),
                ),
              );
            },
          ),
          buildMenuCard(
            image: 'assets/blogs.jpg',
            title: 'BLOGS',
            subtitle:
                'Vlog often provide a ore detiled overview of launches and missions. A must-have for the serious spaceflight enthusiast',
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => BlogsPage(),
                ),
              );
            },
          ),
          buildMenuCard(
            image: 'assets/reports.jpg',
            title: 'REPORTS',
            subtitle:
                'Space stations and other missions often publish tjeir data. With SNAPI, you can include it in your app as well',
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => ReportsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildMenuCard({
    required String image,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Image.asset(
                image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Container(
                  alignment: Alignment.center,
                  child: Text(title),
                ),
                subtitle: Container(
                  alignment: Alignment.center,
                  child: Text(subtitle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
