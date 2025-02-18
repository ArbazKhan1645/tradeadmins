import 'dart:io';

import 'package:file_picker/file_picker.dart';

Future pickImage() async {
  File? selectedImage;
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'jpeg', 'png'],
  );

  if (result != null) {
    selectedImage = File(result.files.single.path!);
    return selectedImage;
  }
}
