import 'package:freezed_annotation/freezed_annotation.dart';
part 'table_model.freezed.dart';
part 'table_model.g.dart';

@freezed
class TableModel with _$TableModel {
  const factory TableModel({
    required int id,
    @Default(false) bool isSelected,
    @Default({}) Map<String, dynamic> reservationData,
  }) = _TableModel;

  factory TableModel.fromJson(Map<String, Object?> json) =>
      _$TableModelFromJson(json);
}
