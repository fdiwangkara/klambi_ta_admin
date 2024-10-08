import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klambi_admin/helper/constants.dart';

class CustomCard extends StatelessWidget {
  final String topText;
  final String bottomText;

  const CustomCard({
    Key? key,
    required this.topText,
    required this.bottomText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: kSuperLightGreyColor,
        border: Border.all(color: kLightGreyColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              topText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: kDarkGreyColor,
              ),
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Text(
                  bottomText,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
