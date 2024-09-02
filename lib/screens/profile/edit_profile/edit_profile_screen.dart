import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/components/custom_button.dart';
import 'package:klambi_admin/components/custom_textfield.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/profile/edit_profile/edit_profile_controller.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
          style: TextStyle(fontFamily: "General Sans", fontSize: 16,)
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
              child: Column(
                children: [
                  Container(
                    width: width * 0.3,
                    height: height * 0.155,
                    child: Stack(
                      children: [
                        Obx(
                              () => controllerEdit.pickedImage.value == null
                              ? ClipOval(
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: controllerEdit.imageUrl.value != null
                                      ? NetworkImage(controllerEdit.imageUrl.value!)
                                      : AssetImage("assets/images/dashboard/default_profile.png")
                                  as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                              : ClipOval(
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(controllerEdit.pickedImage.value!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 0,
                          child: Container(
                            height: height * 0.05,
                            width: width * 0.1,
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
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
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
                      SizedBox(height: 5),
                      CustomTextFormField(
                        hintText: controllerEdit.userProfile.value.name,
                        controller: controllerEdit.ctrName,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Obx(
                        () => controllerEdit.isLoading.value
                        ? Center(
                      child: LoadingAnimationWidget.discreteCircle(
                        color: kPrimaryColor,
                        size: 50,
                        secondRingColor: kSecondaryColor,
                      ),
                    )
                        : CustomButton(
                      onclick: () {
                        controllerEdit.updateProfile(
                          controllerEdit.ctrName.text,
                          controllerEdit.pickedImage.value,
                        );
                        Get.offAllNamed("/navbar");
                      },
                      title: "Simpan",
                    ),
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
