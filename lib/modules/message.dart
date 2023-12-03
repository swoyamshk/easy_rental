// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class InboxMessage {
//   final String carModel;
//   final String message;
//   final Timestamp timestamp;
//   final String userId; // Add a userId field
//
//   InboxMessage({
//     required this.carModel,
//     required this.message,
//     required this.timestamp,
//     required this.userId,
//   });
//
//   factory InboxMessage.fromSnapshot(DocumentSnapshot snapshot) {
//     Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//     return InboxMessage(
//       carModel: data['carModel'],
//       message: data['message'],
//       timestamp: data['timestamp'],
//       userId: data['userId'],
//     );
//   }
// }
