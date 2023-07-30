import 'package:dio/dio.dart';

import '../general_exports.dart';

class ApiRequest {
  ApiRequest({
    required this.path,
    required this.className,
    required this.requestFunction,
    this.method = ApiMethods.get,
    this.header,
    this.body,
    this.queryParameters,
    this.formatResponse = false,
    this.withLoading = false,
    this.shouldShowMessage = true,
  });

  final String? path;
  final ApiMethods method;
  final String? className;
  final Map<String, dynamic>? header;
  String authorization() => myAppController.userData != null
      ? 'Bearer ${myAppController.userData?['token']}'
      : '';
  final bool withLoading;
  final bool formatResponse;
  final bool shouldShowMessage;
  final dynamic body;
  final dynamic queryParameters;
  dynamic response;
  final Function? requestFunction;

  Dio _dio() {
    // Put your authorization token here

    return Dio(
      BaseOptions(
        headers: <String, dynamic>{
          'Authorization': authorization(),
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Device-Type': 'MOBILE',
          'Accept-Language':
              'en', // Get.find<AppLanguageController>().appLocale
          ...(header ?? <String, dynamic>{}),
        },
      ),
    );
  }

  Future<void> request({
    Function()? beforeSend,
    Function(dynamic data, dynamic response)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    // start request time
    final Stopwatch stopwatch = Stopwatch()..start();

    if (!myAppController.isInternetConnect) {
      myAppController.noInternetWaitingRequests.add(<String, dynamic>{
        keyRequestFunction: requestFunction,
      });
      myAppController.update();
      dismissLoading();
      return;
    }

    try {
      if (withLoading) {
        startLoading();
      }
      // check method type
      switch (method) {
        case ApiMethods.get:
          response = await _dio()
              .get(baseUrl + path!, queryParameters: queryParameters);

          break;
        case ApiMethods.post:
          consoleLog(baseUrl + path!);
          response = await _dio().post(
            baseUrl + path!,
            data: body,
            queryParameters: queryParameters,
          );
          break;
        case ApiMethods.put:
          response = await _dio().put(
            baseUrl + path!,
            data: body,
            queryParameters: queryParameters,
          );
          break;
        case ApiMethods.delete:
          response = await _dio().delete(
            baseUrl + path!,
            data: body,
            queryParameters: queryParameters,
          );
          break;
        case ApiMethods.patch:
          response = await _dio().patch(
            baseUrl + path!,
            data: body,
            queryParameters: queryParameters,
          );
          break;
      }

      // print response data in console
      showRequestDetails(
        method: method.toString(),
        path: path,
        formatResponse: formatResponse,
        className: className,
        body: body.toString(),
        headers: _dio().options.headers,
        queryParameters: queryParameters.toString(),
        response: response.data,
        time: stopwatch.elapsedMilliseconds,
      );
      stopwatch.stop();

      if (withLoading) {
        dismissLoading();
      }
      if (onSuccess != null) {
        onSuccess(response.data['data'], response.data);
      }
    } on Exception catch (error) {
      dismissLoading();
      if (error is DioError) {
        final dynamic errorData = error.response?.data ??
            <String, dynamic>{
              'errors': <Map<String, String>>[
                <String, String>{'message': 'Un handled Error'}
              ]
            };
        // print response error
        showRequestDetails(
          method: method.toString(),
          path: path,
          formatResponse: formatResponse,
          className: className,
          body: body.toString(),
          headers: _dio().options.headers,
          queryParameters: queryParameters.toString(),
          response: errorData,
          time: stopwatch.elapsedMilliseconds,
          isError: true,
        );

        if (onError != null) {
          onError(errorData);
        }

        //handle DioError here by error type or by error code
        consoleLog(errorData['errors'].runtimeType);
        if (shouldShowMessage) {
          showMessage(
            description:
                errorData['errors'] != null && errorData['errors'].length > 0
                    ? errorData['errors'].runtimeType != List
                        ? (errorData['errors'] as Map<String, dynamic>)
                            .values
                            .toList()[0][0]
                        : errorData['errors'][0]['message']
                    : errorData['message'],
            textColor: COMMON_RED_COLOR,
          );
        }

        if (error.response!.statusCode == 401) {
          myAppController.onSignOut();
          Get.offAllNamed(routeLogin);
        }
      } else {
        // handle another errors
        showRequestDetails(
          method: method.toString(),
          path: path,
          formatResponse: formatResponse,
          className: className,
          body: body.toString(),
          headers: _dio().options.headers,
          queryParameters: queryParameters.toString(),
          response: error,
          time: stopwatch.elapsedMilliseconds,
          isError: true,
          otherCatch: true,
        );
      }
      stopwatch.stop();
    }
  }
}

enum ApiMethods {
  post,
  get,
  put,
  delete,
  patch,
}
