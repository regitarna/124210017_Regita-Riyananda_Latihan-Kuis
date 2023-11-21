import 'package:flutter/material.dart';
import 'package:latihan_responsi/api_data_source.dart';
import 'package:latihan_responsi/data/data_blogs.dart';
import 'package:latihan_responsi/detail/detail_blogs.dart';
import 'package:latihan_responsi/home_page.dart';

class BlogsPage extends StatelessWidget {
  const BlogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Blogs'), backgroundColor: Colors.pink[100],
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
        future: ApiDataSource.instance.loadBlogs(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('ADA ERROR');
          }
          if (snapshot.hasData) {
            Blogs users = Blogs.fromJson(snapshot.data!);
            return ListView.builder(
              itemCount: users.results!.length,
              itemBuilder: (context, index) {
                var user = users.results![index];

                return ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailBlogs(user as Blogs),
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