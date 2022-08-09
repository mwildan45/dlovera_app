

import 'package:dlovera_app/constants/api.dart';
import 'package:dlovera_app/models/api_response.dart';
import 'package:dlovera_app/models/laporan_penjualan.model.dart';
import 'package:dlovera_app/models/laporan_penjualan_per_bulan.model.dart';
import 'package:dlovera_app/services/http.service.dart';

class LaporanPenjualanRequest extends HttpService {

  Future<LaporanPenjualanData> getLaporanPenjualanChart(Map<String, dynamic> params) async {
    final apiResult = await post(Api.laporanPenjualanChart, params);
    final apiResponse = ApiResponse.fromResponse(apiResult);
    if (apiResponse.allGood) {
      return LaporanPenjualanData.fromJson(apiResponse.body['data']);
    } else {
      throw apiResponse.message;
    }
  }

  Future<LaporanPenjualanPerBulanData> getLaporanPenjualanPerBulan(Map<String, dynamic> params) async {
    final apiResult = await post(Api.laporanPenjualanPerBulan, params);
    final apiResponse = ApiResponse.fromResponse(apiResult);
    if (apiResponse.allGood) {
      return LaporanPenjualanPerBulanData.fromJson(apiResponse.body['data']);
    } else {
      throw apiResponse.message;
    }
  }

}