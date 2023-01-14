class LaporanPerBulanHeader {
  String? message;
  LaporanPerBulanData? data;

  LaporanPerBulanHeader({this.message, this.data});

  LaporanPerBulanHeader.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null
        ? LaporanPerBulanData.fromJson(json['data'])
        : null;
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
  dynamic? year;
  dynamic? month;
  dynamic day;
  RataRata? rataRata;
  String? transaksiTertinggi;
  String? transaksiTerendah;
  List<LaporanPerBulanProdukTerlaris>? produkTerlaris;
  List<LaporanPerBulanPelangganSetia>? pelangganSetia;
  List<LaporanProduksiPerBulanCMTLangganan>? langganan;
  Transaksi? transaksi;
  Retur? retur;
  Produk? produk;

  LaporanPerBulanData({
    this.year,
    this.month,
    this.day,
    this.rataRata,
    this.transaksiTertinggi,
    this.transaksiTerendah,
    this.produkTerlaris,
    this.pelangganSetia,
    this.transaksi,
    this.retur,
    this.produk,
  });

  LaporanPerBulanData.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    day = json['day'];
    rataRata =
        json['rataRata'] != null ? RataRata.fromJson(json['rataRata']) : null;
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
    retur = json['retur'] != null ? Retur.fromJson(json['retur']) : null;
    produk = json['produk'] != null ? Produk.fromJson(json['produk']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['month'] = month;
    data['day'] = day;
    if (rataRata != null) {
      data['rataRata'] = rataRata!.toJson();
    }
    data['transaksiTertinggi'] = transaksiTertinggi;
    data['transaksiTerendah'] = transaksiTerendah;
    if (produkTerlaris != null) {
      data['produkTerlaris'] = produkTerlaris!.map((v) => v.toJson()).toList();
    }
    if (pelangganSetia != null) {
      data['pelangganSetia'] = pelangganSetia!.map((v) => v.toJson()).toList();
    }
    if (transaksi != null) {
      data['transaksi'] = transaksi!.toJson();
    }
    if (retur != null) {
      data['retur'] = retur!.toJson();
    }
    if (produk != null) {
      data['produk'] = produk!.toJson();
    }
    return data;
  }
}

class RataRata {
  String? nilaiTransaksi;
  String? jumlahProduk;
  String? produkTerjual;
  int? produkRetur;

  RataRata({this.nilaiTransaksi, this.jumlahProduk});

  RataRata.fromJson(Map<String, dynamic> json) {
    nilaiTransaksi = json['nilaiTransaksi'];
    jumlahProduk = json['jumlahProduk'];
    produkTerjual = json['produkTerjual'];
    produkRetur = json['produkRetur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nilaiTransaksi'] = nilaiTransaksi;
    data['jumlahProduk'] = jumlahProduk;
    data['produkTerjual'] = produkTerjual;
    data['produkRetur'] = produkRetur;
    return data;
  }
}

class LaporanPerBulanProdukTerlaris {
  String? kodeBarang;
  String? namaBarang;
  String? sumJumlah;

  LaporanPerBulanProdukTerlaris(
      {this.kodeBarang, this.namaBarang, this.sumJumlah});

  LaporanPerBulanProdukTerlaris.fromJson(Map<String, dynamic> json) {
    kodeBarang = json['kode_barang'];
    namaBarang = json['nama_barang'];
    sumJumlah = json['sumJumlah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_barang'] = kodeBarang;
    data['nama_barang'] = namaBarang;
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

  LaporanPerBulanPelangganSetia(
      {this.kodeCustomer,
      this.kodeSupplier,
      this.namaSupplier,
      this.namaCustomer,
      this.countCustomer});

  LaporanPerBulanPelangganSetia.fromJson(Map<String, dynamic> json) {
    kodeCustomer = json['kode_customer'];
    kodeSupplier = json['kode_supplier'];
    namaCustomer = json['nama_customer'];
    namaSupplier = json['nama_supplier'];
    countCustomer = json['countCustomer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Kode_Customer'] = kodeCustomer;
    data['kode_supplier'] = kodeSupplier;
    data['nama_customer'] = namaCustomer;
    data['nama_supplier'] = namaSupplier;
    data['countCustomer'] = countCustomer;
    return data;
  }
}

class LaporanProduksiPerBulanCMTLangganan {
  String? kodeProdusen;
  String? namaProdusen;
  dynamic? countCustomer;

  LaporanProduksiPerBulanCMTLangganan(
      {this.kodeProdusen, this.namaProdusen, this.countCustomer});

  LaporanProduksiPerBulanCMTLangganan.fromJson(Map<String, dynamic> json) {
    kodeProdusen = json['kode_produsen'];
    namaProdusen = json['nama_produsen'];
    countCustomer = json['countProdusen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_produsen'] = kodeProdusen;
    data['nama_produsen'] = namaProdusen;
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

class Produk {
  int? currentPage;
  List<LaporanPerBulanProdukData>? data;
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

  Produk(
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

  Produk.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <LaporanPerBulanProdukData>[];
      json['data'].forEach((v) {
        data!.add(LaporanPerBulanProdukData.fromJson(v));
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
  String? namaProdusen;
  String? namaBarang;
  String? total;
  String? bayar;
  String? kirim;

  LaporanPerBulanTransaksiData(
      {this.noFaktur,
      this.tanggal,
      this.namaCustomer,
      this.namaSupplier,
      this.namaProdusen,
      this.namaBarang,
      this.total, this.bayar, this.kirim});

  LaporanPerBulanTransaksiData.fromJson(Map<String, dynamic> json) {
    noFaktur = json['no_faktur'];
    tanggal = json['tanggal'];
    namaCustomer = json['nama_customer'];
    namaSupplier = json['nama_supplier'];
    namaProdusen = json['nama_produsen'];
    namaBarang = json['nama_barang'];
    total = json['total'];
    bayar = json['bayar'];
    kirim = json['kirim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_faktur'] = noFaktur;
    data['tanggal'] = tanggal;
    data['nama_customer'] = namaCustomer;
    data['nama_supplier'] = namaSupplier;
    data['nama_produsen'] = namaProdusen;
    data['nama_barang'] = namaBarang;
    data['total'] = total;
    data['bayar'] = bayar;
    data['kirim'] = kirim;
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
  String? namaProdusen;
  String? namaBarang;
  String? alasan;

  LaporanPerBulanReturData(
      {this.noFaktur,
      this.tanggal,
      this.namaCustomer,
      this.namaSupplier,
      this.namaBarang,
      this.namaProdusen,
      this.alasan});

  LaporanPerBulanReturData.fromJson(Map<String, dynamic> json) {
    noFaktur = json['no_faktur'];
    tanggal = json['tanggal'];
    namaCustomer = json['nama_customer'];
    namaSupplier = json['nama_supplier'];
    namaProdusen = json['nama_produsen'];
    namaBarang = json['nama_barang'];
    alasan = json['alasan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_faktur'] = noFaktur;
    data['tanggal'] = tanggal;
    data['nama_customer'] = namaCustomer;
    data['nama_supplier'] = namaSupplier;
    data['nama_produsen'] = namaProdusen;
    data['nama_barang'] = namaBarang;
    data['alasan'] = alasan;
    return data;
  }
}

class LaporanPerBulanProdukData {
  String? kodeBarang;
  String? barcode;
  String? namaBarang;
  String? golongan;
  int? stockAkhir;

  LaporanPerBulanProdukData(
      {this.kodeBarang,
      this.barcode,
      this.namaBarang,
      this.golongan,
      this.stockAkhir});

  LaporanPerBulanProdukData.fromJson(Map<String, dynamic> json) {
    kodeBarang = json['kode_barang'];
    barcode = json['barcode'];
    namaBarang = json['nama_barang'];
    golongan = json['golongan'];
    stockAkhir = json['stock_akhir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode_barang'] = this.kodeBarang;
    data['barcode'] = this.barcode;
    data['nama_barang'] = this.namaBarang;
    data['golongan'] = this.golongan;
    data['stock_akhir'] = this.stockAkhir;
    return data;
  }
}
