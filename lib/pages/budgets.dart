import 'package:budgetplanner/services/cloud_service.dart';
import 'package:budgetplanner/utils/appbar.dart';
import 'package:budgetplanner/utils/budget_tile.dart';
import 'package:budgetplanner/utils/fake_tile_builder.dart';
import 'package:budgetplanner/utils/left_menu.dart';
import 'package:budgetplanner/utils/popoup_box.dart';
import 'package:budgetplanner/utils/total_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class Budgets extends StatefulWidget {
  Budgets({super.key});

  @override
  State<Budgets> createState() => _BudgetsState();
}

class _BudgetsState extends State<Budgets> {
  bool loading = false;
  bool loadingPop = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loading = true;
    });
    loadBudgets();
    setState(() {
      loading = false;
    });
  }

  final _budgetName = TextEditingController();
  final _budgetAmount = TextEditingController();
  List budgetList = [];

  void loadBudgets() async {
    List<List<dynamic>> fetchedBudgets =
        await FireStoreService().getAllBudgets();
    // Now you have the fetched budgets, you can assign them to budgetList or use them as needed
    setState(() {
      budgetList = fetchedBudgets;
    });
  }

  void createNewBudget() {
    showDialog(
        context: context,
        builder: (context) {
          return PopoupBox(
            budgetName: _budgetName,
            budgetAmount: _budgetAmount,
            onSave: () {
              // setState(() {
              //   budgetList
              //       .add([_budgetName.text, int.parse(_budgetAmount.text)]);
              // });
              setState(() {
                loadingPop = true;
              });
              FireStoreService().createUserDocument(
                  budgetName: _budgetName.text,
                  budgetAmount: _budgetAmount.text);
              loadBudgets();
              _budgetName.clear();
              _budgetAmount.clear();
              Navigator.pop(context);
              setState(() {
                loadingPop = false;
              });
            },
            loading: loadingPop,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    int calculateTotal(budgetList) {
      return budgetList.fold(0, (sum, item) => sum + item[2]);
    }

    return Scaffold(
      appBar: const CustomAppbar(
        showLogoutuButton: true,
      ),
      drawer: const LeftMenu(),
      body: loading
          ? FakeTileBuilder()
          : ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: budgetList.length +
                  1, // Increase itemCount by 1 to add the total tile
              itemBuilder: (context, index) {
                if (index == budgetList.length) {
                  // Render the total tile
                  return TotalTile(
                      budgetName: "Total",
                      budgetAmount: calculateTotal(budgetList));
                } else {
                  // Render the budget tile
                  return BudgetTile(
                    budgetName: budgetList[index][1],
                    budgetAmount: budgetList[index][2],
                    onDelete: (context) {
                      FireStoreService().deleteBudget(budgetList[index][0]);
                      loadBudgets();
                      // budgetList.removeAt(index);
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
