import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../reservation/bloc/reservation_cubit.dart';
import '../../bloc/table_cubit.dart';

class SelectTablePage extends StatelessWidget {
  final Map<String, dynamic> reservationData;

  const SelectTablePage({super.key, required this.reservationData});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd-MM-yyyy');
    return BlocProvider(
      create: (_) => TableCubit(reservationData),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Table Selector',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Text(
              dateFormat.format(reservationData['date']),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TableCubit, TableState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: state.tables.length,
                      itemBuilder: (context, index) {
                        final table = state.tables[index];
                        final activeReservationData =
                            state.activeReservationData;
                        final activeReservationTableId =
                            activeReservationData['tableId'];

                        String? reservationName =
                            table.reservationData['firstName'];

                        if (reservationName == null) {
                          if (activeReservationTableId == table.id) {
                            reservationName =
                                state.activeReservationData['firstName'];
                          } else {
                            reservationName = '';
                          }
                        }

                        return GestureDetector(
                          onTap: () {
                            context
                                .read<TableCubit>()
                                .toggleTableSelection(table.id);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: table.reservationData.isNotEmpty
                                  ? Colors.red
                                  : activeReservationTableId == table.id
                                      ? Colors.green
                                      : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black54),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Table ${table.id}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: table.reservationData.isEmpty
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  if (reservationName != null) ...[
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      reservationName,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: table.reservationData.isEmpty
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  BlocProvider(
                    create: (context) => ReservationCubit(),
                    child: Builder(
                      builder: (context) {
                        return BlocListener<ReservationCubit, ReservationState>(
                          listener: (context, state) {
                            if (state.success) {
                              Navigator.of(context).pop(true);
                            }
                          },
                          listenWhen: (previous, current) =>
                              previous.success != current.success,
                          child: ElevatedButton(
                            onPressed: () async {
                              await context
                                  .read<ReservationCubit>()
                                  .createReservation(
                                      state.activeReservationData);
                            },
                            child: const Text('Confirm Booking'),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
