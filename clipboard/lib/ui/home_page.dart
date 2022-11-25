import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/text_detector_view.dart';

class HomePage extends StatefulWidget {
  final String vehicelNumber;
  const HomePage({required this.vehicelNumber, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _vehicleNumberController = TextEditingController();
  //image
  late File imageFile = File("");
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    setState(() {
      _vehicleNumberController.text = widget.vehicelNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _vehicleNumberController,
            decoration: InputDecoration(
                suffixIcon: IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () async {
                showModalBottomSheet(
                  elevation: 3,
                  context: context,
                  builder: (context) => const SizedBox(
                    height: 150,
                    child: TextRecognizerView(),
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
