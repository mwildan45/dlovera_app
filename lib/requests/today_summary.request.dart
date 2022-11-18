import 'package:dlovera_app/constants/api.dart';
import 'package:dlovera_app/models/api_response.dart';
import 'package:dlovera_app/models/today_summary.model.dart';
import 'package:dlovera_app/services/http.service.dart';

class TodaySummaryRequest extends HttpService {
  //
  Future<TodaySummaryData> getTodaySummary(tanggal) async {
    final apiResult = await post(Api.todaySummary, {
      'tanggal': tanggal
    });
    final apiResponse = ApiResponse.fromResponse(apiResult);
    if (apiResponse.allGood) {
      return TodaySummaryData.fromJson(apiResponse.body['data']);
    } else {
      throw apiResponse.message;
    }
  }
}