class KartuStokHeader {
  String? message;
  KartuStokData? data;

  KartuStokHeader({this.message, this.data});

  KartuStokHeader.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? KartuStokData.fromJson(json['data']) : null;
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

class KartuStokData {
  String? kodeBarang;
  String? namaBarang;
  String? merk;
  String? hargaSatuan;
  String? kategori;
  String? satuan;
  List<DataTableKartuStok>? product;
  dynamic totalMasuk;
  dynamic totalKeluar;
  dynamic totalRetur;
  dynamic totalSisa;

  KartuStokData(
      {this.kodeBarang,
        this.namaBarang,
        this.merk,
        this.hargaSatuan,
        this.kategori,
        this.satuan,
        this.product,
        this.totalMasuk,
        this.totalKeluar,
        this.totalRetur,
        this.totalSisa});

  KartuStokData.fromJson(Map<String, dynamic> json) {
    kodeBarang = json['kodeBarang'];
    namaBarang = json['namaBarang'];
    merk = json['merk'];
    hargaSatuan = json['hargaSatuan'];
    kategori = json['kategori'];
    satuan = json['satuan'];
    if (json['product'] != null) {
      product = <DataTableKartuStok>[];
      json['product'].forEach((v) {
        product!.add(DataTableKartuStok.fromJson(v));
      });
    }
    totalMasuk = json['totalMasuk'];
    totalKeluar = json['totalKeluar'];
    totalRetur = json['totalRetur'];
    totalSisa = json['totalSisa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kodeBarang'] = kodeBarang;
    data['namaBarang'] = namaBarang;
    data['merk'] = merk;
    data['hargaSatuan'] = hargaSatuan;
    data['kategori'] = kategori;
    data['satuan'] = satuan;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    data['totalMasuk'] = totalMasuk;
    data['totalKeluar'] = totalKeluar;
    data['totalRetur'] = totalRetur;
    data['totalSisa'] = totalSisa;
    return data;
  }
}

class DataTableKartuStok {
  String? tanggal;
  String? kodeBarang;
  String? keterangan;
  int? masuk;
  int? keluar;
  int? retur;
  int? sisa;
  String? createdBy;
  String? createdDate;

  DataTableKartuStok(
      {this.tanggal,
        this.kodeBarang,
        this.keterangan,
        this.masuk,
        this.keluar,
        this.retur,
        this.sisa,
        this.createdBy,
        this.createdDate});

  DataTableKartuStok.fromJson(Map<String, dynamic> json) {
    tanggal = json['tanggal'];
    kodeBarang = json['kode_barang'];
    keterangan = json['keterangan'];
    masuk = json['masuk'];
    keluar = json['keluar'];
    retur = json['retur'];
    sisa = json['sisa'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tanggal'] = tanggal;
    data['kode_barang'] = kodeBarang;
    data['keterangan'] = keterangan;
    data['masuk'] = masuk;
    data['keluar'] = keluar;
    data['retur'] = retur;
    data['sisa'] = sisa;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    return data;
  }
}