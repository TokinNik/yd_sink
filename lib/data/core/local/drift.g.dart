// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift.dart';

// ignore_for_file: type=lint
class $NIVLDtoTable extends NIVLDto with TableInfo<$NIVLDtoTable, NIVLDtoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NIVLDtoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subTitleMeta =
      const VerificationMeta('subTitle');
  @override
  late final GeneratedColumn<String> subTitle = GeneratedColumn<String>(
      'sub_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _centerMeta = const VerificationMeta('center');
  @override
  late final GeneratedColumn<String> center = GeneratedColumn<String>(
      'center', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaLinkMeta =
      const VerificationMeta('mediaLink');
  @override
  late final GeneratedColumn<String> mediaLink = GeneratedColumn<String>(
      'media_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _keyWordMeta =
      const VerificationMeta('keyWord');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> keyWord =
      GeneratedColumn<String>('key_word', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($NIVLDtoTable.$converterkeyWord);
  @override
  List<GeneratedColumn> get $columns =>
      [id, type, title, subTitle, image, date, center, mediaLink, keyWord];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'n_i_v_l_dto';
  @override
  VerificationContext validateIntegrity(Insertable<NIVLDtoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('sub_title')) {
      context.handle(_subTitleMeta,
          subTitle.isAcceptableOrUnknown(data['sub_title']!, _subTitleMeta));
    } else if (isInserting) {
      context.missing(_subTitleMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('center')) {
      context.handle(_centerMeta,
          center.isAcceptableOrUnknown(data['center']!, _centerMeta));
    } else if (isInserting) {
      context.missing(_centerMeta);
    }
    if (data.containsKey('media_link')) {
      context.handle(_mediaLinkMeta,
          mediaLink.isAcceptableOrUnknown(data['media_link']!, _mediaLinkMeta));
    } else if (isInserting) {
      context.missing(_mediaLinkMeta);
    }
    context.handle(_keyWordMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NIVLDtoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NIVLDtoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      subTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sub_title'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      center: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}center'])!,
      mediaLink: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_link'])!,
      keyWord: $NIVLDtoTable.$converterkeyWord.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key_word'])!),
    );
  }

  @override
  $NIVLDtoTable createAlias(String alias) {
    return $NIVLDtoTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterkeyWord =
      StringListTypeConverter();
}

class NIVLDtoData extends DataClass implements Insertable<NIVLDtoData> {
  final String id;
  final String type;
  final String title;
  final String subTitle;
  final String image;
  final String date;
  final String center;
  final String mediaLink;
  final List<String> keyWord;
  const NIVLDtoData(
      {required this.id,
      required this.type,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.date,
      required this.center,
      required this.mediaLink,
      required this.keyWord});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    map['sub_title'] = Variable<String>(subTitle);
    map['image'] = Variable<String>(image);
    map['date'] = Variable<String>(date);
    map['center'] = Variable<String>(center);
    map['media_link'] = Variable<String>(mediaLink);
    {
      map['key_word'] =
          Variable<String>($NIVLDtoTable.$converterkeyWord.toSql(keyWord));
    }
    return map;
  }

  NIVLDtoCompanion toCompanion(bool nullToAbsent) {
    return NIVLDtoCompanion(
      id: Value(id),
      type: Value(type),
      title: Value(title),
      subTitle: Value(subTitle),
      image: Value(image),
      date: Value(date),
      center: Value(center),
      mediaLink: Value(mediaLink),
      keyWord: Value(keyWord),
    );
  }

  factory NIVLDtoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NIVLDtoData(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      subTitle: serializer.fromJson<String>(json['subTitle']),
      image: serializer.fromJson<String>(json['image']),
      date: serializer.fromJson<String>(json['date']),
      center: serializer.fromJson<String>(json['center']),
      mediaLink: serializer.fromJson<String>(json['mediaLink']),
      keyWord: serializer.fromJson<List<String>>(json['keyWord']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'subTitle': serializer.toJson<String>(subTitle),
      'image': serializer.toJson<String>(image),
      'date': serializer.toJson<String>(date),
      'center': serializer.toJson<String>(center),
      'mediaLink': serializer.toJson<String>(mediaLink),
      'keyWord': serializer.toJson<List<String>>(keyWord),
    };
  }

  NIVLDtoData copyWith(
          {String? id,
          String? type,
          String? title,
          String? subTitle,
          String? image,
          String? date,
          String? center,
          String? mediaLink,
          List<String>? keyWord}) =>
      NIVLDtoData(
        id: id ?? this.id,
        type: type ?? this.type,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        image: image ?? this.image,
        date: date ?? this.date,
        center: center ?? this.center,
        mediaLink: mediaLink ?? this.mediaLink,
        keyWord: keyWord ?? this.keyWord,
      );
  @override
  String toString() {
    return (StringBuffer('NIVLDtoData(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('subTitle: $subTitle, ')
          ..write('image: $image, ')
          ..write('date: $date, ')
          ..write('center: $center, ')
          ..write('mediaLink: $mediaLink, ')
          ..write('keyWord: $keyWord')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, type, title, subTitle, image, date, center, mediaLink, keyWord);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NIVLDtoData &&
          other.id == this.id &&
          other.type == this.type &&
          other.title == this.title &&
          other.subTitle == this.subTitle &&
          other.image == this.image &&
          other.date == this.date &&
          other.center == this.center &&
          other.mediaLink == this.mediaLink &&
          other.keyWord == this.keyWord);
}

class NIVLDtoCompanion extends UpdateCompanion<NIVLDtoData> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> title;
  final Value<String> subTitle;
  final Value<String> image;
  final Value<String> date;
  final Value<String> center;
  final Value<String> mediaLink;
  final Value<List<String>> keyWord;
  final Value<int> rowid;
  const NIVLDtoCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.subTitle = const Value.absent(),
    this.image = const Value.absent(),
    this.date = const Value.absent(),
    this.center = const Value.absent(),
    this.mediaLink = const Value.absent(),
    this.keyWord = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NIVLDtoCompanion.insert({
    required String id,
    required String type,
    required String title,
    required String subTitle,
    required String image,
    required String date,
    required String center,
    required String mediaLink,
    required List<String> keyWord,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        title = Value(title),
        subTitle = Value(subTitle),
        image = Value(image),
        date = Value(date),
        center = Value(center),
        mediaLink = Value(mediaLink),
        keyWord = Value(keyWord);
  static Insertable<NIVLDtoData> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? subTitle,
    Expression<String>? image,
    Expression<String>? date,
    Expression<String>? center,
    Expression<String>? mediaLink,
    Expression<String>? keyWord,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (subTitle != null) 'sub_title': subTitle,
      if (image != null) 'image': image,
      if (date != null) 'date': date,
      if (center != null) 'center': center,
      if (mediaLink != null) 'media_link': mediaLink,
      if (keyWord != null) 'key_word': keyWord,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NIVLDtoCompanion copyWith(
      {Value<String>? id,
      Value<String>? type,
      Value<String>? title,
      Value<String>? subTitle,
      Value<String>? image,
      Value<String>? date,
      Value<String>? center,
      Value<String>? mediaLink,
      Value<List<String>>? keyWord,
      Value<int>? rowid}) {
    return NIVLDtoCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      image: image ?? this.image,
      date: date ?? this.date,
      center: center ?? this.center,
      mediaLink: mediaLink ?? this.mediaLink,
      keyWord: keyWord ?? this.keyWord,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subTitle.present) {
      map['sub_title'] = Variable<String>(subTitle.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (center.present) {
      map['center'] = Variable<String>(center.value);
    }
    if (mediaLink.present) {
      map['media_link'] = Variable<String>(mediaLink.value);
    }
    if (keyWord.present) {
      map['key_word'] = Variable<String>(
          $NIVLDtoTable.$converterkeyWord.toSql(keyWord.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NIVLDtoCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('subTitle: $subTitle, ')
          ..write('image: $image, ')
          ..write('date: $date, ')
          ..write('center: $center, ')
          ..write('mediaLink: $mediaLink, ')
          ..write('keyWord: $keyWord, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Drift extends GeneratedDatabase {
  _$Drift(QueryExecutor e) : super(e);
  _$DriftManager get managers => _$DriftManager(this);
  late final $NIVLDtoTable nIVLDto = $NIVLDtoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [nIVLDto];
}

typedef $$NIVLDtoTableInsertCompanionBuilder = NIVLDtoCompanion Function({
  required String id,
  required String type,
  required String title,
  required String subTitle,
  required String image,
  required String date,
  required String center,
  required String mediaLink,
  required List<String> keyWord,
  Value<int> rowid,
});
typedef $$NIVLDtoTableUpdateCompanionBuilder = NIVLDtoCompanion Function({
  Value<String> id,
  Value<String> type,
  Value<String> title,
  Value<String> subTitle,
  Value<String> image,
  Value<String> date,
  Value<String> center,
  Value<String> mediaLink,
  Value<List<String>> keyWord,
  Value<int> rowid,
});

class $$NIVLDtoTableTableManager extends RootTableManager<
    _$Drift,
    $NIVLDtoTable,
    NIVLDtoData,
    $$NIVLDtoTableFilterComposer,
    $$NIVLDtoTableOrderingComposer,
    $$NIVLDtoTableProcessedTableManager,
    $$NIVLDtoTableInsertCompanionBuilder,
    $$NIVLDtoTableUpdateCompanionBuilder> {
  $$NIVLDtoTableTableManager(_$Drift db, $NIVLDtoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NIVLDtoTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$NIVLDtoTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$NIVLDtoTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> subTitle = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<String> date = const Value.absent(),
            Value<String> center = const Value.absent(),
            Value<String> mediaLink = const Value.absent(),
            Value<List<String>> keyWord = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NIVLDtoCompanion(
            id: id,
            type: type,
            title: title,
            subTitle: subTitle,
            image: image,
            date: date,
            center: center,
            mediaLink: mediaLink,
            keyWord: keyWord,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String id,
            required String type,
            required String title,
            required String subTitle,
            required String image,
            required String date,
            required String center,
            required String mediaLink,
            required List<String> keyWord,
            Value<int> rowid = const Value.absent(),
          }) =>
              NIVLDtoCompanion.insert(
            id: id,
            type: type,
            title: title,
            subTitle: subTitle,
            image: image,
            date: date,
            center: center,
            mediaLink: mediaLink,
            keyWord: keyWord,
            rowid: rowid,
          ),
        ));
}

class $$NIVLDtoTableProcessedTableManager extends ProcessedTableManager<
    _$Drift,
    $NIVLDtoTable,
    NIVLDtoData,
    $$NIVLDtoTableFilterComposer,
    $$NIVLDtoTableOrderingComposer,
    $$NIVLDtoTableProcessedTableManager,
    $$NIVLDtoTableInsertCompanionBuilder,
    $$NIVLDtoTableUpdateCompanionBuilder> {
  $$NIVLDtoTableProcessedTableManager(super.$state);
}

class $$NIVLDtoTableFilterComposer
    extends FilterComposer<_$Drift, $NIVLDtoTable> {
  $$NIVLDtoTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subTitle => $state.composableBuilder(
      column: $state.table.subTitle,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get center => $state.composableBuilder(
      column: $state.table.center,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get mediaLink => $state.composableBuilder(
      column: $state.table.mediaLink,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get keyWord => $state.composableBuilder(
          column: $state.table.keyWord,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));
}

class $$NIVLDtoTableOrderingComposer
    extends OrderingComposer<_$Drift, $NIVLDtoTable> {
  $$NIVLDtoTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subTitle => $state.composableBuilder(
      column: $state.table.subTitle,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get center => $state.composableBuilder(
      column: $state.table.center,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get mediaLink => $state.composableBuilder(
      column: $state.table.mediaLink,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get keyWord => $state.composableBuilder(
      column: $state.table.keyWord,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$DriftManager {
  final _$Drift _db;
  _$DriftManager(this._db);
  $$NIVLDtoTableTableManager get nIVLDto =>
      $$NIVLDtoTableTableManager(_db, _db.nIVLDto);
}
