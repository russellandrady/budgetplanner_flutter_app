import 'dart:async';

import 'package:budgetplanner/utils/toast_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreService {
  //add budgets
  void addBudget(List budgetList) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      DocumentReference userDocument = usersCollection.doc(user.uid);

      // Check if the user document exists
      userDocument.get().then((documentSnapshot) {
        if (documentSnapshot.exists) {
          // User document exists, update the budgets field
          userDocument
              .set({'budgets': budgetList}, SetOptions(merge: true)).then((_) {
            ToastAlert().toastAlert(message: "Added!");
          }).catchError((error) {
            ToastAlert().toastAlert(message: "Error!");
          });
        } else {
          // User document doesn't exist, create it and set the budgets field
          userDocument.set({'budgets': budgetList}).then((_) {
            ToastAlert().toastAlert(message: "Added!");
          }).catchError((error) {
            ToastAlert().toastAlert(message: "Error!");
          });
        }
      }).catchError((error) {
        ToastAlert().toastAlert(message: "Error!");
      });
    } else {
      ToastAlert().toastAlert(message: "User is Not Authenticated!");
    }
  }

  Future<void> createUserDocument({
    required String budgetName,
    required String budgetAmount,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference budgetsCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('budgets');

      try {
        int amount = int.parse(budgetAmount);
        await budgetsCollection.add({
          "name": budgetName,
          "value": amount,
        });

        ToastAlert().toastAlert(message: "Added");
      } catch (e) {
        ToastAlert().toastAlert(message: "Error!");
      }
    } else {
      ToastAlert().toastAlert(message: "User is Not Authenticated!");
    }
  }

  Future<List<List<dynamic>>> getAllBudgets() async {
    List<List<dynamic>> budgetList = [];

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('budgets')
          .orderBy('value')
          .get();

      querySnapshot.docs.forEach((doc) {
        // Extract 'name' and 'value' fields from each document and add them to the budgetList
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

        if (data != null) {
          String id = doc.id;
          String? name = data["name"] as String?;
          int? value = data["value"] as int?;
          budgetList.add([id, name, value]);
        }
      });

      return budgetList;
    } else {
      ToastAlert().toastAlert(message: "User is Not Authenticated!");
      return budgetList;
    }
  }

  Future<void> deleteBudget(String budgetId) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentReference budgetRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('budgets')
          .doc(
              budgetId); // Assuming budgetId is the ID of the budget document to delete

      try {
        await budgetRef.delete();
        ToastAlert().toastAlert(message: "Deleted");
      } catch (e) {
        ToastAlert().toastAlert(message: "Error");
        // Handle error as needed
      }
    } else {
      ToastAlert().toastAlert(message: "User is Not Authenticated!");
    }
  }
}
