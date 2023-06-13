enum ExpenseCategory { grocery, shopping, eating, entertainment, bill }

class ExpenseList {
  ExpenseList(
      {required this.title,
      required this.date,
      required this.amount,
      required this.category});
  String title;
  DateTime date;
  double amount;
  ExpenseCategory category;
}
