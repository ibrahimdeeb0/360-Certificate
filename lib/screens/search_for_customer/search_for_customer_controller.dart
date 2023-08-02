import 'package:dio/dio.dart';

import '../../general_exports.dart';

class SearchForCustomerController extends GetxController {
  final Dio _dio = Dio();

  TextEditingController searchController = TextEditingController();
  List<dynamic> searchResult = <dynamic>[];
  bool showMessageNoResult = false;
  // bool showMessageSearch = true;

  List<dynamic> allCustomers = <dynamic>[];

  @override
  void onReady() {
    getAllCustomers();
    super.onReady();
  }

  void onSearching(String value) {
    if (value == '') {
      searchResult = allCustomers;
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
        searchResult = response.data['data'];
        if (searchResult.isEmpty && searchController.text.trim().isNotEmpty) {
          showMessageNoResult = true;
        } else {
          showMessageNoResult = false;
        }

        if (searchController.text.trim().isEmpty) {
          searchResult = allCustomers;
        }
        consoleLogPretty(searchResult, key: 'searchingResult');
        update();
      });
    }
    // consoleLog(searchResult, key: 'searchingResult');
  }

  Future<void> getAllCustomers() async {
    hideKeyboard();

    ApiRequest(
      path: '/all-customers-sites',
      className: 'SearchForCustomerController/getAllCustomers',
      requestFunction: getAllCustomers,
      withLoading: true,
      // formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        allCustomers = data;
        searchResult = data;
        update();
      },
    );
  }
}
