
import 'package:dlovera_app/models/chart_data.model.dart';
import 'package:dlovera_app/models/laporan.model.dart';
import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/requests/laporan_produksi.request.dart';
import 'package:dlovera_app/view_models/base.view_model.dart';
import 'package:dlovera_app/views/pages/laporan_produksi/laporan_produksi_all_retur.page.dart';
import 'package:dlovera_app/views/pages/laporan_produksi/laporan_produksi_all_transaksi.page.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/retur.data_source.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/transaksi.data_source.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class LaporanProduksiViewModel extends MyBaseViewModel {

  LaporanProduksiViewModel(BuildContext context){
    viewContext = context;
  }

  LaporanProduksiRequest laporanProduksiRequest = LaporanProduksiRequest();
  LaporanChartData? laporanChartData;
  LaporanPerBulanData? laporanPerBulanData;
  List<ChartData>? dataChart = [];
  int? selectedYear = 2022;
  int currentPageTransaksi = 1;
  int currentPageRetur = 1;
  String? selectedMonth = '';
  LaporanTransaksiDataSource? laporanTransaksiDataSource;
  LaporanReturDataSource? laporanReturDataSource;


  @override
  void initialise() async {
    getLaporanProduksiChart("", isGetPerBulan: true);
  }

  //
  onReload() async {
    getLaporanProduksiChart("");
    getLaporanProduksiPerBulan(selectedMonth, selectedYear);
  }

  //
  getLaporanProduksiChart(String? year, {bool isGetPerBulan = false}) async {
    setBusy(true);
    try {

      laporanChartData = await laporanProduksiRequest.getLaporanProduksiChart({
        'tahun': year ?? "",
      });

      print('data $laporanChartData');
      setDataChart();

      if(isGetPerBulan){
        getLaporanProduksiPerBulan("", "");
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
  getLaporanProduksiPerBulan(month, year) async {
    setBusyForObject(laporanPerBulanData, true);

    try{
      laporanPerBulanData = await laporanProduksiRequest.getLaporanProduksiPerBulan(
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
    setBusyForObject(laporanTransaksiDataSource, true);

    try{

      laporanPerBulanData = await laporanProduksiRequest.getLaporanProduksiPerBulan(
          {
            'tahun': selectedYear.toString(),
            'bulan': selectedMonth,
            'transaksi_page_number': pageNumber
          }
      );

      laporanTransaksiDataSource?.dispose();
      laporanTransaksiDataSource = LaporanTransaksiDataSource(
          transaksi: laporanPerBulanData?.transaksi?.data ?? []);

    } catch (error) {
      print("Error ==> $error");
      setError(error);
      viewContext?.showToast(
        msg: "$error",
        bgColor: Colors.red,
      );
    }

    setBusyForObject(laporanTransaksiDataSource, false);
  }

  //
  getDataPaginationRetur(pageNumber) async {
    setBusyForObject(laporanReturDataSource, true);

    try{

      laporanPerBulanData = await laporanProduksiRequest.getLaporanProduksiPerBulan(
          {
            'tahun': selectedYear.toString(),
            'bulan': selectedMonth,
            'retur_page_number': pageNumber
          }
      );

      laporanReturDataSource?.dispose();
      laporanReturDataSource = LaporanReturDataSource(
          retur: laporanPerBulanData?.retur?.data ?? []);

    } catch (error) {
      print("Error ==> $error");
      setError(error);
      viewContext?.showToast(
        msg: "$error",
        bgColor: Colors.red,
      );
    }

    setBusyForObject(laporanReturDataSource, false);
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

  navigateToAllTransaksi(LaporanProduksiViewModel vm) {
    viewContext?.navigator?.push(
        MaterialPageRoute(builder: (context) => LaporanProduksiAllTransaksiPage(
          viewModel: vm,
        ))
    );
  }

  navigateToAllRetur(LaporanProduksiViewModel vm) {
    viewContext?.navigator?.push(
        MaterialPageRoute(builder: (context) => LaporanProduksiAllReturPage(
          vm: vm,
        ))
    );
  }
}