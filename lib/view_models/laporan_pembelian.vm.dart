
import 'package:dlovera_app/models/chart_data.model.dart';
import 'package:dlovera_app/models/detail_transaksi.model.dart';
import 'package:dlovera_app/models/laporan.model.dart';
import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/requests/laporan_pembelian.request.dart';
import 'package:dlovera_app/requests/laporan_penjualan.request.dart';
import 'package:dlovera_app/view_models/base.view_model.dart';
import 'package:dlovera_app/views/pages/laporan_pembelian/laporan_pembelian_all_retur.page.dart';
import 'package:dlovera_app/views/pages/laporan_pembelian/laporan_pembelian_all_transaksi.page.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/detailed/detail_transaksi.data_source.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/retur.data_source.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/transaksi.data_source.dart';
import 'package:dlovera_app/widgets/dialogs/detail_transaksi_all.dialog.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:month_year_picker/month_year_picker.dart';
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
  dynamic selectedDay = 1;
  int currentPageTransaksi = 1;
  int currentPageRetur = 1;
  String? selectedMonth = '';
  LaporanTransaksiDataSource? laporanTransaksiDataSource;
  LaporanReturDataSource? laporanReturDataSource;
  DateTime? selectedDate;
  LaporanPenjualanRequest laporanPenjualanRequest = LaporanPenjualanRequest();
  LaporanDetailTransaksiDataSource? laporanDetailTransaksiDataSource;
  DetailTransaksiHeader? detailTransaksiHeader;


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
      selectedMonth = selectedDate!.month.toString();
      selectedYear = selectedDate!.year;
      notifyListeners();
      print("yaer ${selectedDate!.year.toString()}");
      getLaporanPembelianChart(selectedDate!.year.toString(), selectedDate!.month.toString(), isGetPerBulan: false);
    }
  }


  @override
  void initialise() async {
    // getLaporanPembelianChart("", isGetPerBulan: true);
  }

  onReload() async {
    getLaporanPembelianChart(selectedDate!.year.toString(), selectedDate!.month.toString());
    getLaporanPembelianPerBulan(selectedMonth, selectedYear, selectedDay);
  }

  //
  getLaporanPembelianChart(String? year, String month, {bool isGetPerBulan = false}) async {
    setBusy(true);
    try {

      laporanChartData = await laporanPembelianRequest.getLaporanPenjualanChart({
        'tahun': year ?? "",
        'bulan': month
      });

      setDataChart();

      if(laporanChartData?.statistic != null) {
        if (isGetPerBulan) {
          getLaporanPembelianPerBulan("", "", "");
        }
      }else{
        viewContext?.showToast(
          msg: "tidak ada data di tanggal ini",
          bgColor: Colors.red,
        );
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
  getLaporanPembelianPerBulan(month, year, day) async {
    setBusyForObject(laporanPerBulanData, true);
    laporanPerBulanData = await laporanPembelianRequest.getLaporanPenjualanPerBulan(
        {
          'tahun': year ?? 2022,
          'bulan': month ?? 1,
          'tanggal': day ?? 1,
        }
    );

    if(year != "") {
      selectedMonth = month;
      selectedYear = year;
      selectedDay = day;
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
    setBusyForObject(laporanTransaksiDataSource, true);

    try{

      laporanPerBulanData = await laporanPembelianRequest.getLaporanPenjualanPerBulan(
          {
            'tahun': selectedYear.toString(),
            'bulan': selectedMonth,
            'tanggal': selectedDay,
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

      laporanPerBulanData = await laporanPembelianRequest.getLaporanPenjualanPerBulan(
          {
            'tahun': selectedYear.toString(),
            'bulan': selectedMonth,
            'tanggal': selectedDay,
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
  void getDetailTransaksi(idb, url) async {
    // setBusyForObject(kartuStokHeader, true);
    viewContext!.loaderOverlay.show();

    try{
      detailTransaksiHeader = await laporanPenjualanRequest.getDetailTransaksi(idb, url);

      laporanDetailTransaksiDataSource?.dispose();
      laporanDetailTransaksiDataSource = LaporanDetailTransaksiDataSource(
          detailTransaksi: detailTransaksiHeader?.data?.product ?? []);

      DialogDetailTransaksiAll(viewContext, data: detailTransaksiHeader?.data, laporanDetailTransaksiDataSource: laporanDetailTransaksiDataSource!);

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
  setDataChart() {
    dataChart?.clear();
    laporanChartData?.statistic?.forEach((element) {
      dataChart?.add(ChartData(element.bulan ?? "", element.total ?? "", num: element.num));
    });
  }

  //
  onPageChangeAllTransaksi(number, {month, year, day}){
    currentPageTransaksi = number;
    if(month != null){
      selectedYear = year;
      selectedMonth = month;
      selectedDay = day;
    }
    notifyListeners();
    getDataPaginationTransaksi(number);
  }

  //
  onPageChangeAllRetur(number, {month, year, day}){
    currentPageTransaksi = number;
    if(month != null){
      selectedYear = year;
      selectedMonth = month;
      selectedDay = day;
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