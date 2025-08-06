import 'package:dit_ya/models/posts_models.dart';
import 'package:dit_ya/service/alquran_servic.dart';
import 'package:flutter/material.dart';

class ListAlquranScreen extends StatelessWidget {
  const ListAlquranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blueGrey,
      child: FutureBuilder<List<PostModel>>(
        future: PostService.listPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final dataPost = snapshot.data ?? [];
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dataPost.length,
            itemBuilder: (context, items) {
              final data = dataPost[items];
              return GestureDetector(
                // onTop:() {
                //   navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => PostDataScreen(
                //         id:data.id.toString(),
                //         titie: data.title,
                //         body: data.body,
                //         userId: data.userId.toString(),
                //       ),
                //     ),
                //   );
                // },
                child: ListTile(
                  leading: Text(data.id.toString()),
                  title: Text(data.title),
                  subtitle: Text('user Id:${data.userId}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
