import 'package:flutter/material.dart';

import '../controllers/like_unlike_controller.dart';

class LikeUnlikeView extends StatefulWidget {
  const LikeUnlikeView({super.key});

  @override
  State<LikeUnlikeView> createState() => _LikeUnlikeViewState();
}

class _LikeUnlikeViewState extends State<LikeUnlikeView> {

  LikeUnlikeController likeUnlikeController = LikeUnlikeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Like Unlike'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: likeUnlikeController.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(likeUnlikeController.users[index]['name']),
                    trailing: IconButton(onPressed: () {
                      setState(() {
                        likeUnlikeController.favouriteUser(!likeUnlikeController.users[index]['isFav'], likeUnlikeController.users[index]['name']);
                      });
                    }, icon: likeUnlikeController.users[index]['isFav']?Icon(Icons.favorite):Icon(Icons.favorite_border)),
                  );
              },),
            )
          ],
        ),
      ),
    );
  }
}
