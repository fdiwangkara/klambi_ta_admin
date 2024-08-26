import 'package:flutter/material.dart';
import 'package:klambi_admin/helper/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onclick;
  final String title;


  CustomButton({super.key, required this.onclick, required this.title});

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;
    return ElevatedButton(
        onPressed: onclick,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            minimumSize:
            MaterialStateProperty.all(Size(width, 50)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)))),
        child: Text(
          title,
          style: const TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ));
  }
}