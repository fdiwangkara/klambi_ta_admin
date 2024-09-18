import 'package:flutter/material.dart';

import '../helper/constants.dart';

class ChatCard extends StatelessWidget {
  final String profileImageUrl;
  final String contactName;

  const ChatCard({
    super.key,
    required this.profileImageUrl,
    required this.contactName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        border: Border(
          bottom: BorderSide(color: kLightGreyColor),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(profileImageUrl),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              contactName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
