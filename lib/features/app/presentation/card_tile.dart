import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swift_reservation/features/reservation/presentation/pages/edit_reservation_page.dart';

class CardTile extends StatelessWidget {
  const CardTile({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.reservationDate,
    required this.numberOfPeople,
    required this.specialRequests,
    required this.status,
    required this.docId,
    required this.reservationData,
  });
  final String firstName;
  final String lastName;
  final DateTime reservationDate;
  final String numberOfPeople;
  final String specialRequests;
  final String status;
  final String docId;
  final Map<String, dynamic> reservationData;

  Color? cardColorByStatus(String status) {
    if (status == 'Confirmed') {
      return Colors.green.shade700;
    } else if (status == 'Waiting') {
      return Colors.blueGrey.shade700;
    } else if (status == 'Cancelled') {
      return Colors.deepOrange.shade600;
    } else {
      return Colors.pink;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> statusList = [
      'All',
      'Confirmed',
      'Waiting',
      'Cancelled',
      'CheckOut',
      'CheckIn'
    ];
    final timeFormat = DateFormat('hh:mm a');
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        color: cardColorByStatus(status),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Name: $firstName $lastName',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.people_alt_rounded,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    numberOfPeople,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Date: ${reservationDate.day}-${reservationDate.month}-${reservationDate.year}',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.access_time,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    timeFormat.format(reservationDate),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              specialRequests != ""
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Special requests: $specialRequests',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  : const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditReservationPage(
                              reservationData: reservationData)));
                    },
                    label: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isDense: true,
                        value: status,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? value) {
                          if (value == null) {
                            return;
                          }
                          final firestore = FirebaseFirestore.instance;
                          final uid = FirebaseAuth.instance.currentUser?.uid;
                          final collectionRef = firestore.collection(
                              'business_reservations/$uid/reservations');
                          final reservationDocRef = collectionRef.doc(docId);
                          Map<String, String> updatedStatus = {'status': value};
                          reservationDocRef.update(updatedStatus);
                        },
                        items: statusList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
