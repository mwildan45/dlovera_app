class LaporanChartHeader {
  String? message;
  LaporanChartData? data;

  LaporanChartHeader({this.message, this.data});

  LaporanChartHeader.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? LaporanChartData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LaporanChartData {
  String? yearNow;
  List<LaporanChartYearList>? yearList;
  int? max;
  List<Statistic>? statistic;

  LaporanChartData({this.yearNow, this.yearList, this.statistic, this.max});

  LaporanChartData.fromJson(Map<String, dynamic> json) {
    yearNow = json['yearNow'];
    if (json['yearList'] != null) {
      yearList = <LaporanChartYearList>[];
      json['yearList'].forEach((v) {
        yearList!.add(LaporanChartYearList.fromJson(v));
      });
    }
    max = json['max'];
    if (json['statistic'] != null) {
      statistic = <Statistic>[];
      json['statistic'].forEach((v) {
        statistic!.add(Statistic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['yearNow'] = yearNow;
    if (yearList != null) {
      data['yearList'] = yearList!.map((v) => v.toJson()).toList();
    }
    data['max'] = max;
    if (statistic != null) {
      data['statistic'] = statistic!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LaporanChartYearList {
  int? year;

  LaporanChartYearList({this.year});

  LaporanChartYearList.fromJson(Map<String, dynamic> json) {
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    return data;
  }
}

class Statistic {
  int? num;
  String? bulan;
  String? total;

  Statistic({this.num, this.bulan, this.total});

  Statistic.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    bulan = json['bulan'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num'] = num;
    data['bulan'] = bulan;
    data['total'] = total;
    return data;
  }
}
