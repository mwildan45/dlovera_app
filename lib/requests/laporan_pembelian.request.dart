

import 'package:dlovera_app/constants/api.dart';
import 'package:dlovera_app/models/api_response.dart';
import 'package:dlovera_app/models/laporan.model.dart';
import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/services/http.service.dart';

class LaporanPembelianRequest extends HttpService {

  Future<LaporanChartData> getLaporanPenjualanChart(Map<String, dynamic> params) async {
    final apiResult = await post(Api.laporanPembelianChart, params);
    final apiResponse = ApiResponse.fromResponse(apiResult);
    if (apiResponse.allGood) {
      return LaporanChartData.fromJson(apiResponse.body['data']);
    } else {
      throw apiResponse.message;
    }
  }

  Future<LaporanPerBulanData> getLaporanPenjualanPerBulan(Map<String, dynamic> params) async {
    final apiResult = await post(Api.laporanPembelianPerBulan, params);
    final apiResponse = ApiResponse.fromResponse(apiResult);
    if (apiResponse.allGood) {
      return LaporanPerBulanData.fromJson(apiResponse.body['data']);
    } else {
      throw apiResponse.message;
    }
  }

}