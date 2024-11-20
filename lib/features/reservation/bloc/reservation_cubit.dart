import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'reservation_cubit.freezed.dart';
part 'reservation_cubit.g.dart';

@freezed
class ReservationState with _$ReservationState {
  factory ReservationState({
    @Default(false) final bool isLoading,
    final String? error,
    @Default(false) final bool success
}) = _ReservationState;
  factory ReservationState.fromJson(Map<String, Object?> json) =>
      _$ReservationStateFromJson(json);
}

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationState()); // Default screen

  Future<void> createReservation(Map<String,dynamic> reservationData,
      {bool isWaiting = false}) async{
    final firestore = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final collectionRef = firestore.collection('business_reservations/$uid/reservations');
    final reservationDocRef = collectionRef.doc();
    emit(state.copyWith(isLoading: true));
      try {
        await reservationDocRef.set({
          'id': reservationDocRef.id,
          'creationDate': DateTime.now(),
          ...reservationData,
          'status': isWaiting ? 'Waiting' : 'Confirmed',
        });
        emit(state.copyWith(success: true));
      } on FirebaseException catch (e) {
        emit(state.copyWith(error: e.message ?? 'An error occurred while creating reservation'));
      }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> updateReservation(String id, Map<String, Object> map) async {
    final firestore = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final collectionRef = firestore.collection('business_reservations/$uid/reservations');
    final reservationDocRef = collectionRef.doc(id);
    emit(state.copyWith(isLoading: true));
    try {
      await reservationDocRef.update(map);
      emit(state.copyWith(success: true));
    } on FirebaseException catch (e) {
      emit(state.copyWith(error: e.message ?? 'An error occurred while editing reservation'));
    }
    emit(state.copyWith(isLoading: false));
  }
}
