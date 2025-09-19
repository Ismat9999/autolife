import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/post_model.dart';
import '../../blocs/search_bloc/search_bloc.dart';

Widget itemOfMember(Post post, SearchBloc searchBloc, BuildContext context) {
  return Container(
    color: Color.fromRGBO(35, 45, 75, 1),
    child: Column(
      children: [
        const Divider(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: post.img_user.isEmpty
                        ? Image(
                            image: AssetImage("assets/images/ic_person.png"),
                            width: 45,
                            height: 45,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            post.img_user,
                            width: 45,
                            height: 45,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.fullname,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        post.date,
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
              post.mine
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        //   #post image
        const SizedBox(
          height: 8,
        ),
        CachedNetworkImage(
          width: MediaQuery.of(context).size.width,
          imageUrl: post.img_post,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
}
