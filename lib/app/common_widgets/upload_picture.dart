// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:partner_hub/app/services/fetch_supabase.dart';
import 'package:partner_hub/main.dart';

String imageBaseUrl = '${currentEnv.supabaseUrl}/storage/v1/object/public';
String storageBucketName = 'merchants';
String emptyFileUrl = '';

Future<String> UploadPictureToSupaBase(
    {File? selectedImage, required String className}) async {
  if (selectedImage == null) {
    return emptyFileUrl;
  }
  final fileType = selectedImage.path.split('.').last;
  final filename = generateFileName(fileType: fileType);
  final responsePath = '$storageBucketName/$className/$filename';
  try {
    await supbaseClient.storage
        .from(storageBucketName)
        .upload('/$className/$filename', selectedImage);
    return '$imageBaseUrl/$responsePath';
  } catch (e) {
    return emptyFileUrl;
  }
}

String generateFileName({required String fileType}) {
  return '${DateTime.now().millisecondsSinceEpoch}.$fileType';
}
