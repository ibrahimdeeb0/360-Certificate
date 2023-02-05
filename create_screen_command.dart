// ignore_for_file: avoid_print, leading_newlines_in_multiline_strings

import 'dart:convert';
import 'dart:io';

void main() async {
  print('Enter screen name:');
  final String? screenName = stdin.readLineSync(encoding: utf8);
  final Directory projectDirectory = Directory.current;
  final String screensDirectory = '${projectDirectory.path}/lib/screens/';
  final List<String> splitName = screenName!.trim().split(RegExp('(?=[A-Z])'));
  final String folderName =
      splitName.map((String value) => value.toLowerCase()).join('_');
  final String fileControllerName = '${folderName}_controller';
  final String classControllerName = '${screenName}Controller';
  final String indexContent =
      '''export '$folderName.dart'; \nexport '$fileControllerName.dart';\n''';

  final String controllerContent = '''import '../../general_exports.dart';

class $classControllerName extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  // }
  // @override
  // void onReady() {
  //   super.onReady();
  // }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}\n''';
  final String screenContent = '''import '../../general_exports.dart';

class $screenName extends StatelessWidget {
  const $screenName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      body: GetBuilder<$classControllerName>(
        init: $classControllerName(),
        builder: ($classControllerName controller) {
          return const Center(child: CommonText('$screenName Screen'));
        },
      ),
    );
  }
}\n''';

  final String routeContent = '''GetPage<$screenName>(
  name: route$screenName,
   page: () => const $screenName(),
 ),''';

  final String screenIndexContent = '''export '$folderName/index.dart';\n''';
  final String routeKey =
      '''const String route$screenName = '/$folderName';\n''';

  await Directory('$screensDirectory$folderName').create();
  final File indexFile =
      await File('$screensDirectory$folderName/index.dart').create();
  await indexFile.writeAsString(indexContent);
  final File screenFile =
      await File('$screensDirectory$folderName/$folderName.dart').create();
  await screenFile.writeAsString(screenContent);
  final File controllerFile =
      await File('$screensDirectory$folderName/$fileControllerName.dart')
          .create();
  await controllerFile.writeAsString(controllerContent);
  final File screenIndexFile = File('$screensDirectory/index.dart');
  await screenIndexFile.writeAsString(
    screenIndexContent,
    mode: FileMode.append,
  );
  final File routeKeys =
      File('${projectDirectory.path}/lib/constants/keys/routes_keys.dart');
  await routeKeys.writeAsString(
    routeKey,
    mode: FileMode.append,
  );
  final File routesFile = File('$screensDirectory/my_app/routes.dart');
  final String value = await routesFile.readAsString();
  final String routesContent =
      '''${value.split('];')[0]}$routeContent \n];\n''';
  await routesFile.writeAsString(routesContent);
  print('Screen Created successful :)');
}
