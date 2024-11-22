// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableModelImpl _$$TableModelImplFromJson(Map<String, dynamic> json) =>
    _$TableModelImpl(
      id: (json['id'] as num).toInt(),
      isSelected: json['isSelected'] as bool? ?? false,
      reservationData:
          json['reservationData'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$TableModelImplToJson(_$TableModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isSelected': instance.isSelected,
      'reservationData': instance.reservationData,
    };
