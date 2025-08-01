import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class UserService {
//   static String? _cachedName;
//
//   static Future<String?> getDisplayName() async {
//     if (_cachedName != null) return _cachedName;
//
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return null;
//
//     final snapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.uid)
//         .get();
//
//     _cachedName = snapshot.data()?['nickname'];
//     return _cachedName;
//   }
// }
class UserService {
  static Map<String, dynamic>? _cachedUserData;

  static Future<Map<String, dynamic>?> getUserProfile() async {
    if (_cachedUserData != null) return _cachedUserData;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    _cachedUserData = snapshot.data();
    return _cachedUserData;
  }
}
