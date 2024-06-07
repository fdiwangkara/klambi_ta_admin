import 'package:flutter/material.dart';
import 'package:klambi_admin/components/form_error.dart';
import 'package:klambi_admin/helper/constants.dart';

class Textfields extends StatefulWidget {
  const Textfields({super.key});

  @override
  _TextfieldsState createState() => _TextfieldsState();
}

class _TextfieldsState extends State<Textfields> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
  final List<String?> errors = [];
  bool _showConfirmPassword = false;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Save the changes
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Changes Saved!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Change Email Field
            Text(
              "Ganti Email Admin",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: kBlackColor,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              initialValue: email,
              decoration: InputDecoration(
                hintText: "Masukkan Email Baru",
                suffixIcon: Icon(
                  Icons.edit,
                  color: kSecondaryColor,
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: kEmailNullError);
                  removeError(error: kInvalidEmailError);
                }
                email = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: kEmailNullError);
                  return "";
                } else if (!emailValidatorRegExp.hasMatch(value)) {
                  addError(error: kInvalidEmailError);
                  return "";
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // Change Password Field
            Text(
              "Ganti Password",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: kBlackColor,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Masukkan Password Baru",
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showConfirmPassword = true;
                    });
                  },
                  child: Icon(
                    Icons.edit,
                    color: kSecondaryColor,
                  ),
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty && value.length >= 6) {
                  removeError(error: kPassNullError);
                  removeError(error: kShortPassError);
                }
                password = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: kPassNullError);
                  return "";
                } else if (value.length < 6) {
                  addError(error: kShortPassError);
                  return "";
                }
                return null;
              },
            ),
            if (_showConfirmPassword) ...[
              SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Konfirmasi Password Baru",
                ),
                onChanged: (value) {
                  if (value.isNotEmpty && value == password) {
                    removeError(error: kMatchPassError);
                  }
                  confirmPassword = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kPassNullError);
                    return "";
                  } else if (value != password) {
                    addError(error: kMatchPassError);
                    return "";
                  }
                  return null;
                },
              ),
            ],
            FormError(errors: errors),
            SizedBox(height: 16),
            if (email != null || password != null)
              Center(
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  child: Text("Save Changes"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
