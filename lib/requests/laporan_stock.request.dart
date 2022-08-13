import 'package:dlovera_app/constants/api.dart';
import 'package:dlovera_app/models/api_response.dart';
import 'package:dlovera_app/models/laporan.model.dart';
import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/services/http.service.dart';

class LaporanStockRequest extends HttpService {

  Future<LaporanChartData> getLaporanStockChart(Map<String, dynamic> params) async {
    final apiResult = await post(Api.laporanStockChart, params);
    final apiResponse = ApiResponse.fromResponse(apiResult);
    if (apiResponse.allGood) {
      return LaporanChartData.fromJson(apiResponse.body['data']);
    } else {
      throw apiResponse.message;
    }
  }

  Future<LaporanPerBulanData> getLaporanStockPerBulan(Map<String, dynamic> params) async {
    final apiResult = await post(Api.laporanStockPerBulan, params);
    final apiResponse = ApiResponse.fromResponse(apiResult);
    if (apiResponse.allGood) {
      return LaporanPerBulanData.fromJson(apiResponse.body['data']);
    } else {
      throw apiResponse.message;
    }
  }
}