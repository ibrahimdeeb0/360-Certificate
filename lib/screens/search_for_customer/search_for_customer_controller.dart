import 'package:dio/dio.dart';

import '../../general_exports.dart';

class SearchForCustomerController extends GetxController {
  final Dio _dio = Dio();

  TextEditingController searchController = TextEditingController();
  List<dynamic> searchResult = <dynamic>[];
  bool showMessageNoResult = false;
  bool showMessageSearch = true;

  void onSearching(String value) {
    if (value == '') {
      searchResult = <dynamic>[];
      showMessageSearch = true;
      update();
    } else {
      _dio
          .get(
        '$baseUrl/multi-search',
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
        // consoleLog(response.data['data'], key: 'searchingResult');
        searchResult = response.data['data'];
        if (searchResult.isEmpty) {
          showMessageNoResult = true;
        } else {
          showMessageNoResult = false;
        }
        showMessageSearch = false;
        consoleLogPretty(searchResult, key: 'searchingResult');
        update();
      });
    }
    // consoleLog(searchResult, key: 'searchingResult');
  }
}