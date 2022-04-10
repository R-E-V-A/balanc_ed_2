import 'package:balanc_ed_2/Constants/Fonts&Themes.dart';
import 'package:balanc_ed_2/Models/ChatModels.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Future<AnswerModel?> sendQuestion({required String question}) async {
  const url = balancedBaseApiUrl + "api/question";
  var body = {"question": question};
  try {
    var response = await Dio().post(url,
        data: body,
        options:
            Options(headers: {Headers.contentTypeHeader: "application/json"}));
    var decodedResponse =
        AnswerModel.fromJson(response.data as Map<String, dynamic>);
    return decodedResponse;
  } catch (err) {
    if (kDebugMode) {
      print(err.toString());
    }
    return null;
  }
}
