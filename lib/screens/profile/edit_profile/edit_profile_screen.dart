import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/components/custom_button.dart';
import 'package:klambi_admin/components/custom_textfield.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/profile/edit_profile/edit_profile_controller.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package

class EditProfileScreenView extends StatelessWidget {
  const EditProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerEdit = Get.put(EditProfileController());
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(fontFamily: "General Sans", fontSize: 20),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.offAllNamed("/navbar");
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Obx(
            () => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              width: width * 0.98,
              height: height, // Set the height of the container to the full height
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: controllerEdit.pickedImage.value != null
                        ? FileImage(controllerEdit.pickedImage.value!)
                        : (controllerEdit.imageUrl.value != null
                        ? NetworkImage(controllerEdit.imageUrl.value!)
                        : AssetImage("assets/images/dashboard/profile_image.png")
                    as ImageProvider),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 5,
                          right: 0,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: () {
                                _showPicker(context, controllerEdit);
                              },
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: kDarkGreyColor,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50), // Space between CircleAvatar and TextField
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ganti Username",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10), // Optional spacing between label and text field
                      controllerEdit.adminProfile.value.name.isNotEmpty
                          ? CustomTextFormField(
                        hintText: controllerEdit.adminProfile.value.name,
                        controller: controllerEdit.ctrName,
                      )
                          : Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Space between text field and button
                    ],
                  ),// Push the button to the bottom
                  CustomButton(
                    onclick: () {
                      controllerEdit.updateProfile(
                        controllerEdit.ctrName.text,
                        controllerEdit.pickedImage.value,
                      );
                      Get.offAllNamed("/navbar");
                    },
                    title: "Simpan",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context, EditProfileController controller) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Galeri'),
                onTap: () {
                  controller.pickImage();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Kamera'),
                onTap: () {
                  controller.pickImage();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
