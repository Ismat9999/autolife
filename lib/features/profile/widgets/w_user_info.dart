import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_colors.dart';

class WUserInfo extends StatelessWidget {
  final String imageUrl;
  final String fullName;
  final String email;
  final VoidCallback onEditPressed;

  const WUserInfo(
      {super.key,
      required this.imageUrl,
      required this.fullName,
      required this.email,
      required this.onEditPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            backgroundColor: AppColors.mainColor,
            backgroundImage: NetworkImage(imageUrl),
            radius: 64.0,
          ),
        ),
        Text(
          fullName,
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 20.0,
              fontFamily: Constants.exo,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              email,
              style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 14.0,
                fontFamily: Constants.exo,
              ),
              textAlign: TextAlign.center,
            ),
            IconButton(
              onPressed: onEditPressed,
              icon: const Icon(
                Icons.edit,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
