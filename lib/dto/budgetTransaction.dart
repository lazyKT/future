
import 'package:uuid/uuid.dart';

class BudgetTransaction {

  final String transactionId;
  final String transactionBudgetId;
  DateTime transactionTime;
  double transactionAmount;
  String transactionDetails;

  BudgetTransaction({
    required this.transactionBudgetId,
    required this.transactionAmount,
    required this.transactionDetails,
    required this.transactionTime
  }) : transactionId = (const Uuid()).v4();

  BudgetTransaction.named({
    required this.transactionBudgetId,
    required this.transactionAmount,
    required this.transactionDetails,
    required this.transactionTime,
    required this.transactionId
  });

  factory BudgetTransaction.fromJson(Map<String, dynamic> json) => BudgetTransaction.named(
    transactionId: json['transactionId'],
    transactionAmount: json['transactionAmount'],
    transactionDetails: json['transactionDetails'],
    transactionTime: DateTime.parse(json['transactionTime']),
    transactionBudgetId: json['transactionBudgetId']
  );
}