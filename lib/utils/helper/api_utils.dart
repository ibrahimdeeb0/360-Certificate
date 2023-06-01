import 'dart:io';

import 'package:dio/dio.dart' as dio_form_data;
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../general_exports.dart';

dynamic addFormDataToJson({
  String fileKey = 'avatar',
  dynamic file,
  Map<String, dynamic>? jsonObject,
}) async {
  jsonObject![fileKey] = await dio_form_data.MultipartFile.fromFile(
    file.path,
    filename: file.path.split('/').last,
  );
  return dio_form_data.FormData.fromMap(jsonObject);
}

dynamic imageAsFormData({
  XFile? file,
  String fileKey = 'logo',
}) async {
  final String fileName = file!.path.split('/').last;
  return dio_form_data.FormData.fromMap(
    <String, dynamic>{
      fileKey: await dio_form_data.MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    },
  );
}

dynamic customerServiceFormData({
  required List<XFile> files,
  Map<String, dynamic>? jsonObject,
  String fileKey = 'note_files', //attachments
}) async {
  consoleLog(files);
  for (int i = 0; i < files.length; i++) {
    //'attachments[$i]'
    jsonObject![fileKey[i]] = await dio_form_data.MultipartFile.fromFile(
      files[i].path,
      filename: files[i].path.split('/').last,
    );
  }
  consoleLog(jsonObject!.entries);
  return dio_form_data.FormData.fromMap(jsonObject);
}

Future<void> launchMailto(String to) async {
  await launchUrl(
    Uri.parse('mailto:$to'),
    mode: LaunchMode.externalApplication,
  );
}

dynamic addArrayToFormData({
  List<Map<String, dynamic>>? imagesArray,
  File? customerSignature,
  Map<String, dynamic>? jsonObject,
}) async {
  final List<Map<String, dynamic>> images = <Map<String, dynamic>>[];
  consoleLogPretty(
    jsonObject,
  );
  for (final Map<String, dynamic> element in imagesArray!) {
    final dynamic value = await dio_form_data.MultipartFile.fromFile(
      element['image'].path,
      filename: element['image'].path.split('/').last,
    );
    images.add(<String, dynamic>{
      'id': element['id'],
      'image': value,
    });
    if (element == imagesArray.last) {
      jsonObject!['form_images'] = images;
    }
  }

  //*  //
  final dynamic custSignature = await dio_form_data.MultipartFile.fromFile(
    customerSignature!.path,
    filename: customerSignature.path.split('/').last,
  );

  jsonObject!['customer_signature'] = custSignature;

  consoleLog(jsonObject, key: 'Images form data');

  return dio_form_data.FormData.fromMap(jsonObject);
}

dynamic uploadArrayToFormData({
  List<XFile>? imagesArray,
  Map<String, dynamic>? jsonObject,
}) async {
  final List<dynamic> images = <dynamic>[];

  for (final XFile element in imagesArray!) {
    final dynamic value = await dio_form_data.MultipartFile.fromFile(
      element.path,
      filename: element.path.split('/').last,
    );
    // Read the MultipartFile "The Images" as a string

    // Move this string of Images values to it's key
    images.add(value);
    if (element == imagesArray.last) {
      jsonObject!['note_files[]'] = images;
    }

    consoleLog(jsonObject!.entries, key: 'Form_Data');
  }

  return dio_form_data.FormData.fromMap(jsonObject!);
}
