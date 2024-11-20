import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTile extends StatelessWidget {
  const CardTile(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.reservationDate,
      required this.numberOfPeople,
      required this.specialRequests});
  final String firstName;
  final String lastName;
  final DateTime reservationDate;
  final String numberOfPeople;
  final String specialRequests;

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('hh:mm a');
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        color: Colors.deepOrange,
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
                        style: const TextStyle(color: Colors.white, fontSize: 16),
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
                    onPressed: () {},
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
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(
                      Icons.cancel_rounded,
                      color: Colors.white,
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
