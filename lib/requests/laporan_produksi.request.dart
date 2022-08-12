import 'package:dlovera_app/constants/api.dart';
import 'package:dlovera_app/models/api_response.dart';
import 'package:dlovera_app/models/laporan_penjualan.model.dart';
import 'package:dlovera_app/models/laporan_penjualan_per_bulan.model.dart';
import 'package:dlovera_app/services/http.service.dart';

class LaporanProduksiRequest extends HttpService {

  Future<LaporanChartData> getLaporanProduksiChart(Map<String, dynamic> params) async {
    final apiResult = await post(Api.laporanProduksiChart, params);
    final apiResponse = ApiResponse.fromResponse(apiResult);
    if (apiResponse.allGood) {
      return LaporanChartData.fromJson(apiResponse.body['data']);
    } else {
      throw apiResponse.message;
    }
  }

  Future<LaporanPerBulanData> getLaporanProduksiPerBulan(Map<String, dynamic> params) async {
    final apiResult = await post(Api.laporanProduksiPerBulan, params);
    final apiResponse = ApiResponse.fromResponse(apiResult);
    if (apiResponse.allGood) {
      return LaporanPerBulanData.fromJson(apiResponse.body['data']);
    } else {
      throw apiResponse.message;
    }
  }
}