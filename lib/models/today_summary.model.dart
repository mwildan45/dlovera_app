class TodaySummaryHeader {
  String? message;
  TodaySummaryData? data;

  TodaySummaryHeader({this.message, this.data});

  TodaySummaryHeader.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? TodaySummaryData.fromJson(json['data']) : null;
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

class TodaySummaryData {
  TotalRevenue? totalRevenue;
  ItemSold? itemSold;
  Customer? customer;
  Statistic? statistic;
  List<LatestTransaction>? latestTransaction;

  TodaySummaryData(
      {this.totalRevenue,
        this.itemSold,
        this.customer,
        this.statistic,
        this.latestTransaction});

  TodaySummaryData.fromJson(Map<String, dynamic> json) {
    totalRevenue = json['totalRevenue'] != null
        ? TotalRevenue.fromJson(json['totalRevenue'])
        : null;
    itemSold = json['itemSold'] != null
        ? ItemSold.fromJson(json['itemSold'])
        : null;
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    statistic = json['statistic'] != null
        ? Statistic.fromJson(json['statistic'])
        : null;
    if (json['latestTransaction'] != null) {
      latestTransaction = <LatestTransaction>[];
      json['latestTransaction'].forEach((v) {
        latestTransaction!.add(LatestTransaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (totalRevenue != null) {
      data['totalRevenue'] = totalRevenue!.toJson();
    }
    if (itemSold != null) {
      data['itemSold'] = itemSold!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (statistic != null) {
      data['statistic'] = statistic!.toJson();
    }
    if (latestTransaction != null) {
      data['latestTransaction'] =
          latestTransaction!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TotalRevenue {
  String? total;
  String? yesterdayData;
  double? percent;

  TotalRevenue({this.total, this.yesterdayData, this.percent});

  TotalRevenue.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    yesterdayData = json['yesterdayData'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['yesterdayData'] = yesterdayData;
    data['percent'] = percent;
    return data;
  }
}

class ItemSold {
  int? total;
  int? yesterdayData;
  double? percent;

  ItemSold({this.total, this.yesterdayData, this.percent});

  ItemSold.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    yesterdayData = json['yesterdayData'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['yesterdayData'] = yesterdayData;
    data['percent'] = percent;
    return data;
  }
}

class Customer {
  int? total;
  int? yesterdayData;
  double? percent;

  Customer({this.total, this.yesterdayData, this.percent});

  Customer.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    yesterdayData = json['yesterdayData'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = this.total;
    data['yesterdayData'] = this.yesterdayData;
    data['percent'] = this.percent;
    return data;
  }
}

class Statistic {
  int? max;
  int? i0003;
  int? i0306;
  String? s0609;
  String? s0912;
  String? s1215;
  int? i1518;
  int? i1821;
  String? s2123;

  Statistic(
      {this.max,
        this.i0003,
        this.i0306,
        this.s0609,
        this.s0912,
        this.s1215,
        this.i1518,
        this.i1821,
        this.s2123});

  Statistic.fromJson(Map<String, dynamic> json) {
    i0003 = json['00-03'];
    i0306 = json['03-06'];
    s0609 = json['06-09'];
    s0912 = json['09-12'];
    s1215 = json['12-15'];
    i1518 = json['15-18'];
    i1821 = json['18-21'];
    s2123 = json['21-00'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['00-03'] = i0003;
    data['03-06'] = i0306;
    data['06-09'] = s0609;
    data['09-12'] = s0912;
    data['12-15'] = s1215;
    data['15-18'] = i1518;
    data['18-21'] = i1821;
    data['21-00'] = s2123;
    data['max'] = max;
    return data;
  }
}

class LatestTransaction {
  String? noFaktur;
  String? namaCustomer;
  String? grandTotal;
  String? tanggal;

  LatestTransaction(
      {this.noFaktur, this.namaCustomer, this.grandTotal, this.tanggal});

  LatestTransaction.fromJson(Map<String, dynamic> json) {
    noFaktur = json['no_faktur'];
    namaCustomer = json['Nama_Customer'];
    grandTotal = json['grand_total'];
    tanggal = json['tanggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_faktur'] = noFaktur;
    data['Nama_Customer'] = namaCustomer;
    data['grand_total'] = grandTotal;
    data['tanggal'] = tanggal;
    return data;
  }
}
