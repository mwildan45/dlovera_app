
import 'package:dlovera_app/models/chart_data.model.dart';
import 'package:dlovera_app/models/laporan_penjualan.model.dart';
import 'package:dlovera_app/models/laporan_penjualan_per_bulan.model.dart';
import 'package:dlovera_app/requests/laporan_penjualan.request.dart';
import 'package:dlovera_app/view_models/base.view_model.dart';
import 'package:dlovera_app/views/pages/laporan_penjualan/laporan_penjualan_all_retur.page.dart';
import 'package:dlovera_app/views/pages/laporan_penjualan/laporan_penjualan_all_transaksi.page.dart';
import 'package:dlovera_app/widgets/datatables/laporan_penjualan/retur.laporan_penjualan.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/datatables/laporan_penjualan/transaksi.laporan_penjualan.dart';

class LaporanPenjualanViewModel extends MyBaseViewModel {

  LaporanPenjualanViewModel(BuildContext context){
    viewContext = context;
  }

  LaporanPenjualanRequest laporanPenjualanRequest = LaporanPenjualanRequest();
  LaporanPenjualanData? laporanPenjualanData;
  LaporanPenjualanPerBulanData? laporanPenjualanPerBulanData;
  List<ChartData>? dataChart = [];
  int? selectedYear = 2022;
  int currentPageTransaksi = 1;
  int currentPageRetur = 1;
  String? selectedMonth = '';
  LaporanPenjualanTransaksiDataSource? laporanPenjualanTransaksiDataSource;
  LaporanPenjualanReturDataSource? laporanPenjualanReturDataSource;


  @override
  void initialise() async {
    geLaporanPenjualanChart("", isGetPerBulan: true);
  }

  //
  geLaporanPenjualanChart(String? year, {bool isGetPerBulan = false}) async {
    setBusy(true);
    try {

      laporanPenjualanData = await laporanPenjualanRequest.getLaporanPenjualanChart({
        'tahun': year ?? "",
      });

      setDataChart();

      if(isGetPerBulan){
        getLaporanPenjualanPerBulan("", "");
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
  getLaporanPenjualanPerBulan(String? month, String? year) async {
    setBusyForObject(laporanPenjualanPerBulanData, true);

    try{
      laporanPenjualanPerBulanData = await laporanPenjualanRequest.getLaporanPenjualanPerBulan(
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

    setBusyForObject(laporanPenjualanPerBulanData, false);
  }

  //
  getDataPaginationTransaksi(pageNumber) async {
    setBusyForObject(laporanPenjualanTransaksiDataSource, true);

    try{

      laporanPenjualanPerBulanData = await laporanPenjualanRequest.getLaporanPenjualanPerBulan(
          {
            'tahun': selectedYear.toString(),
            'bulan': selectedMonth,
            'transaksi_page_number': pageNumber
          }
      );

      laporanPenjualanTransaksiDataSource?.dispose();
      laporanPenjualanTransaksiDataSource = LaporanPenjualanTransaksiDataSource(
          transaksi: laporanPenjualanPerBulanData?.transaksi?.data ?? []);

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

      laporanPenjualanPerBulanData = await laporanPenjualanRequest.getLaporanPenjualanPerBulan(
          {
            'tahun': selectedYear.toString(),
            'bulan': selectedMonth,
            'retur_page_number': pageNumber
          }
      );

      laporanPenjualanReturDataSource?.dispose();
      laporanPenjualanReturDataSource = LaporanPenjualanReturDataSource(
          retur: laporanPenjualanPerBulanData?.retur?.data ?? []);

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
    laporanPenjualanData?.statistic?.forEach((element) {
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

  navigateToAllTransaksi(LaporanPenjualanViewModel vm) {
    viewContext?.navigator?.push(
      MaterialPageRoute(builder: (context) => LaporanPenjualanAllTransaksiPage(
        viewModel: vm,
      ))
    );
  }

  navigateToAllRetur(LaporanPenjualanViewModel vm) {
    viewContext?.navigator?.push(
        MaterialPageRoute(builder: (context) => LaporanPenjualanAllReturPage(
          vm: vm,
        ))
    );
  }
}