import 'package:dlovera_app/models/chart_data.model.dart';
import 'package:dlovera_app/models/laporan.model.dart';
import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/requests/laporan_stock.request.dart';
import 'package:dlovera_app/view_models/base.view_model.dart';
import 'package:dlovera_app/views/pages/laporan_produksi/laporan_produksi_all_retur.page.dart';
import 'package:dlovera_app/views/pages/laporan_produksi/laporan_produksi_all_transaksi.page.dart';
import 'package:dlovera_app/views/pages/laporan_stock/laporan_stock_produksi.page.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/retur.data_source.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/stock_produk.data_source.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/transaksi.data_source.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanStockViewModel extends MyBaseViewModel {
  LaporanStockViewModel(BuildContext context){
    viewContext = context;
  }

  LaporanStockRequest laporanStockRequest = LaporanStockRequest();
  LaporanChartData? laporanChartData;
  LaporanPerBulanData? laporanPerBulanData;
  List<ChartData>? dataChart = [];
  int? selectedYear = 2022;
  int currentPageTransaksi = 1;
  int currentPageRetur = 1;
  String? selectedMonth = '';
  LaporanStockProdukDataSource? laporanStockProdukDataSource;


  @override
  void initialise() async {
    geLaporanStockChart("", isGetPerBulan: true);
  }

  //
  geLaporanStockChart(String? year, {bool isGetPerBulan = false}) async {
    setBusy(true);
    try {

      laporanChartData = await laporanStockRequest.getLaporanStockChart({
        'tahun': year ?? "",
      });

      setDataChart();

      if(isGetPerBulan){
        getLaporanStockPerBulan("", "");
      }

      clearErrors();
    } catch (error) {
      print("Error ==> $error");
      setError(error);
      viewContext?.showToast(
        msg: "$error",
        bgColor: Colors.red,
      );
    }

    setBusy(false);
  }

  //
  getLaporanStockPerBulan(String? month, String? year) async {
    setBusyForObject(laporanPerBulanData, true);

    try{
      laporanPerBulanData = await laporanStockRequest.getLaporanStockPerBulan(
          {
            'tahun': year ?? 2022,
            'bulan': month ?? 1,
          }
      );

      selectedMonth = month;

    } catch (error) {
      print("Error ==> $error");
      setError(error);
      viewContext?.showToast(
        msg: "$error",
        bgColor: Colors.red,
      );

    }

    setBusyForObject(laporanPerBulanData, false);
  }

  //
  getDataPaginationStockProduk(pageNumber) async {
    setBusyForObject(laporanStockProdukDataSource, true);

    try{

      laporanPerBulanData = await laporanStockRequest.getLaporanStockPerBulan(
          {
            'tahun': selectedYear.toString(),
            'bulan': selectedMonth,
            'transaksi_page_number': pageNumber
          }
      );

      laporanStockProdukDataSource?.dispose();
      laporanStockProdukDataSource = LaporanStockProdukDataSource(
          stockProduk: laporanPerBulanData?.produk?.data ?? []);

    } catch (error) {
      print("Error ==> $error");
      setError(error);
      viewContext?.showToast(
        msg: "$error",
        bgColor: Colors.red,
      );
    }

    setBusyForObject(laporanStockProdukDataSource, false);
  }

  //
  setDataChart() {
    dataChart?.clear();
    laporanChartData?.statistic?.forEach((element) {
      dataChart?.add(ChartData(element.bulan ?? "", element.total ?? "", num: element.num));
    });
  }

  //
  onPageChangeAllStockProduk(number, {month, year}){
    currentPageTransaksi = number;
    if(month != null){
      selectedYear = year;
      selectedMonth = month;
    }
    notifyListeners();
    getDataPaginationStockProduk(number);
  }


  navigateToAllStockProduk(LaporanStockViewModel vm) {
    viewContext?.navigator?.push(
        MaterialPageRoute(builder: (context) => LaporanStockProdukPage(
          vm: vm,
        ))
    );
  }

}