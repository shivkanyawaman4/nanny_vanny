class PackageModal {
  CurrentBookings? currentBookings;
  List<Packages>? packages;

  PackageModal({this.currentBookings, this.packages});

  PackageModal.fromJson(Map<String, dynamic> json) {
    currentBookings = json['current_bookings'] != null
        ? new CurrentBookings.fromJson(json['current_bookings'])
        : null;
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentBookings != null) {
      data['current_bookings'] = this.currentBookings!.toJson();
    }
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentBookings {
  String? packageLabel;
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  CurrentBookings(
      {this.packageLabel,
      this.fromDate,
      this.fromTime,
      this.toDate,
      this.toTime});

  CurrentBookings.fromJson(Map<String, dynamic> json) {
    packageLabel = json['package_label'];
    fromDate = json['from_date'];
    fromTime = json['from_time'];
    toDate = json['to_date'];
    toTime = json['to_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_label'] = this.packageLabel;
    data['from_date'] = this.fromDate;
    data['from_time'] = this.fromTime;
    data['to_date'] = this.toDate;
    data['to_time'] = this.toTime;
    return data;
  }
}

class Packages {
  int? id;
  String? packageName;
  int? price;
  String? description;

  Packages({this.id, this.packageName, this.price, this.description});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageName = json['package_name'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_name'] = this.packageName;
    data['price'] = this.price;
    data['description'] = this.description;
    return data;
  }
}
