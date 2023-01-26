import 'package:dio/dio.dart' as dio_form_data;
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

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

dynamic imageAsFormData(XFile file) async {
  final String fileName = file.path.split('/').last;
  return dio_form_data.FormData.fromMap(<String, dynamic>{
    'file': await dio_form_data.MultipartFile.fromFile(
      file.path,
      filename: fileName,
    ),
  });
}

dynamic customerServiceFormData({
  required List<XFile> files,
  Map<String, dynamic>? jsonObject,
}) async {
  for (int i = 0; i < files.length; i++) {
    jsonObject!['attachments[$i]'] = await dio_form_data.MultipartFile.fromFile(
      files[i].path,
      filename: files[i].path.split('/').last,
    );
  }
  return dio_form_data.FormData.fromMap(jsonObject!);
}

Future<void> launchMailto(String to) async {
  await launchUrl(
    Uri.parse('mailto:$to'),
    mode: LaunchMode.externalApplication,
  );
}
