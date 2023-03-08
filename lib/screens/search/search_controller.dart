import 'package:dio/dio.dart';

import '../../general_exports.dart';

class SearchController extends GetxController {
  final Dio _dio = Dio();

  TextEditingController searchController = TextEditingController();

  dynamic listCerts;
  dynamic listCustomers;
  dynamic searchResult = <String, dynamic>{};

  void onSearching(String value) {
    consoleLog('value', key: 'onChange');
    if (value == '') {
      searchResult = <String, dynamic>{};
      listCerts = <dynamic>[];
      listCustomers = <dynamic>[];
      update();
    } else {
      _dio
          .get(
        '$baseUrl/search',
        queryParameters: <String, dynamic>{
          'q': value,
        },
        options: Options(
          headers: <String, dynamic>{
            'Authorization': 'Bearer ${myAppController.userData?['token']}',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Device-Type': 'MOBILE',
            'Accept-Language': 'en',
          },
        ),
      )
          .then((dynamic response) {
        // consoleLog(response, key: 'searchResult');
        searchResult = response.data['data'];
        listCerts = searchResult['certificates'];
        listCustomers = searchResult['customers'];
        consoleLog(searchResult);
        update();
      });
    }
  }

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
}
