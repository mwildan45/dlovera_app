import 'package:dlovera_app/models/chart_data.model.dart';
import 'package:dlovera_app/models/kartu_stok.model.dart';
import 'package:dlovera_app/models/stock.model.dart';
import 'package:dlovera_app/requests/laporan_stock.request.dart';
import 'package:dlovera_app/view_models/base.view_model.dart';
import 'package:dlovera_app/views/pages/laporan_stock/laporan_stock_persediaan_bahan_baku.page.dart';
import 'package:dlovera_app/views/pages/laporan_stock/laporan_stock_persediaan_produk.page.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/detailed/kartu_stok.data_source.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/stock_produk.data_source.dart';
import 'package:dlovera_app/widgets/dialogs/stok_kartu.dialog.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanStockViewModel extends MyBaseViewModel {
  LaporanStockViewModel(BuildContext context){
    viewContext = context;
  }

  LaporanStockRequest laporanStockRequest = LaporanStockRequest();
  StockHeader? stockData;
  KartuStokHeader? kartuStokHeader;
  List<ChartData>? dataChart = [];
  int? selectedYear = 2022;
  int currentPageProduk = 1;
  int currentPageBahanBaku = 1;
  String? selectedMonth = '';
  LaporanStockProdukBahanBakuDataSource? laporanStockProdukBahanBakuDataSource;
  LaporanKartuStockDataSource? laporanKartuStockDataSource;


  @override
  void initialise() async {
    geLaporanStock("", isGetPerBulan: true);
  }

  //
  geLaporanStock(String? year, {bool isGetPerBulan = false}) async {
    setBusy(true);

    try {

      stockData = await laporanStockRequest.getLaporanStock({});

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
  void getDetailKartuStok(idb, url) async {
    // setBusyForObject(kartuStokHeader, true);
    viewContext!.loaderOverlay.show();

    try{
      kartuStokHeader = await laporanStockRequest.getKartuStok(idb, url);

      laporanKartuStockDataSource?.dispose();
      laporanKartuStockDataSource = LaporanKartuStockDataSource(
          kartuStock: kartuStokHeader?.data?.product ?? []);

      DialogStokKartu(viewContext, data: kartuStokHeader?.data, laporanKartuStockDataSource: laporanKartuStockDataSource!);

    } catch (error) {
      print("Error ==> $error");
      setError(error);
      viewContext?.showToast(
        msg: "Error ==> Tidak ada data pada baris yang dipilih",
        bgColor: Colors.red,
        textColor: Colors.white
      );
    }
    viewContext!.loaderOverlay.hide();
    // setBusyForObject(kartuStokHeader, false);
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