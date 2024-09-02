import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/chat_card.dart';
import '../chat_controller.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.put(ChatController());

    return Obx(() {
      if (chatController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (chatController.userList.isEmpty) {
        return const Center(
          child: Text('No users found'),
        );
      } else {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: chatController.userList.length,
          itemBuilder: (context, index) {
            final user = chatController.userList[index];
            return ChatCard(
              profileImageUrl: user.image ?? 'https://via.placeholder.com/50',
              contactName: user.name,
            );
          },
        );
      }
    });
  }
}
