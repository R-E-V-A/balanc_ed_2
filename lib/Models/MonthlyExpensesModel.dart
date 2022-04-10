class MonthlyExpense {
  late String date;
  late int totalExpense;

  MonthlyExpense({required this.date, required this.totalExpense});

  MonthlyExpense.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    totalExpense = json['TOTAL EXPENSE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['TOTAL EXPENSE'] = this.totalExpense;
    return data;
  }
}
