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
    await reservationDocRef.set({
      'id': reservationDocRef.id,
      'creationDate': DateTime.now(),
      ...reservationData,
      'status' : isWaiting ? 'waiting' : 'confirmed',
    });
    emit(state.copyWith(isLoading: false));
  }
}
