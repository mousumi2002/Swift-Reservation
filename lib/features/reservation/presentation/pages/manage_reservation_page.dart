import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swift_reservation/features/app/presentation/card_tile.dart';

class ManageReservationPage extends StatefulWidget {
  const ManageReservationPage({super.key});

  @override
  State<ManageReservationPage> createState() => _ManageReservationPageState();
}

class _ManageReservationPageState extends State<ManageReservationPage> {
  final List<String> status = ['All', 'Confirmed', 'Waiting', 'Cancelled','CheckOut','CheckIn'];
  String? dropdownValue;
  final dateTimeFormat = DateFormat('dd-MM-yyyy');
  DateTime? date;
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        date = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    Query<Map<String, dynamic>> reservationQuery = FirebaseFirestore.instance
        .collection('business_reservations/$uid/reservations')
        .orderBy('creationDate', descending: true);
    if (dropdownValue != null && dropdownValue != 'All') {
      reservationQuery =
          reservationQuery.where('status', isEqualTo: dropdownValue);
    }
    if (date != null) {
      final startDate = DateTime(date!.year, date!.month, date!.day);
      final endDate = DateTime(date!.year, date!.month, date!.day, 23, 59, 59);
      reservationQuery = reservationQuery.where('date',
          isGreaterThanOrEqualTo: startDate, isLessThanOrEqualTo: endDate);
    }
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.black87,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: const Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.white,
                    )),
                date != null
                    ? Row(
                      children: [
                        Text(
                            dateTimeFormat.format(date!),
                            style: const TextStyle(color: Colors.white),
                          ),
                        IconButton(onPressed: (){
                          setState(() {
                            date = null;
                          });
                        }, icon: const Icon(Icons.cancel_outlined,color: Colors.white,))
                      ],
                    )
                    : const Text(
                        'Select Date',
                        style: TextStyle(color: Colors.white),
                      ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isDense: true,
                      value: dropdownValue,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items:
                          status.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FirestoreListView<Map<String, dynamic>>(
                emptyBuilder: (context) {
                  return Center(
                    child: dropdownValue == null || dropdownValue == 'All'
                        ? const Text('No Reservations')
                        : Text('No $dropdownValue Reservations'),
                  );
                },
                query: reservationQuery,
                itemBuilder: (context, snapshot) {
                  final data = snapshot.data();
                  return CardTile(
                    firstName: data['firstName'],
                    lastName: data['lastName'],
                    reservationDate: data['date'].toDate(),
                    numberOfPeople: data['numberOfPeople'],
                    specialRequests: data['specialRequest'],
                    status: data['status'],
                    docId: data['id'],
                    reservationData: data,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
