class NetWorth {
  late String date;
  late int sum;
  late int cumulativeSum;

  NetWorth(
      {required this.date, required this.sum, required this.cumulativeSum});

  NetWorth.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    sum = json['sum'];
    cumulativeSum = json['cumulative sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['sum'] = this.sum;
    data['cumulative sum'] = this.cumulativeSum;
    return data;
  }
}
