import 'package:budgetplanner/utils/popoup_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class BudgetTile extends StatelessWidget {
  String budgetName;
  int budgetAmount;
  final String name;
  var budgetNameUpdate = TextEditingController();
  var budgetAmountUpdate = TextEditingController();

  Function(BuildContext)? onDelete;
  VoidCallback onUpdate;
  BudgetTile(
      {super.key,
      required this.budgetName,
      required this.budgetAmount,
      required this.onDelete,
      required this.budgetNameUpdate,
      required this.budgetAmountUpdate,
      required this.onUpdate,
      required this.name});

  @override
  Widget build(BuildContext context) {
    void createNewBudget() {
      showDialog(
          context: context,
          builder: (context) {
            budgetNameUpdate.text = budgetName;
            budgetAmountUpdate.text = budgetAmount.toString();
            return PopoupBox(
              budgetName: budgetNameUpdate,
              budgetAmount: budgetAmountUpdate,
              onSave: onUpdate,
              loading: false,
              name: name,
            );
          });
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: GestureDetector(
        onLongPress: () {
          createNewBudget();
        },
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: onDelete,
                icon: Icons.delete,
                backgroundColor: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(25),
              )
            ],
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: 400,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        budgetName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "$budgetAmount\$",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
