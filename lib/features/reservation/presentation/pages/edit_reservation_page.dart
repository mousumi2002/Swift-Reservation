import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../bloc/reservation_cubit.dart';

class EditReservationPage extends StatefulWidget {
  final Map<String, dynamic> reservationData;

  const EditReservationPage({super.key, required this.reservationData});

  @override
  State<EditReservationPage> createState() => _EditReservationPageState();
}

class _EditReservationPageState extends State<EditReservationPage> {
  final dateFormat = DateFormat('dd-MM-yyyy');
  final dateTimeFormat = DateFormat('dd-MM-yyyy hh:mm');
  final formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final numberOfPeopleController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final specialRequestController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Timestamp timestamp = widget.reservationData['date'];
      dateController.text = dateFormat.format(timestamp.toDate());
      timeController.text =
          TimeOfDay.fromDateTime(timestamp.toDate()).format(context);
      numberOfPeopleController.text = widget.reservationData['numberOfPeople'];
      firstNameController.text = widget.reservationData['firstName'];
      lastNameController.text = widget.reservationData['lastName'];
      phoneNumberController.text = widget.reservationData['phoneNumber'];
      emailController.text = widget.reservationData['email'];
      specialRequestController.text =
          widget.reservationData['specialRequest'] ?? '';
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final Timestamp timestamp = widget.reservationData['date'];
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: timestamp.toDate(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text = dateFormat.format(pickedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final Timestamp timestamp = widget.reservationData['date'];
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(timestamp.toDate()),
    );

    if (pickedTime != null) {
      setState(() {
        timeController.text =
        '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReservationCubit>(
      create: (context) => ReservationCubit(),
      child: Scaffold(
        appBar: AppBar(iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Edit Reservation',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black,
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildDisabledField('First Name', firstNameController),
                _buildDisabledField('Last Name', lastNameController),
                _buildDisabledField('Phone Number', phoneNumberController),
                _buildDisabledField('Email', emailController),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter date';
                      }
                      return null;
                    },
                    controller: dateController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Date',
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter time';
                      }
                      return null;
                    },
                    controller: timeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Time',
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectTime(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter number of people';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: numberOfPeopleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Number of People',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    maxLines: 3,
                    controller: specialRequestController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Special Request',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                BlocConsumer<ReservationCubit, ReservationState>(
                  listener: (context, state) {
                    if (state.error != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error!),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else if (state.success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Reservation updated successfully'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  listenWhen: (previous, current) {
                    return current.error != null || previous.success != current.success;
                  },
                  builder: (context, state) {
                    return state.isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          DateTime updatedDateTime = dateTimeFormat.parse(
                            '${dateController.text} ${timeController.text}',
                          );

                          await context
                              .read<ReservationCubit>()
                              .updateReservation(
                            widget.reservationData['id'], // Reservation ID
                            {
                              'date': updatedDateTime,
                              'numberOfPeople': numberOfPeopleController.text,
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Update Reservation',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDisabledField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelText: label,
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
      ),
    );
  }
}
