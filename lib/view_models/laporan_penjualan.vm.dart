
import 'package:dlovera_app/models/chart_data.model.dart';
import 'package:dlovera_app/models/laporan.model.dart';
import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/requests/laporan_penjualan.request.dart';
import 'package:dlovera_app/view_models/base.view_model.dart';
import 'package:dlovera_app/views/pages/laporan_penjualan/laporan_penjualan_all_retur.page.dart';
import 'package:dlovera_app/views/pages/laporan_penjualan/laporan_penjualan_all_transaksi.page.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/retur.data_source.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/transaksi.data_source.dart';
import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanPenjualanViewModel extends MyBaseViewModel {

  LaporanPenjualanViewModel(BuildContext context){
    viewContext = context;
  }

  LaporanPenjualanRequest laporanPenjualanRequest = LaporanPenjualanRequest();
  LaporanChartData? laporanChartData;
  LaporanPerBulanData? laporanPerBulanData;
  List<ChartData>? dataChart = [];
  int? selectedYear = 2022;
  int currentPageTransaksi = 1;
  int currentPageRetur = 1;
  String? selectedMonth = '';
  LaporanTransaksiDataSource? laporanTransaksiDataSource;
  LaporanReturDataSource? laporanReturDataSource;
  DateTime? selectedDate;


  //pick the month and year first
  Future<void> pickTheDate({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
      locale: localeObj,
    );
    // final selected = await showDatePicker(
    //   context: context,
    //   initialDate: _selected ?? DateTime.now(),
    //   firstDate: DateTime(2019),
    //   lastDate: DateTime(2022),
    //   locale: localeObj,
    // );
    if (selected != null) {
      selectedDate = selected;
      notifyListeners();
    }
  }


  @override
  void initialise() async {
    getLaporanPenjualanChart("", isGetPerBulan: true);
  }


  onReload() async {
    getLaporanPenjualanChart("");
    getLaporanPenjualanPerBulan(selectedMonth, selectedYear);
  }

  //
  getLaporanPenjualanChart(String? year, {bool isGetPerBulan = false}) async {
    setBusy(true);
    try {

      laporanChartData = await laporanPenjualanRequest.getLaporanPenjualanChart({
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
  getLaporanPenjualanPerBulan(month, year) async {
    setBusyForObject(laporanPerBulanData, true);

    try{
      laporanPerBulanData = await laporanPenjualanRequest.getLaporanPenjualanPerBulan(
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

      laporanPerBulanData = await laporanPenjualanRequest.getLaporanPenjualanPerBulan(
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

      laporanPerBulanData = await laporanPenjualanRequest.getLaporanPenjualanPerBulan(
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