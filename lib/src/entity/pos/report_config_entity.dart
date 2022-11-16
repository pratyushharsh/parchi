import 'package:isar/isar.dart';

part 'report_config_entity.g.dart';

@Collection()
class ReportConfigEntity {
  Id? id;

  @Index(composite: [CompositeIndex("subtype")], unique: true, replace: true)
  final String type;
  final String subtype;

  List<ReportColumn> columns;
  List<ReportProperty> properties;

  @Index(type: IndexType.value)
  DateTime? lastChangedAt;

  @Index(type: IndexType.value)
  DateTime? lastSyncAt;

  @Index(type: IndexType.value)
  int? syncState;

  ReportConfigEntity(
      {required this.type,
      required this.subtype,
      required this.columns,
      required this.properties,
      this.syncState,
      this.lastSyncAt,
      this.lastChangedAt});
}

@Embedded()
class ReportProperty {
  String? key;
  String? stringValue;
  int? intValue;
  double? doubleValue;
  bool? boolValue;

  ReportProperty(
      {this.key,
      this.stringValue,
      this.intValue,
      this.doubleValue,
      this.boolValue});
}

@Embedded()
class ReportColumn {
  String? id;
  List<ReportFieldConfigEntity>? fields;

  ReportColumn({this.id, this.fields});
}

@Embedded()
class ReportFieldConfigEntity {
  String? key;
  String? title;
  int? flex;
  String? defaultValue;

  @Enumerated(EnumType.name)
  ColumnAlignment? align;

  @override
  String toString() {
    return '$title';
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'title': title,
      'flex': flex,
      'default': defaultValue,
      'align': align?.value,
    };
  }

  static ReportFieldConfigEntity fromMap(Map<String, dynamic> data) {
    return ReportFieldConfigEntity(
      key: data['key'],
      title: data['title'],
      flex: data['flex'],
      defaultValue: data['default'],
      align: data['align'] != null
          ? ColumnAlignment.values.firstWhere(
              (e) => e.value == data['align'],
              orElse: () => ColumnAlignment.left,
            )
          : null,
    );
  }

  ReportFieldConfigEntity copyWith({
    String? key,
    String? title,
    int? flex,
    ColumnAlignment? align,
    String? defaultValue,
  }) {
    return ReportFieldConfigEntity(
      key: key ?? this.key,
      title: title ?? this.title,
      flex: flex ?? this.flex,
      align: align ?? this.align,
      defaultValue: defaultValue ?? this.defaultValue,
    );
  }

  ReportFieldConfigEntity(
      {this.key, this.title, this.flex, this.align, this.defaultValue});
}

enum ColumnAlignment {
  left("left"),
  right("right"),
  center("center"),
  justify("justify");

  const ColumnAlignment(this.value);
  final String value;
}
