import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vigorus/app/app.logger.dart';
import 'package:vigorus/models/medicine_model.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final log = getLogger("FireStore");

  Future<String> addUser(String uid) async {
    String res = "Some error occurred";
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .set({"uid": uid}, SetOptions(merge: true));
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> uploadMedicine(MedicineModel med, String uid) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('users').doc(uid).update(
        {
          'userMedicines': FieldValue.arrayUnion([med.toJson()]),
        },
      );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<List<MedicineModel>> getMedicine(String uid) async {
    List<MedicineModel> med = [];
    try {
      DocumentSnapshot userSnapshot =
          await _firestore.collection('users').doc(uid).get();
      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data()! as Map<String, dynamic>;
        List<Map<String, dynamic>> userMedicines =
            List<Map<String, dynamic>>.from(
          userData['userMedicines'],
        );
        userMedicines.forEach(
          (element) {
            med.add(
              MedicineModel.fromJson(element),
            );
          },
        );
      }
    } catch (err) {
      log.i(err);
    }
    return med;
  }
}
