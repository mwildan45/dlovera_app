import 'package:dlovera_app/constants/api.dart';
import 'package:dlovera_app/models/api_response.dart';
import 'package:dlovera_app/models/laporan.model.dart';
import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/models/stock.model.dart';
import 'package:dlovera_app/services/http.service.dart';

class LaporanStockRequest extends HttpService {

  Future<StockHeader> getLaporanStock(Map<String, dynamic> params) async {
    final apiResult = await post(Api.laporanStock, params);
    final apiResponse = ApiResponse.fromResponse(apiResult);
    if (apiResponse.allGood) {
      return StockHeader.fromJson(apiResponse.body);
    } else {
      throw apiResponse.message;
    }
  }
}