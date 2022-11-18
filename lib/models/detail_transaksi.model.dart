class DetailTransaksiHeader {
  String? message;
  DetailTransaksiData? data;

  DetailTransaksiHeader({this.message, this.data});

  DetailTransaksiHeader.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? DetailTransaksiData.fromJson(json['data']) : null;
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

class DetailTransaksiData {
  String? faktur;
  String? tanggal;
  String? konsumen;
  String? statusBayar;
  String? statusPengiriman;
  List<DetailTransaksiProduct>? product;
  String? totalQty;
  String? allTotal;
  String? buktiPembayaran;
  String? buktiPengiriman;

  DetailTransaksiData(
      {this.faktur,
        this.tanggal,
        this.konsumen,
        this.statusBayar,
        this.statusPengiriman,
        this.product,
        this.totalQty,
        this.allTotal,
        this.buktiPembayaran,
        this.buktiPengiriman});

  DetailTransaksiData.fromJson(Map<String, dynamic> json) {
    faktur = json['faktur'];
    tanggal = json['tanggal'];
    konsumen = json['konsumen'];
    statusBayar = json['statusBayar'];
    statusPengiriman = json['statusPengiriman'];
    if (json['product'] != null) {
      product = <DetailTransaksiProduct>[];
      json['product'].forEach((v) {
        product!.add(DetailTransaksiProduct.fromJson(v));
      });
    }
    totalQty = json['totalQty'];
    allTotal = json['allTotal'];
    buktiPembayaran = json['buktiPembayaran'];
    buktiPengiriman = json['buktiPengiriman'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['faktur'] = faktur;
    data['tanggal'] = tanggal;
    data['konsumen'] = konsumen;
    data['statusBayar'] = statusBayar;
    data['statusPengiriman'] = statusPengiriman;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    data['totalQty'] = totalQty;
    data['allTotal'] = allTotal;
    data['buktiPembayaran'] = buktiPembayaran;
    data['buktiPengiriman'] = buktiPengiriman;
    return data;
  }
}

class DetailTransaksiProduct {
  String? namaBarang;
  String? hargaSatuan;
  dynamic jumlah;
  String? total;

  DetailTransaksiProduct({this.namaBarang, this.hargaSatuan, this.jumlah, this.total});

  DetailTransaksiProduct.fromJson(Map<String, dynamic> json) {
    namaBarang = json['nama_barang'];
    hargaSatuan = json['harga_satuan'];
    jumlah = json['jumlah'].toString();
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_barang'] = namaBarang;
    data['harga_satuan'] = hargaSatuan;
    data['jumlah'] = jumlah;
    data['total'] = total;
    return data;
  }
}
