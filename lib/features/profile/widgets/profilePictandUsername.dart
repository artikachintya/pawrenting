import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class Profilepictandusername extends StatelessWidget {
  const Profilepictandusername(
      {super.key, this.profilePicture, this.name, this.username});

  final String? username;
  final String? name;
  final MemoryImage? profilePicture;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // Background profile pic
            Container(
              width: 120,
              height: 120,
              margin: const EdgeInsets.fromLTRB(0, 45, 0, 10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: TColors.gray,
              ),
            ),
            // Profile pic
            Positioned(
              top: 50,
              right: 1,
              left: 1,
              child: profilePicture != null
                  ? Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: profilePicture!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ) // Use `profilePicture` directly
                  : Container(
                      width: 110,
                      height: 110,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: TColors.gray,
                        image: DecorationImage(
                          image: AssetImage(TImages.userProfilePic),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
          ],
        ),
        // Name (optional)
        if (name != null)
          Center(
            child: Text(
              name!,
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Albert Sans',
                  fontWeight: FontWeight.bold),
            ),
          ),
        // Username (optional)
        if (username != null)
          Center(
            child: Text(
              username!,
              style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Albert Sans',
                  fontWeight: FontWeight.bold,
                  color: TColors.grayFont),
            ),
          ),
      ],
    );
  }
}
