import 'package:budgetplanner/utils/budget_tile.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FakeTileBuilder extends StatelessWidget {
  const FakeTileBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Theme.of(context).primaryColorLight,
          highlightColor: Theme.of(context).primaryColor,
          period: Duration(milliseconds: 1500), // Customize duration
          direction: ShimmerDirection.rtl,
          child: BudgetTile(
            budgetName: "",
            budgetAmount: 0,
            onDelete: (context) {},
          ),
        );
      },
    );
  }
}
