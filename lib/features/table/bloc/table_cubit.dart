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
  }) = _TableState;
  factory TableState.fromJson(Map<String, Object?> json) =>
      _$TableStateFromJson(json);
}

class TableCubit extends Cubit<TableState> {
  TableCubit()
      : super(TableState(
          tables: List.generate(
            10,
            (index) => TableModel(id: index + 1),
          ),
        )) {}

  void toggleTableSelection(int tableId, Map<String, dynamic> reservationData) {
    emit(state.copyWith(isLoading: true));
    try {
      final updatedTables = state.tables.map((table) {
        if (table.id == tableId && table.reservationData.isEmpty) {
          return TableModel(
            id: table.id,
            isSelected: !table.isSelected,
            reservationData: reservationData,
          );
        }
        return table;
      }).toList();

      emit(state.copyWith(tables: updatedTables));
    } on Exception catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
    emit(state.copyWith(isLoading: false));
  }
}
