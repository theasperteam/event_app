import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  getUserByUseremail(String userEmail) async {
    return await FirebaseFirestore.instance
        .collection("user")
        .where("email", isEqualTo: userEmail)
        .get();
  }
}
