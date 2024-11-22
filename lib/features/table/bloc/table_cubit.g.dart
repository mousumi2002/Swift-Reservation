// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableStateImpl _$$TableStateImplFromJson(Map<String, dynamic> json) =>
    _$TableStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String?,
      tables: (json['tables'] as List<dynamic>?)
              ?.map((e) => TableModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TableStateImplToJson(_$TableStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'error': instance.error,
      'tables': instance.tables,
    };
