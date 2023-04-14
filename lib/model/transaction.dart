class Transaction {
  const Transaction({
    required this.isPayment,
    required this.amount,
    required this.date,
  });

  final bool isPayment;
  final String amount;
  final String date;
}
