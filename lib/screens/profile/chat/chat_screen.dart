import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/components/chat_card.dart';
import 'package:klambi_admin/screens/profile/chat/chat_controller.dart';
import 'package:klambi_admin/screens/profile/chat/components/chat_list.dart';
import 'package:klambi_admin/screens/profile/chat/components/search_textfield.dart';
import 'package:klambi_admin/screens/profile/edit_profile/components/photo_edit.dart';
import 'package:klambi_admin/screens/profile/edit_profile/components/textfields.dart';
import 'package:klambi_admin/screens/profile/edit_profile/edit_profile_controller.dart';

import '../../../helper/constants.dart';

class ChatScreenView extends GetView<ChatController> {
  const ChatScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Get.offAndToNamed("/profile");
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Admin CS",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: kBlackColor,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          children: [
            SearchTextfields(),
            SizedBox(height: 20),
            ChatCard(profileImageUrl: "http://via.placeholder.com/50x50", contactName: "contactName", latestMessage: "latestMessage", messageTime: "02:07")
          ],
        ),
      ),
    );
  }
}
