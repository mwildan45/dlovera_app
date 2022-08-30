class StockHeader {
  String? message;
  DataStock? data;

  StockHeader({this.message, this.data});

  StockHeader.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? DataStock.fromJson(json['data']) : null;
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

class DataStock {
  Produk? produk;
  Produk? bahanBaku;
  PersediaanProduk? persediaanProduk;
  PersediaanProduk? persediaanBahanBaku;

  DataStock(
      {this.produk,
        this.bahanBaku,
        this.persediaanProduk,
        this.persediaanBahanBaku});

  DataStock.fromJson(Map<String, dynamic> json) {
    produk =
    json['produk'] != null ? Produk.fromJson(json['produk']) : null;
    bahanBaku = json['bahanBaku'] != null
        ? Produk.fromJson(json['bahanBaku'])
        : null;
    persediaanProduk = json['persediaanProduk'] != null
        ? PersediaanProduk.fromJson(json['persediaanProduk'])
        : null;
    persediaanBahanBaku = json['persediaanBahanBaku'] != null
        ? PersediaanProduk.fromJson(json['persediaanBahanBaku'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (produk != null) {
      data['produk'] = produk!.toJson();
    }
    if (bahanBaku != null) {
      data['bahanBaku'] = bahanBaku!.toJson();
    }
    if (persediaanProduk != null) {
      data['persediaanProduk'] = persediaanProduk!.toJson();
    }
    if (persediaanBahanBaku != null) {
      data['persediaanBahanBaku'] = persediaanBahanBaku!.toJson();
    }
    return data;
  }
}

class Produk {
  String? termahal;
  String? termurah;

  Produk({this.termahal, this.termurah});

  Produk.fromJson(Map<String, dynamic> json) {
    termahal = json['termahal'];
    termurah = json['termurah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['termahal'] = termahal;
    data['termurah'] = termurah;
    return data;
  }
}

class PersediaanProduk {
  int? currentPage;
  List<DataProdukBahanBaku>? data;
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

  PersediaanProduk(
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

  PersediaanProduk.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataProdukBahanBaku>[];
      json['data'].forEach((v) {
        data!.add(DataProdukBahanBaku.fromJson(v));
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

class  DataProdukBahanBaku {
  String? kodeBarang;
  String? namaBarang;
  String? hargaSatuan;
  String? golongan;
  dynamic? stockAkhir;

  DataProdukBahanBaku(
      {this.kodeBarang,
        this.namaBarang,
        this.hargaSatuan,
        this.golongan,
        this.stockAkhir});

  DataProdukBahanBaku.fromJson(Map<String, dynamic> json) {
    kodeBarang = json['kode_barang'];
    namaBarang = json['nama_barang'];
    hargaSatuan = json['harga_satuan'];
    golongan = json['golongan'];
    stockAkhir = json['stock_akhir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_barang'] = kodeBarang;
    data['nama_barang'] = namaBarang;
    data['harga_satuan'] = hargaSatuan;
    data['golongan'] = golongan;
    data['stock_akhir'] = stockAkhir;
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
