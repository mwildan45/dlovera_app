class LaporanPerBulanHeader {
  String? message;
  LaporanPerBulanData? data;

  LaporanPerBulanHeader({this.message, this.data});

  LaporanPerBulanHeader.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? LaporanPerBulanData.fromJson(json['data']) : null;
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

class LaporanPerBulanData {
  String? year;
  String? month;
  RataRata? rataRata;
  String? transaksiTertinggi;
  String? transaksiTerendah;
  List<LaporanPerBulanProdukTerlaris>? produkTerlaris;
  List<LaporanPerBulanPelangganSetia>? pelangganSetia;
  List<LaporanProduksiPerBulanCMTLangganan>? langganan;
  Transaksi? transaksi;
  Retur? retur;

  LaporanPerBulanData(
      {this.year,
        this.month,
        this.rataRata,
        this.transaksiTertinggi,
        this.transaksiTerendah,
        this.produkTerlaris,
        this.pelangganSetia,
        this.transaksi,
        this.retur});

  LaporanPerBulanData.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    rataRata = json['rataRata'] != null
        ? RataRata.fromJson(json['rataRata'])
        : null;
    transaksiTertinggi = json['transaksiTertinggi'];
    transaksiTerendah = json['transaksiTerendah'];
    if (json['produkTerlaris'] != null) {
      produkTerlaris = <LaporanPerBulanProdukTerlaris>[];
      json['produkTerlaris'].forEach((v) {
        produkTerlaris!.add(LaporanPerBulanProdukTerlaris.fromJson(v));
      });
    }
    if (json['pelangganSetia'] != null) {
      pelangganSetia = <LaporanPerBulanPelangganSetia>[];
      json['pelangganSetia'].forEach((v) {
        pelangganSetia!.add(LaporanPerBulanPelangganSetia.fromJson(v));
      });
    }
    if (json['langganan'] != null) {
      langganan = <LaporanProduksiPerBulanCMTLangganan>[];
      json['langganan'].forEach((v) {
        langganan!.add(LaporanProduksiPerBulanCMTLangganan.fromJson(v));
      });
    }
    transaksi = json['transaksi'] != null
        ? Transaksi.fromJson(json['transaksi'])
        : null;
    retur =
    json['retur'] != null ? Retur.fromJson(json['retur']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['month'] = month;
    if (rataRata != null) {
      data['rataRata'] = rataRata!.toJson();
    }
    data['transaksiTertinggi'] = transaksiTertinggi;
    data['transaksiTerendah'] = transaksiTerendah;
    if (produkTerlaris != null) {
      data['produkTerlaris'] =
          produkTerlaris!.map((v) => v.toJson()).toList();
    }
    if (pelangganSetia != null) {
      data['pelangganSetia'] =
          pelangganSetia!.map((v) => v.toJson()).toList();
    }
    if (transaksi != null) {
      data['transaksi'] = transaksi!.toJson();
    }
    if (retur != null) {
      data['retur'] = retur!.toJson();
    }
    return data;
  }
}

class RataRata {
  String? nilaiTransaksi;
  int? jumlahProduk;

  RataRata({this.nilaiTransaksi, this.jumlahProduk});

  RataRata.fromJson(Map<String, dynamic> json) {
    nilaiTransaksi = json['nilaiTransaksi'];
    jumlahProduk = json['jumlahProduk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nilaiTransaksi'] = nilaiTransaksi;
    data['jumlahProduk'] = jumlahProduk;
    return data;
  }
}

class LaporanPerBulanProdukTerlaris {
  String? kodeBarang;
  String? namaBarang;
  String? sumJumlah;

  LaporanPerBulanProdukTerlaris({this.kodeBarang, this.namaBarang, this.sumJumlah});

  LaporanPerBulanProdukTerlaris.fromJson(Map<String, dynamic> json) {
    kodeBarang = json['Kode_Barang'];
    namaBarang = json['Nama_Barang'];
    sumJumlah = json['sumJumlah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Kode_Barang'] = kodeBarang;
    data['Nama_Barang'] = namaBarang;
    data['sumJumlah'] = sumJumlah;
    return data;
  }
}

class LaporanPerBulanPelangganSetia {
  String? kodeCustomer;
  String? kodeSupplier;
  String? namaCustomer;
  String? namaSupplier;
  int? countCustomer;

  LaporanPerBulanPelangganSetia({this.kodeCustomer, this.kodeSupplier, this.namaSupplier, this.namaCustomer, this.countCustomer});

  LaporanPerBulanPelangganSetia.fromJson(Map<String, dynamic> json) {
    kodeCustomer = json['Kode_Customer'];
    kodeSupplier = json['Kode_Supplier'];
    namaCustomer = json['Nama_Customer'];
    namaSupplier = json['Nama_Supplier'];
    countCustomer = json['countCustomer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Kode_Customer'] = kodeCustomer;
    data['Kode_Supplier'] = kodeSupplier;
    data['Nama_Customer'] = namaCustomer;
    data['Nama_Supplier'] = namaSupplier;
    data['countCustomer'] = countCustomer;
    return data;
  }
}

class LaporanProduksiPerBulanCMTLangganan {
  String? kodeProdusen;
  String? namaProdusen;
  int? countCustomer;

  LaporanProduksiPerBulanCMTLangganan({this.kodeProdusen, this.namaProdusen, this.countCustomer});

  LaporanProduksiPerBulanCMTLangganan.fromJson(Map<String, dynamic> json) {
    kodeProdusen = json['Kode_Produsen'];
    namaProdusen = json['Nama_Produsen'];
    countCustomer = json['countProdusen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Kode_Produsen'] = kodeProdusen;
    data['Nama_Produsen'] = namaProdusen;
    data['countCustomer'] = countCustomer;
    return data;
  }
}

class Transaksi {
  int? currentPage;
  List<LaporanPerBulanTransaksiData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Transaksi(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Transaksi.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <LaporanPerBulanTransaksiData>[];
      json['data'].forEach((v) {
        data!.add(LaporanPerBulanTransaksiData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Retur {
  int? currentPage;
  List<LaporanPerBulanReturData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Retur(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Retur.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <LaporanPerBulanReturData>[];
      json['data'].forEach((v) {
        data!.add(LaporanPerBulanReturData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class LaporanPerBulanTransaksiData {
  String? noFaktur;
  String? tanggal;
  String? namaCustomer;
  String? namaSupplier;
  String? namaBarang;
  String? total;

  LaporanPerBulanTransaksiData(
      {this.noFaktur,
        this.tanggal,
        this.namaCustomer,
        this.namaSupplier,
        this.namaBarang,
        this.total});

  LaporanPerBulanTransaksiData.fromJson(Map<String, dynamic> json) {
    noFaktur = json['no_faktur'];
    tanggal = json['tanggal'];
    namaCustomer = json['Nama_Customer'];
    namaSupplier = json['Nama_Supplier'];
    namaBarang = json['Nama_Barang'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_faktur'] = noFaktur;
    data['tanggal'] = tanggal;
    data['Nama_Customer'] = namaCustomer;
    data['Nama_Supplier'] = namaSupplier;
    data['Nama_Barang'] = namaBarang;
    data['total'] = total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}

class LaporanPerBulanReturData {
  String? noFaktur;
  String? tanggal;
  String? namaCustomer;
  String? namaSupplier;
  String? namaBarang;
  String? alasan;

  LaporanPerBulanReturData(
      {this.noFaktur,
        this.tanggal,
        this.namaCustomer,
        this.namaSupplier,
        this.namaBarang,
        this.alasan});

  LaporanPerBulanReturData.fromJson(Map<String, dynamic> json) {
    noFaktur = json['no_faktur'];
    tanggal = json['tanggal'];
    namaCustomer = json['Nama_Customer'];
    namaSupplier = json['Nama_Supplier'];
    namaBarang = json['Nama_Barang'];
    alasan = json['alasan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_faktur'] = noFaktur;
    data['tanggal'] = tanggal;
    data['Nama_Customer'] = namaCustomer;
    data['Nama_Supplier'] = namaSupplier;
    data['Nama_Barang'] = namaBarang;
    data['alasan'] = alasan;
    return data;
  }
}
