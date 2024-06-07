import 'package:flutter/material.dart';
import 'package:klambi_admin/helper/constants.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace these strings with the actual account name and email
    final String accountName = "Admin";
    final String email = "john.doe@example.com";

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile photo
          CircleAvatar(
            radius: 40, // Adjusted radius to make it smaller
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          const SizedBox(height: 10),
          // Account name
          Text(
            accountName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: kBlackColor,
            ),
          ),
          // Email
          Text(
            email,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: kDarkGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
