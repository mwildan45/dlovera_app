
import 'package:dlovera_app/models/chart_data.model.dart';
import 'package:dlovera_app/models/laporan.model.dart';
import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/requests/laporan_pembelian.request.dart';
import 'package:dlovera_app/view_models/base.view_model.dart';
import 'package:dlovera_app/views/pages/laporan_pembelian/laporan_pembelian_all_retur.page.dart';
import 'package:dlovera_app/views/pages/laporan_pembelian/laporan_pembelian_all_transaksi.page.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/retur.data_source.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/transaksi.data_source.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanPembelianViewModel extends MyBaseViewModel {

  LaporanPembelianViewModel(BuildContext context){
    viewContext = context;
  }

  LaporanPembelianRequest laporanPembelianRequest = LaporanPembelianRequest();
  LaporanChartData? laporanChartData;
  LaporanPerBulanData? laporanPerBulanData;
  List<ChartData>? dataChart = [];
  int? selectedYear = 2022;
  int currentPageTransaksi = 1;
  int currentPageRetur = 1;
  String? selectedMonth = '';
  LaporanTransaksiDataSource? laporanPenjualanTransaksiDataSource;
  LaporanReturDataSource? laporanPenjualanReturDataSource;


  @override
  void initialise() async {
    getLaporanPembelianChart("", isGetPerBulan: true);
  }

  onReload() async {
    getLaporanPembelianChart("");
    getLaporanPembelianPerBulan(selectedMonth, selectedYear);
  }

  //
  getLaporanPembelianChart(String? year, {bool isGetPerBulan = false}) async {
    setBusy(true);
    try {

      laporanChartData = await laporanPembelianRequest.getLaporanPenjualanChart({
        'tahun': year ?? "",
      });

      setDataChart();

      if(isGetPerBulan){
        getLaporanPembelianPerBulan("", "");
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
  getLaporanPembelianPerBulan(month, year) async {
    setBusyForObject(laporanPerBulanData, true);
    laporanPerBulanData = await laporanPembelianRequest.getLaporanPenjualanPerBulan(
        {
          'tahun': year ?? 2022,
          'bulan': month ?? 1,
        }
    );

    if(year != "") {
      selectedMonth = month;
      selectedYear = year;
      notifyListeners();
    }
    try{


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
  getDataPaginationTransaksi(pageNumber) async {
    setBusyForObject(laporanPenjualanTransaksiDataSource, true);

    try{

      laporanPerBulanData = await laporanPembelianRequest.getLaporanPenjualanPerBulan(
          {
            'tahun': selectedYear.toString(),
            'bulan': selectedMonth,
            'transaksi_page_number': pageNumber
          }
      );

      laporanPenjualanTransaksiDataSource?.dispose();
      laporanPenjualanTransaksiDataSource = LaporanTransaksiDataSource(
          transaksi: laporanPerBulanData?.transaksi?.data ?? []);

    } catch (error) {
      print("Error ==> $error");
      setError(error);
      viewContext?.showToast(
        msg: "$error",
        bgColor: Colors.red,
      );
    }

    setBusyForObject(laporanPenjualanTransaksiDataSource, false);
  }

  //
  getDataPaginationRetur(pageNumber) async {
    setBusyForObject(laporanPenjualanReturDataSource, true);

    try{

      laporanPerBulanData = await laporanPembelianRequest.getLaporanPenjualanPerBulan(
          {
            'tahun': selectedYear.toString(),
            'bulan': selectedMonth,
            'retur_page_number': pageNumber
          }
      );

      laporanPenjualanReturDataSource?.dispose();
      laporanPenjualanReturDataSource = LaporanReturDataSource(
          retur: laporanPerBulanData?.retur?.data ?? []);

    } catch (error) {
      print("Error ==> $error");
      setError(error);
      viewContext?.showToast(
        msg: "$error",
        bgColor: Colors.red,
      );
    }

    setBusyForObject(laporanPenjualanReturDataSource, false);
  }

  //
  setDataChart() {
    dataChart?.clear();
    laporanChartData?.statistic?.forEach((element) {
      dataChart?.add(ChartData(element.bulan ?? "", element.total ?? "", num: element.num));
    });
  }

  //
  onPageChangeAllTransaksi(number, {month, year}){
    currentPageTransaksi = number;
    if(month != null){
      selectedYear = year;
      selectedMonth = month;
    }
    notifyListeners();
    getDataPaginationTransaksi(number);
  }

  //
  onPageChangeAllRetur(number, {month, year}){
    currentPageTransaksi = number;
    if(month != null){
      selectedYear = year;
      selectedMonth = month;
    }
    notifyListeners();
    getDataPaginationRetur(number);
  }

  navigateToAllTransaksi(LaporanPembelianViewModel vm) {
    viewContext?.navigator?.push(
        MaterialPageRoute(builder: (context) => LaporanPembelianAllTransaksiPage(
          viewModel: vm,
        ))
    );
  }

  navigateToAllRetur(LaporanPembelianViewModel vm) {
    viewContext?.navigator?.push(
        MaterialPageRoute(builder: (context) => LaporanPembelianAllReturPage(
          vm: vm,
        ))
    );
  }
}