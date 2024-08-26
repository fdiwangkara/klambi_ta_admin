import 'package:flutter/material.dart';

import '../helper/constants.dart';

class ChatCard extends StatelessWidget {
  final String profileImageUrl;
  final String contactName;
  final String latestMessage;
  final String messageTime;

  const ChatCard({
    super.key,
    required this.profileImageUrl,
    required this.contactName,
    required this.latestMessage,
    required this.messageTime,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contactName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  latestMessage,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                messageTime,
                style: TextStyle(
                  fontSize: 12,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
