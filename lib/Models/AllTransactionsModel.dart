class TransactionDetails {
  late double amount;
  late String category;
  late String currency;
  late String date;
  late String description;
  late String type;

  TransactionDetails(
      {required this.amount,
        required this.category,
        required this.currency,
        required this.date,
        required this.description,
        required this.type});

  TransactionDetails.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    category = json['category'];
    currency = json['currency'];
    date = json['date'];
    description = json['description'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['category'] = this.category;
    data['currency'] = this.currency;
    data['date'] = this.date;
    data['description'] = this.description;
    data['type'] = this.type;
    return data;
  }
}