import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Import this package to use the File class

class PhotoEdit extends StatefulWidget {
  const PhotoEdit({super.key});

  @override
  _PhotoEditState createState() => _PhotoEditState();
}

class _PhotoEditState extends State<PhotoEdit> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: _imageFile != null ? FileImage(File(_imageFile!.path)) : null,
            backgroundColor: Colors.grey[200],
            child: _imageFile == null
                ? Icon(Icons.person, size: 60, color: Colors.grey[400])
                : null,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipOval(
              child: Container(
                height: 80,
                width: 80,  
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black54],
                  ),
                ),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: const Center(
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
