
import '../dto/budgetCategory.dart';
import '../dto/budgetTransaction.dart';

class BudgetState {

  List<BudgetTransaction> transactions = [];
  BudgetCategory? budgetCategory;

  BudgetState({
    required this.budgetCategory,
    required this.transactions
  });

  void addTransactions(BudgetTransaction transaction) {
    transactions.add(transaction);
  }

  void topUpBalance(double amount) {
    if (budgetCategory != null) {
      budgetCategory!.budgetCatBalance += amount;
    }
  }

  void setBudgetTarget(double target) {
    if (budgetCategory != null) {
      budgetCategory!.budgetCatTarget = target;
    }
  }

  List<BudgetTransaction> getTransactions() {
    return transactions;
  }

  BudgetCategory? getBudgetCategory () {
    return budgetCategory;
  }

  double getTotalSpent () {
    List<double> transactionAmounts = transactions.map((e) => e.transactionAmount).toList();
    return transactionAmounts.reduce((a, b) => a + b);
  }

}
