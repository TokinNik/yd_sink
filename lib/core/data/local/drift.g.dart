// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift.dart';

// ignore_for_file: type=lint
class $NasaMediaTableTable extends NasaMediaTable with TableInfo<$NasaMediaTableTable, NasaMediaTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $NasaMediaTableTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subTitleMeta = const VerificationMeta('subTitle');
  @override
  late final GeneratedColumn<String> subTitle = GeneratedColumn<String>(
    'sub_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _centerMeta = const VerificationMeta('center');
  @override
  late final GeneratedColumn<String> center = GeneratedColumn<String>(
    'center',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mediaLinkMeta = const VerificationMeta('mediaLink');
  @override
  late final GeneratedColumn<String> mediaLink = GeneratedColumn<String>(
    'media_link',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> keyWord = GeneratedColumn<String>(
    'key_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<List<String>>($NasaMediaTableTable.$converterkeyWord);

  @override
  List<GeneratedColumn> get $columns => [id, type, title, subTitle, image, date, center, mediaLink, keyWord];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'nasa_media_table';

  @override
  VerificationContext validateIntegrity(Insertable<NasaMediaTableData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(_typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(_titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('sub_title')) {
      context.handle(_subTitleMeta, subTitle.isAcceptableOrUnknown(data['sub_title']!, _subTitleMeta));
    } else if (isInserting) {
      context.missing(_subTitleMeta);
    }
    if (data.containsKey('image')) {
      context.handle(_imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('date')) {
      context.handle(_dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('center')) {
      context.handle(_centerMeta, center.isAcceptableOrUnknown(data['center']!, _centerMeta));
    } else if (isInserting) {
      context.missing(_centerMeta);
    }
    if (data.containsKey('media_link')) {
      context.handle(_mediaLinkMeta, mediaLink.isAcceptableOrUnknown(data['media_link']!, _mediaLinkMeta));
    } else if (isInserting) {
      context.missing(_mediaLinkMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  NasaMediaTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NasaMediaTableData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      title: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      subTitle: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}sub_title'])!,
      image: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      date: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      center: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}center'])!,
      mediaLink: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}media_link'])!,
      keyWord: $NasaMediaTableTable.$converterkeyWord.fromSql(
        attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}key_word'])!,
      ),
    );
  }

  @override
  $NasaMediaTableTable createAlias(String alias) {
    return $NasaMediaTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterkeyWord = StringListTypeConverter();
}

class NasaMediaTableData extends DataClass implements Insertable<NasaMediaTableData> {
  final String id;
  final String type;
  final String title;
  final String subTitle;
  final String image;
  final String date;
  final String center;
  final String mediaLink;
  final List<String> keyWord;

  const NasaMediaTableData({
    required this.id,
    required this.type,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.date,
    required this.center,
    required this.mediaLink,
    required this.keyWord,
  });

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
      map['key_word'] = Variable<String>($NasaMediaTableTable.$converterkeyWord.toSql(keyWord));
    }
    return map;
  }

  NasaMediaTableCompanion toCompanion(bool nullToAbsent) {
    return NasaMediaTableCompanion(
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

  factory NasaMediaTableData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NasaMediaTableData(
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

  NasaMediaTableData copyWith({
    String? id,
    String? type,
    String? title,
    String? subTitle,
    String? image,
    String? date,
    String? center,
    String? mediaLink,
    List<String>? keyWord,
  }) => NasaMediaTableData(
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

  NasaMediaTableData copyWithCompanion(NasaMediaTableCompanion data) {
    return NasaMediaTableData(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      subTitle: data.subTitle.present ? data.subTitle.value : this.subTitle,
      image: data.image.present ? data.image.value : this.image,
      date: data.date.present ? data.date.value : this.date,
      center: data.center.present ? data.center.value : this.center,
      mediaLink: data.mediaLink.present ? data.mediaLink.value : this.mediaLink,
      keyWord: data.keyWord.present ? data.keyWord.value : this.keyWord,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NasaMediaTableData(')
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
  int get hashCode => Object.hash(id, type, title, subTitle, image, date, center, mediaLink, keyWord);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NasaMediaTableData &&
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

class NasaMediaTableCompanion extends UpdateCompanion<NasaMediaTableData> {
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

  const NasaMediaTableCompanion({
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

  NasaMediaTableCompanion.insert({
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
  }) : id = Value(id),
       type = Value(type),
       title = Value(title),
       subTitle = Value(subTitle),
       image = Value(image),
       date = Value(date),
       center = Value(center),
       mediaLink = Value(mediaLink),
       keyWord = Value(keyWord);

  static Insertable<NasaMediaTableData> custom({
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

  NasaMediaTableCompanion copyWith({
    Value<String>? id,
    Value<String>? type,
    Value<String>? title,
    Value<String>? subTitle,
    Value<String>? image,
    Value<String>? date,
    Value<String>? center,
    Value<String>? mediaLink,
    Value<List<String>>? keyWord,
    Value<int>? rowid,
  }) {
    return NasaMediaTableCompanion(
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
      map['key_word'] = Variable<String>($NasaMediaTableTable.$converterkeyWord.toSql(keyWord.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NasaMediaTableCompanion(')
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

  $DriftManager get managers => $DriftManager(this);
  late final $NasaMediaTableTable nasaMediaTable = $NasaMediaTableTable(this);

  @override
  Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [nasaMediaTable];
}

typedef $$NasaMediaTableTableCreateCompanionBuilder =
    NasaMediaTableCompanion Function({
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
typedef $$NasaMediaTableTableUpdateCompanionBuilder =
    NasaMediaTableCompanion Function({
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

class $$NasaMediaTableTableFilterComposer extends Composer<_$Drift, $NasaMediaTableTable> {
  $$NasaMediaTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subTitle =>
      $composableBuilder(column: $table.subTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get date => $composableBuilder(column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get center =>
      $composableBuilder(column: $table.center, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaLink =>
      $composableBuilder(column: $table.mediaLink, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get keyWord =>
      $composableBuilder(column: $table.keyWord, builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$NasaMediaTableTableOrderingComposer extends Composer<_$Drift, $NasaMediaTableTable> {
  $$NasaMediaTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subTitle =>
      $composableBuilder(column: $table.subTitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get center =>
      $composableBuilder(column: $table.center, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaLink =>
      $composableBuilder(column: $table.mediaLink, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get keyWord =>
      $composableBuilder(column: $table.keyWord, builder: (column) => ColumnOrderings(column));
}

class $$NasaMediaTableTableAnnotationComposer extends Composer<_$Drift, $NasaMediaTableTable> {
  $$NasaMediaTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type => $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title => $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get subTitle => $composableBuilder(column: $table.subTitle, builder: (column) => column);

  GeneratedColumn<String> get image => $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get date => $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get center => $composableBuilder(column: $table.center, builder: (column) => column);

  GeneratedColumn<String> get mediaLink => $composableBuilder(column: $table.mediaLink, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get keyWord =>
      $composableBuilder(column: $table.keyWord, builder: (column) => column);
}

class $$NasaMediaTableTableTableManager
    extends
        RootTableManager<
          _$Drift,
          $NasaMediaTableTable,
          NasaMediaTableData,
          $$NasaMediaTableTableFilterComposer,
          $$NasaMediaTableTableOrderingComposer,
          $$NasaMediaTableTableAnnotationComposer,
          $$NasaMediaTableTableCreateCompanionBuilder,
          $$NasaMediaTableTableUpdateCompanionBuilder,
          (NasaMediaTableData, BaseReferences<_$Drift, $NasaMediaTableTable, NasaMediaTableData>),
          NasaMediaTableData,
          PrefetchHooks Function()
        > {
  $$NasaMediaTableTableTableManager(_$Drift db, $NasaMediaTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$NasaMediaTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$NasaMediaTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$NasaMediaTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
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
              }) => NasaMediaTableCompanion(
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
          createCompanionCallback:
              ({
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
              }) => NasaMediaTableCompanion.insert(
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
          withReferenceMapper: (p0) => p0.map((e) => (e.readTable(table), BaseReferences(db, table, e))).toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NasaMediaTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Drift,
      $NasaMediaTableTable,
      NasaMediaTableData,
      $$NasaMediaTableTableFilterComposer,
      $$NasaMediaTableTableOrderingComposer,
      $$NasaMediaTableTableAnnotationComposer,
      $$NasaMediaTableTableCreateCompanionBuilder,
      $$NasaMediaTableTableUpdateCompanionBuilder,
      (NasaMediaTableData, BaseReferences<_$Drift, $NasaMediaTableTable, NasaMediaTableData>),
      NasaMediaTableData,
      PrefetchHooks Function()
    >;

class $DriftManager {
  final _$Drift _db;

  $DriftManager(this._db);

  $$NasaMediaTableTableTableManager get nasaMediaTable => $$NasaMediaTableTableTableManager(_db, _db.nasaMediaTable);
}
