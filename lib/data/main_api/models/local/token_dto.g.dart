// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTokenDtoCollection on Isar {
  IsarCollection<TokenDto> get tokenDtos => this.collection();
}

const TokenDtoSchema = CollectionSchema(
  name: r'TokenDto',
  id: -2886639869332665103,
  properties: {
    r'accessToken': PropertySchema(
      id: 0,
      name: r'accessToken',
      type: IsarType.string,
    ),
    r'refreshToken': PropertySchema(
      id: 1,
      name: r'refreshToken',
      type: IsarType.string,
    )
  },
  estimateSize: _tokenDtoEstimateSize,
  serialize: _tokenDtoSerialize,
  deserialize: _tokenDtoDeserialize,
  deserializeProp: _tokenDtoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tokenDtoGetId,
  getLinks: _tokenDtoGetLinks,
  attach: _tokenDtoAttach,
  version: '3.1.0+1',
);

int _tokenDtoEstimateSize(
  TokenDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.accessToken.length * 3;
  bytesCount += 3 + object.refreshToken.length * 3;
  return bytesCount;
}

void _tokenDtoSerialize(
  TokenDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accessToken);
  writer.writeString(offsets[1], object.refreshToken);
}

TokenDto _tokenDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TokenDto();
  object.accessToken = reader.readString(offsets[0]);
  object.id = id;
  object.refreshToken = reader.readString(offsets[1]);
  return object;
}

P _tokenDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tokenDtoGetId(TokenDto object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tokenDtoGetLinks(TokenDto object) {
  return [];
}

void _tokenDtoAttach(IsarCollection<dynamic> col, Id id, TokenDto object) {
  object.id = id;
}

extension TokenDtoQueryWhereSort on QueryBuilder<TokenDto, TokenDto, QWhere> {
  QueryBuilder<TokenDto, TokenDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TokenDtoQueryWhere on QueryBuilder<TokenDto, TokenDto, QWhereClause> {
  QueryBuilder<TokenDto, TokenDto, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TokenDtoQueryFilter
    on QueryBuilder<TokenDto, TokenDto, QFilterCondition> {
  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> accessTokenEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition>
      accessTokenGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> accessTokenLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> accessTokenBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accessToken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> accessTokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> accessTokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> accessTokenContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> accessTokenMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accessToken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> accessTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accessToken',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition>
      accessTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accessToken',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> refreshTokenEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition>
      refreshTokenGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> refreshTokenLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> refreshTokenBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'refreshToken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition>
      refreshTokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> refreshTokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> refreshTokenContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'refreshToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition> refreshTokenMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'refreshToken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition>
      refreshTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refreshToken',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterFilterCondition>
      refreshTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'refreshToken',
        value: '',
      ));
    });
  }
}

extension TokenDtoQueryObject
    on QueryBuilder<TokenDto, TokenDto, QFilterCondition> {}

extension TokenDtoQueryLinks
    on QueryBuilder<TokenDto, TokenDto, QFilterCondition> {}

extension TokenDtoQuerySortBy on QueryBuilder<TokenDto, TokenDto, QSortBy> {
  QueryBuilder<TokenDto, TokenDto, QAfterSortBy> sortByAccessToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessToken', Sort.asc);
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterSortBy> sortByAccessTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessToken', Sort.desc);
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterSortBy> sortByRefreshToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refreshToken', Sort.asc);
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterSortBy> sortByRefreshTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refreshToken', Sort.desc);
    });
  }
}

extension TokenDtoQuerySortThenBy
    on QueryBuilder<TokenDto, TokenDto, QSortThenBy> {
  QueryBuilder<TokenDto, TokenDto, QAfterSortBy> thenByAccessToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessToken', Sort.asc);
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterSortBy> thenByAccessTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessToken', Sort.desc);
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterSortBy> thenByRefreshToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refreshToken', Sort.asc);
    });
  }

  QueryBuilder<TokenDto, TokenDto, QAfterSortBy> thenByRefreshTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refreshToken', Sort.desc);
    });
  }
}

extension TokenDtoQueryWhereDistinct
    on QueryBuilder<TokenDto, TokenDto, QDistinct> {
  QueryBuilder<TokenDto, TokenDto, QDistinct> distinctByAccessToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accessToken', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenDto, TokenDto, QDistinct> distinctByRefreshToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'refreshToken', caseSensitive: caseSensitive);
    });
  }
}

extension TokenDtoQueryProperty
    on QueryBuilder<TokenDto, TokenDto, QQueryProperty> {
  QueryBuilder<TokenDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TokenDto, String, QQueryOperations> accessTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accessToken');
    });
  }

  QueryBuilder<TokenDto, String, QQueryOperations> refreshTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refreshToken');
    });
  }
}
