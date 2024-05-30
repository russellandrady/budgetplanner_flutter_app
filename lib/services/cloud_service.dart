import 'dart:async';

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
            print('Budgets added successfully!');
          }).catchError((error) {
            print('Failed to add budgets: $error');
          });
        } else {
          // User document doesn't exist, create it and set the budgets field
          userDocument.set({'budgets': budgetList}).then((_) {
            print('User document created with budgets!');
          }).catchError((error) {
            print('Failed to create user document: $error');
          });
        }
      }).catchError((error) {
        print('Error checking user document: $error');
      });
    } else {
      print('User is not authenticated!');
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

        print('Budget added successfully!');
      } catch (e) {
        print('Error parsing budgetAmount: $e');
      }
    } else {
      print('User is not authenticated!');
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
      print('User is not authenticated!');
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
        .doc(budgetId); // Assuming budgetId is the ID of the budget document to delete

    try {
      await budgetRef.delete();
      print('Budget deleted successfully!');
    } catch (e) {
      print('Error deleting budget: $e');
      // Handle error as needed
    }
  } else {
    print('User is not authenticated!');
  }
}

}
