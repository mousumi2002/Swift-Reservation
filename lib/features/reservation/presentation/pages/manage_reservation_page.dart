import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swift_reservation/features/app/presentation/card_tile.dart';

class ManageReservationPage extends StatelessWidget {
  const ManageReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final reservationQuery = FirebaseFirestore.instance
        .collection('business_reservations/$uid/reservations')
        .orderBy('creationDate', descending: true);
    return Scaffold(
      body: FirestoreListView<Map<String, dynamic>>(
          query: reservationQuery,
          itemBuilder: (context, snapshot) {
            final data = snapshot.data();
            return CardTile(
              firstName: data['firstName'],
              lastName: data['lastName'],
              reservationDate: data['date'].toDate(),
              numberOfPeople: data['numberOfPeople'],
              specialRequests: data['specialRequest'],
            );
          }),
    );
  }
}
