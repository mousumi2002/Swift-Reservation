import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
part 'dashboard_reservation_cubit.freezed.dart';
part 'dashboard_reservation_cubit.g.dart';

@freezed
class DashboardReservationState with _$DashboardReservationState {
  factory DashboardReservationState({
    @Default(false) final bool isLoading,
    final String? error,
    @Default(0) final int totalReservations,
    @Default(10) final int remainingTables,
    @Default(0) final int totalGuests,
    @Default([]) final List<Map<String, dynamic>> reservationsPerDay,
  }) = _DashboardReservationState;
  factory DashboardReservationState.fromJson(Map<String, Object?> json) =>
      _$DashboardReservationStateFromJson(json);
}

class DashboardReservationCubit extends Cubit<DashboardReservationState> {
  DashboardReservationCubit() : super(DashboardReservationState()) {
    fetchDataToShowDashboard();
  }

  Future<void> fetchDataToShowDashboard() async {
    final firestore = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    List<Map<String, dynamic>> reservationsPerDay;
    int totalReservations = 0;
    num totalGuests = 0;
    emit(state.copyWith(isLoading: true));
    try {
      final now = DateTime.now();
      final startOfWeek = now
          .subtract(Duration(days: now.weekday - 1))
          .copyWith(hour: 0, minute: 0, second: 0);
      final endOfWeek = startOfWeek
          .add(const Duration(days: 6))
          .copyWith(hour: 23, minute: 59, second: 59);
      final reservationQuery = await firestore
          .collection('business_reservations/$uid/reservations')
          .where('date',
              isGreaterThanOrEqualTo: startOfWeek,
              isLessThanOrEqualTo: endOfWeek)
          .get();
      final reservations = reservationQuery.docs;
      Map<String, int> dailyReservations = {
        'Mon': 0,
        'Tue': 0,
        'Wed': 0,
        'Thu': 0,
        'Fri': 0,
        'Sat': 0,
        'Sun': 0,
      };

      int totalTablesOccupiedToday = 0;

      for (final doc in reservations) {
        final data = doc.data();
        final reservationDate = (data['date'] as Timestamp).toDate();
        if (data['status'] == 'CheckIn' ||
            data['status'] == 'CheckOut' ||
            data['status'] == 'Confirmed') {
          totalReservations += 1;
          totalGuests += int.parse(data['numberOfPeople']);

          final dayOfWeek = reservationDate.weekday;
          final dayName =
              ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][dayOfWeek - 1];
          dailyReservations[dayName] = (dailyReservations[dayName] ?? 0) + 1;
        }

        final now = DateFormat('dd/MM/yyyy').format(DateTime.now());
        final dateFormatted = DateFormat('dd/MM/yyyy').format(reservationDate);

        if (dateFormatted == now) {
          final tableId = data['tableId'];
          if (tableId != null) {
            totalTablesOccupiedToday += 1;
          }
        }
      }
      reservationsPerDay = dailyReservations.entries
          .map((e) => {'day': e.key, 'reservations': e.value})
          .toList();
      emit(
        state.copyWith(
          totalReservations: totalReservations,
          totalGuests: totalGuests.toInt(),
          reservationsPerDay: reservationsPerDay,
          remainingTables: 10 - totalTablesOccupiedToday,
        ),
      );
    } on FirebaseException catch (e) {
      emit(
        state.copyWith(
            error: e.message ?? 'An error occurred while fetching data'),
      );
    }
    emit(state.copyWith(isLoading: false));
  }
}
