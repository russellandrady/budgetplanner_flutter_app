import 'package:budgetplanner/utils/appbar.dart';
import 'package:budgetplanner/utils/budget_tile.dart';
import 'package:budgetplanner/utils/left_menu.dart';
import 'package:budgetplanner/utils/popoup_box.dart';
import 'package:budgetplanner/utils/total_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Budgets extends StatefulWidget {
  Budgets({super.key});

  @override
  State<Budgets> createState() => _BudgetsState();
}

class _BudgetsState extends State<Budgets> {
  final _budgetName = TextEditingController();
  final _budgetAmount = TextEditingController();
  List budgetList = [
    ["Buy a hammer", 50],
    ["Buy a face mask", 25],
    ["Buy a bag", 100],
  ];

  void createNewBudget() {
    showDialog(
        context: context,
        builder: (context) {
          return PopoupBox(
            budgetName: _budgetName,
            budgetAmount: _budgetAmount,
            onSave: () {
              setState(() {
                budgetList
                    .add([_budgetName.text, int.parse(_budgetAmount.text)]);
              });
              _budgetName.clear();
              _budgetAmount.clear();
              Navigator.pop(context);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    int calculateTotal(budgetList) {
      return budgetList.fold(0, (sum, item) => sum + item[1]);
    }

    return Scaffold(
      appBar: const CustomAppbar(
        showLogoutuButton: true,
      ),
      drawer: const LeftMenu(),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: budgetList.length +
            1, // Increase itemCount by 1 to add the total tile
        itemBuilder: (context, index) {
          if (index == budgetList.length) {
            // Render the total tile
            return TotalTile(
                budgetName: "Total", budgetAmount: calculateTotal(budgetList));
          } else {
            // Render the budget tile
            return BudgetTile(
              budgetName: budgetList[index][0],
              budgetAmount: budgetList[index][1],
              onDelete: (context) {
                setState(() {
                  budgetList.removeAt(index);
                });
              },
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewBudget,
        backgroundColor: Theme.of(context).primaryColorLight,
        shape: const CircleBorder(eccentricity: BorderSide.strokeAlignCenter),
        child: const Icon(Icons.add),
      ),
    );
  }
}
