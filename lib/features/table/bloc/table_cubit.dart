import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_reservation/features/table/model/table_model.dart';

part 'table_cubit.freezed.dart';
part 'table_cubit.g.dart';

@freezed
class TableState with _$TableState {
  factory TableState({
    @Default(false) final bool isLoading,
    final String? error,
    @Default([]) final List<TableModel> tables,
    @Default({}) Map<String, dynamic> activeReservationData,
  }) = _TableState;
  factory TableState.fromJson(Map<String, Object?> json) =>
      _$TableStateFromJson(json);
}

class TableCubit extends Cubit<TableState> {
  TableCubit(Map<String, dynamic> activeReservationData)
      : super(
          TableState(
            tables: List.generate(
              10,
              (index) => TableModel(id: index + 1),
            ),
            activeReservationData: activeReservationData,
          ),
        ) {
    fetchData();
  }

  void toggleTableSelection(int tableId) {
    final activeReservationData = Map.of(state.activeReservationData);

    final indexOfTable = tableId - 1;
    final table = state.tables[indexOfTable];

    if (table.reservationData.isNotEmpty) {
      return;
    }

    if (activeReservationData['tableId'] == tableId) {
      activeReservationData['tableId'] = null;
    } else {
      activeReservationData['tableId'] = tableId;
    }

    emit(state.copyWith(activeReservationData: activeReservationData));
  }

  Future<void> fetchData() async {
    final firestore = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    DateTime date = state.activeReservationData['date'];
    final reservationRef = firestore
        .collection('business_reservations/$uid/reservations')
        .where('date',
            isGreaterThanOrEqualTo:
                date.copyWith(hour: 0, minute: 0, second: 0),
            isLessThanOrEqualTo:
                date.copyWith(hour: 23, minute: 59, second: 59));
    final data = await reservationRef.get();
    final reservations = data.docs;
    List<TableModel> tables = List.from(state.tables);
    for (final reservation in reservations) {
      final reservationData = reservation.data();
      print(reservationData);
      final tableId = reservationData['tableId'];
      if (tableId != null) {
        final tableIndex = tableId - 1;
        TableModel table = state.tables[tableIndex];
        table = table.copyWith(
          reservationData: reservationData,
        );
        tables[tableIndex] = table;
      }
    }
    emit(
      state.copyWith(
        tables: tables,
      ),
    );
  }
}
