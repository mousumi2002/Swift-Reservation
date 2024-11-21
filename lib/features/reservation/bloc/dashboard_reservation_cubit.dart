import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dashboard_reservation_cubit.freezed.dart';
part 'dashboard_reservation_cubit.g.dart';

@freezed
class DashboardReservationState with _$DashboardReservationState {
  factory DashboardReservationState({
    @Default(false) final bool isLoading,
    final String? error,
    @Default(0) final int totalReservations,
    @Default(0) final int totalGuests,
    @Default([]) final List<Map<String,dynamic>> reservationsPerDay,
  }) = _DashboardReservationState;
  factory DashboardReservationState.fromJson(Map<String, Object?> json) =>
      _$DashboardReservationStateFromJson(json);
}

class DashboardReservationCubit extends Cubit<DashboardReservationState> {
  DashboardReservationCubit() : super(DashboardReservationState()){
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
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1)); // Monday
      final endOfWeek = startOfWeek.add(const Duration(days: 6)); // Sunday
      final reservationQuery = await firestore.collection('business_reservations/$uid/reservations').where('date', isGreaterThanOrEqualTo: startOfWeek, isLessThanOrEqualTo: endOfWeek).get();
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

      for (final doc in reservations) {
        final data = doc.data();
        if(data['status'] == 'CheckIn' || data['status'] == 'CheckOut' || data['status'] == 'Confirmed'){
          totalReservations += 1;
          totalGuests += int.parse(data['numberOfPeople']);
          final date = (data['date'] as Timestamp).toDate();
          final dayOfWeek = date.weekday;
          final dayName = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][dayOfWeek - 1];
          dailyReservations[dayName] = (dailyReservations[dayName] ?? 0) + 1;
        }
        }
      reservationsPerDay = dailyReservations.entries
          .map((e) => {'day': e.key, 'reservations': e.value})
          .toList();
      emit(state.copyWith(totalReservations: totalReservations,totalGuests: totalGuests.toInt(),reservationsPerDay: reservationsPerDay));
    } on FirebaseException catch (e) {
      emit(state.copyWith(error: e.message ?? 'An error occurred while fetching data'));
    }
    emit(state.copyWith(isLoading: false));
  }
}
