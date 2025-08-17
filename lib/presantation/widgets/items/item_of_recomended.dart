import 'package:flutter/material.dart';

Widget itemOfRecomended(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        const Divider(),
        //   # user_info
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage("assets/images/ic_person.png"),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      )
                      //     : Image.network(
                      //   post.img_user,
                      //   width: 40,
                      //   height: 40,
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Carvon Benzin Shaxobchasi",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "12:43 pm",
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  // feedBloc.dialogRemovePost(context, post);
                },
                icon: const Icon(Icons.more_horiz),
              )
            ],
          ),
        ),
        //   #post image
        const SizedBox(
          height: 8,
        ),
        // CachedNetworkImage(
        //   width: MediaQuery.of(context).size.width,
        //   imageUrl: post.img_post,
        //   fit: BoxFit.cover,
        // ),

        //   #like_share
        Row(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    // IconButton(
                    //   onPressed: () {
                    //     // if (!post.liked) {
                    //     //   context
                    //     //       .read<LikePostBloc>()
                    //     //       .add(LikesPostEvent(post: post));
                    //     // } else {
                    //     //   context
                    //     //       .read<LikePostBloc>()
                    //     //       .add(UnLikesPostEvent(post: post));
                    //     // }
                    //   },
                    //   icon: BlocBuilder<LikePostBloc, LikeState>(
                    //       builder: (context, state) {
                    //     return post.liked
                    //         ? const Icon(
                    //             EvaIcons.heart,
                    //             color: Colors.red,
                    //           )
                    //         : const Icon(
                    //             EvaIcons.heartOutline,
                    //             color: Colors.black,
                    //           );
                    //   }),
                    // ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(
                    //     EvaIcons.shareOutline,
                    //     color: Colors.black,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
        //   #caption
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Text(
            "Benzin narxlari",
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
