import 'package:flutter/material.dart';
import 'package:latihan_responsi/api_data_source.dart';
import 'package:latihan_responsi/data/data_news.dart';
import 'package:latihan_responsi/detail/detail_news.dart';
import 'package:latihan_responsi/home_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List News'), backgroundColor: Colors.pink[100],
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
        future: ApiDataSource.instance.loadNews(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('ADA ERROR');
          }
          if (snapshot.hasData) {
            News users = News.fromJson(snapshot.data!);
            return ListView.builder(
              itemCount: users.results!.length,
              itemBuilder: (context, index) {
                var user = users.results![index];

                return ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailNews(users),
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