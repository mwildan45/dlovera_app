class LaporanPembelianHeader {
  String? message;
  LaporanPembelianData? data;

  LaporanPembelianHeader({this.message, this.data});

  LaporanPembelianHeader.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? LaporanPembelianData.fromJson(json['data']) : null;
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

class LaporanPembelianData {
  String? yearNow;
  String? monthNow;
  String? monthNowNum;
  List<YearList>? yearList;
  int? max;
  List<Statistic>? statistic;

  LaporanPembelianData(
      {this.yearNow,
        this.monthNow,
        this.monthNowNum,
        this.yearList,
        this.max,
        this.statistic});

  LaporanPembelianData.fromJson(Map<String, dynamic> json) {
    yearNow = json['yearNow'];
    monthNow = json['monthNow'];
    monthNowNum = json['monthNowNum'];
    if (json['yearList'] != null) {
      yearList = <YearList>[];
      json['yearList'].forEach((v) {
        yearList!.add(YearList.fromJson(v));
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
    data['monthNow'] = monthNow;
    data['monthNowNum'] = monthNowNum;
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

class YearList {
  int? year;

  YearList({this.year});

  YearList.fromJson(Map<String, dynamic> json) {
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
