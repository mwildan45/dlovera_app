import 'package:dlovera_app/models/chart_data.model.dart';
import 'package:dlovera_app/models/stock.model.dart';
import 'package:dlovera_app/requests/laporan_stock.request.dart';
import 'package:dlovera_app/view_models/base.view_model.dart';
import 'package:dlovera_app/views/pages/laporan_stock/laporan_stock_persediaan_bahan_baku.page.dart';
import 'package:dlovera_app/views/pages/laporan_stock/laporan_stock_persediaan_produk.page.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/stock_produk.data_source.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanStockViewModel extends MyBaseViewModel {
  LaporanStockViewModel(BuildContext context){
    viewContext = context;
  }

  LaporanStockRequest laporanStockRequest = LaporanStockRequest();
  StockHeader? stockData;
  List<ChartData>? dataChart = [];
  int? selectedYear = 2022;
  int currentPageProduk = 1;
  int currentPageBahanBaku = 1;
  String? selectedMonth = '';
  LaporanStockProdukBahanBakuDataSource? laporanStockProdukBahanBakuDataSource;


  @override
  void initialise() async {
    geLaporanStock("", isGetPerBulan: true);
  }

  //
  geLaporanStock(String? year, {bool isGetPerBulan = false}) async {
    setBusy(true);
    stockData = await laporanStockRequest.getLaporanStock({});

    try {


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
  getDataPaginationStockPersediaanProduk(pageNumber) async {
    setBusyForObject(laporanStockProdukBahanBakuDataSource, true);

    try{

      stockData = await laporanStockRequest.getLaporanStock(
          {
            'produk_page_number': pageNumber
          }
      );

      laporanStockProdukBahanBakuDataSource?.dispose();
      laporanStockProdukBahanBakuDataSource = LaporanStockProdukBahanBakuDataSource(
          stockProdukBahanBaku: stockData?.data?.persediaanProduk?.data ?? []);

    } catch (error) {
      print("Error ==> $error");
      setError(error);
      viewContext?.showToast(
        msg: "$error",
        bgColor: Colors.red,
      );
    }

    setBusyForObject(laporanStockProdukBahanBakuDataSource, false);
  }

  //
  getDataPaginationStockPersediaanBahanBaku(pageNumber) async {
    setBusyForObject(laporanStockProdukBahanBakuDataSource, true);

    try{

      stockData = await laporanStockRequest.getLaporanStock(
          {
            'bahan_baku_page_number': pageNumber
          }
      );

      laporanStockProdukBahanBakuDataSource?.dispose();
      laporanStockProdukBahanBakuDataSource = LaporanStockProdukBahanBakuDataSource(
          stockProdukBahanBaku: stockData?.data?.persediaanBahanBaku?.data ?? []);

    } catch (error) {
      print("Error ==> $error");
      setError(error);
      viewContext?.showToast(
        msg: "$error",
        bgColor: Colors.red,
      );
    }

    setBusyForObject(laporanStockProdukBahanBakuDataSource, false);
  }

  //
  onPageChangePersediaanProduk(number, {month, year}){
    currentPageProduk = number;
    notifyListeners();
    getDataPaginationStockPersediaanProduk(number);
  }

  //
  onPageChangePersediaanBahanBaku(number, {month, year}){
    currentPageProduk = number;
    notifyListeners();
    getDataPaginationStockPersediaanBahanBaku(number);
  }


  navigateToPersediaanProdukAll(LaporanStockViewModel vm) {
    viewContext?.navigator?.push(
        MaterialPageRoute(builder: (context) => LaporanStockPersediaanProdukPage(
          vm: vm,
        ))
    );
  }

  navigateToPersediaanBahanBakuAll(LaporanStockViewModel vm) {
    viewContext?.navigator?.push(
        MaterialPageRoute(builder: (context) => LaporanStockPersediaanBahanBakuPage(
          vm: vm,
        ))
    );
  }

}