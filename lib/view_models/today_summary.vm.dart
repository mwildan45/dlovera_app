
import 'package:dlovera_app/models/chart_data.model.dart';
import 'package:dlovera_app/models/today_summary.model.dart';
import 'package:dlovera_app/requests/today_summary.request.dart';
import 'package:dlovera_app/view_models/base.view_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TodaySummaryViewModel extends MyBaseViewModel {

  TodaySummaryViewModel(BuildContext context){
    viewContext = context;
  }

  TodaySummaryData? todaySummaryData;
  TodaySummaryRequest todaySummaryRequest = TodaySummaryRequest();
  List<ChartData>? dataChart;
  DateTime? selectedTgl;


  @override
  void initialise() async {
    getTodaySummary();
  }

  getTodaySummary() async {
    setBusy(true);
    try {

      todaySummaryData = await todaySummaryRequest.getTodaySummary((selectedTgl == null ? "" : "${selectedTgl!.year}-${selectedTgl!.month}-${selectedTgl!.day.toString().padLeft(2,"0")}"));
      setDataChart(todaySummaryData);

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
  onTglSelected(DateTime date) {
    print('confirm $date');
    selectedTgl = date;
    notifyListeners();
    getTodaySummary();
  }


  setDataChart(data) {
    dataChart = [
      ChartData(data.statistic!.toJson().keys.toList()[0].toString(),
          data.statistic!.i0003?.toString() ?? ""),
      ChartData(data.statistic!.toJson().keys.toList()[1].toString(),
          data.statistic!.i0306?.toString() ?? ""),
      ChartData(data.statistic!.toJson().keys.toList()[2].toString(),
          data.statistic!.s0609?.toString() ?? ""),
      ChartData(data.statistic!.toJson().keys.toList()[3].toString(),
          data.statistic!.s0912?.toString() ?? ""),
      ChartData(data.statistic!.toJson().keys.toList()[4].toString(),
          data.statistic!.s1215?.toString() ?? ""),
      ChartData(data.statistic!.toJson().keys.toList()[5].toString(),
          data.statistic!.i1518?.toString() ?? ""),
      ChartData(data.statistic!.toJson().keys.toList()[6].toString(),
          data.statistic!.i1821?.toString() ?? ""),
      ChartData(data.statistic!.toJson().keys.toList()[7].toString(),
          data.statistic!.s2123?.toString() ?? ""),
    ];
  }

  seeAllTransactionsNav(PageController pageViewController){
    pageViewController.animateToPage(
      1,
      duration: const Duration(microseconds: 5),
      curve: Curves.bounceInOut,
    );
  }

}