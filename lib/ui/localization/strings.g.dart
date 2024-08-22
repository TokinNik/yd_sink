/// Generated file. Do not edit.
///
/// Original: lib/ui/localization
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 140
///
/// Built on 2024-06-13 at 04:04 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.ru;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ru) // set locale
/// - Locale locale = AppLocale.ru.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ru) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	ru(languageCode: 'ru', build: Translations.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of S).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = S.someKey.anotherKey;
/// String b = S['someKey.anotherKey']; // Only for edge cases!
Translations get S => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final S = Translations.of(context); // Get S variable.
/// String a = S.someKey.anotherKey; // Use S variable.
/// String b = S['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.S.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get S => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final S = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsCommonRu common = _StringsCommonRu._(_root);
	String get input_empty_error => 'Поле не может быть пустым';
	late final _StringsSignInRu sign_in = _StringsSignInRu._(_root);
	String get projects_label => 'Проекты';
	late final _StringsTasksRu tasks = _StringsTasksRu._(_root);
	late final _StringsCreateDefectRu create_defect = _StringsCreateDefectRu._(_root);
	late final _StringsAddPhotoRu add_photo = _StringsAddPhotoRu._(_root);
	late final _StringsPhotoGalleryRu photo_gallery = _StringsPhotoGalleryRu._(_root);
	late final _StringsPopupRu popup = _StringsPopupRu._(_root);
	late final _StringsDefectCardRu defect_card = _StringsDefectCardRu._(_root);
	late final _StringsFilterRu filter = _StringsFilterRu._(_root);
	late final _StringsSelectingDatesRu selecting_dates = _StringsSelectingDatesRu._(_root);
	late final _StringsDefectDraftRu defect_draft = _StringsDefectDraftRu._(_root);
	late final _StringsTaskStatusRu task_status = _StringsTaskStatusRu._(_root);
	late final _StringsApiErrorRu api_error = _StringsApiErrorRu._(_root);
	late final _StringsDefectTypeRu defect_type = _StringsDefectTypeRu._(_root);
	late final _StringsTaskTypeRu task_type = _StringsTaskTypeRu._(_root);
	late final _StringsTaskViewRu task_view = _StringsTaskViewRu._(_root);
	late final _StringsConnectionMessageRu connection_message = _StringsConnectionMessageRu._(_root);
	late final _StringsLocalErrorsRu local_errors = _StringsLocalErrorsRu._(_root);
}

// Path: common
class _StringsCommonRu {
	_StringsCommonRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get yes => 'Да';
	String get no => 'Нет';
	String get next => 'Далее';
	String get error_title => 'Ошибка';
	String get ok => 'Ок';
	String get cancel => 'Отменить';
	String get save => 'Сохранить';
	String get error => 'Ошибка';
	String version({required Object version}) => 'Версия ${version}';
}

// Path: sign_in
class _StringsSignInRu {
	_StringsSignInRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get authorisation => 'Авторизация';
	String get login_hint => 'Логин...';
	String get password_hint => 'Пароль...';
	TextSpan policy_hint({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Согласен(-на) с усл-ми '),
		link('Политики конфиденциальности'),
	]);
	String get enter => 'Войти';
}

// Path: tasks
class _StringsTasksRu {
	_StringsTasksRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get search_hint => 'Поиск по задачам';
	String get defects_tab => 'Дефекты';
	String get work_check_tab => 'Приёмка работ';
	String get add_defect_button => 'Добавить дефект';
	String get sort_new_first => 'Сначала новые';
}

// Path: create_defect
class _StringsCreateDefectRu {
	_StringsCreateDefectRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Запись дефекта';
	String get choice_building_hint => 'Выберите строение';
	String get choice_floor_hint => 'Выберите этаж';
	String get name_hint => 'Название';
	String get choice_contractor_hint => 'Выберите подрядчика';
	String get choice_controller_hint => 'Выберите контроль';
	String get task_description_hint => 'Описание задачи';
	String get choice_creation_date_hint => 'Выберите дату создания';
	String get choice_end_date_hint => 'Выберите дату завершения';
	String get choice_regulatory_document_hint => 'Выберите нормативный документ';
	String get choice_defect_type_hint => 'Выберите вид дефекта';
	String get comment_hint => 'Комментарий';
	String get building_label => 'Строение';
	String get floor_label => 'Этаж';
	String get contractor_label => 'Подрядчик';
	String get controller_label => 'Контроль';
	String get normative_doc_label => 'Нормативный документ (от пользователя)';
	String get creation_date_label => 'Дата создания';
	String get end_date_label => 'Дата завершения';
	String get regulatory_document_label => 'Нормативный документ';
	String get defect_type_label => 'Вид дефекта';
	String get photos_label => 'Фотографии';
	String get add_photo_button => 'Добавить фото';
	String get location_on_plan_label => 'Расположение на плане';
	String get set_location_on_plan_button => 'Указать расположение';
	String get recorde_done_message => 'Запись сохранена в черновики';
}

// Path: add_photo
class _StringsAddPhotoRu {
	_StringsAddPhotoRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Добавление фото';
	String get make_photo_button => 'Сделать фото';
	String get make_photo_load_from_gallery_button => 'Загрузить из галереи';
}

// Path: photo_gallery
class _StringsPhotoGalleryRu {
	_StringsPhotoGalleryRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String title({required Object photoNumber, required Object photoCount}) => 'Фото ${photoNumber} из ${photoCount}';
	String get delete_photo => 'Удалить';
}

// Path: popup
class _StringsPopupRu {
	_StringsPopupRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get warning_title => 'Внимание!';
	String warning_network_message({required num n, required Object lastSync}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		zero: 'Время вне сети составляет ${n} часов. \nПоследнее обновление совершено ${lastSync}',
		one: 'Время вне сети составляет ${n} час. \nПоследнее обновление совершено ${lastSync}',
		two: 'Время вне сети составляет ${n} часа. \nПоследнее обновление совершено ${lastSync}',
		few: 'Время вне сети составляет ${n} часа. \nПоследнее обновление совершено ${lastSync}',
		many: 'Время вне сети составляет ${n} часов. \nПоследнее обновление совершено ${lastSync}',
		other: 'Время вне сети составляет ${n} часов. \nПоследнее обновление совершено ${lastSync}',
	);
	String get network_connected_message => 'Соединение восстановлено';
}

// Path: defect_card
class _StringsDefectCardRu {
	_StringsDefectCardRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get contractor_label => 'Подрядчик: ';
	String get work_check_label => 'Приёмка работ: ';
	String created_date_label({required Object date}) => 'Создано ${date}';
	String building_and_floor_value({required Object building, required Object floor}) => 'Строение ${building}, Этаж ${floor}';
}

// Path: filter
class _StringsFilterRu {
	_StringsFilterRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get sort_type_new_first => 'Сначала новые';
	String get sort_type_old_first => 'Сначала старые';
	String get drop_all_filters => 'Сбросить фильтры';
	String get drop_all => 'Сбросить всё';
	String get for_contractor => 'Подрядчик';
	String get choice_contractor => 'Выбор подрядчика';
	String get advanced_search_title => 'Фильтры';
	String get task_type_label => 'Тип задачи';
	String get contractor_label => 'Подрядчик';
	String get select_contractor_hint => 'Выберите подрядчика';
	String get structure_label => 'Строение';
	String get select_structure_hint => 'Выберите строение';
	String get status_label => 'Статус';
	String get defect_type_label => 'Вид дефекта';
	String get defect_create_time => 'Дата создания дефекта';
	String get select_dates_period_hint => 'Выберите период';
	String get select_dates_period_title => 'Выбор периода';
	String get apply_button => 'Найти задачи';
	String get reset_button => 'Сбросить';
	String get list_settings_title => 'Настройки списка';
	String get list_settings_filter => 'Фильтр';
	String get list_settings_task_type => 'Тип задачи';
	String get list_settings_contractor => 'Подрядчик';
	String get list_settings_sort => 'Сортировка';
	String get list_settings_view => 'Отображение';
	String get choice_contractor_title => 'Выбор подрядчика';
	String filtered_task_count_label({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		zero: 'Найдено ${n} задач',
		one: 'Найдена ${n} задача',
		two: 'Найдено ${n} задачи',
		few: 'Найдено ${n} задачи',
		many: 'Найдено ${n} задач',
		other: 'Найдено ${n} задач',
	);
}

// Path: selecting_dates
class _StringsSelectingDatesRu {
	_StringsSelectingDatesRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Выбор периода';
	String get select => 'Применить';
}

// Path: defect_draft
class _StringsDefectDraftRu {
	_StringsDefectDraftRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String number_title({required Object value}) => 'Дефект ${value}';
	String get edit_button => 'Редактировать';
	String get commit_button => 'Опубликовать';
	String get description_label => 'Описание';
	String get continue_filling => 'Продолжить заполнение';
}

// Path: task_status
class _StringsTaskStatusRu {
	_StringsTaskStatusRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get DRAFT => 'Черновик';
	String get NEW => 'Новая';
	String get WAIT_WORKER => 'В ожидании рабочего';
	String get WAIT_WORKER_SECOND_STAGE => 'В ожидании рабочего (2 стадия)';
	String get IN_WORK => 'В работе';
	String get COMPLETED => 'Исправлено';
	String get FINISHED => 'Завершено';
	String get FINISHED_NOT_ACCEPTED => 'Завершено (Не подтверждено)';
	String get REFUSED => 'Отменено';
	String get REVIEW => 'Ревью';
}

// Path: api_error
class _StringsApiErrorRu {
	_StringsApiErrorRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get no_server_response => 'Сервер не отвечает. Попробуйте ещё раз.';
	String server({required Object httpCode}) => 'Ошибка сервера (код: ${httpCode})';
	String generic_client({required Object httpCode}) => 'Не удалось получить детали ошибки (код: ${httpCode})';
	String get no_server_connection => 'Нет соединения с сервером. Проверьте соединение и попробуйте ещё раз.';
	String unknown({required Object httpCode}) => 'Ошибка сети (код: ${httpCode})';
	String get no_connection => 'Нет соединения с интернетом';
	String get session_expired => 'Сессия истекла. Войдите снова, чтобы продолжить работу.';
	String get forbidden => 'Доступ запрещён.';
	String get connection_timeout => 'Время ожидания истекло. Проверьте соединение и попробуйте ещё раз.';
	String bad_request({required Object method, required Object httpCode}) => 'Запрос ${method} не распознан (код: ${httpCode})';
}

// Path: defect_type
class _StringsDefectTypeRu {
	_StringsDefectTypeRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get REMOVABLE => 'Устранимый';
	String get SIGNIFICANT => 'Значительный';
	String get CRITICAL => 'Критический';
}

// Path: task_type
class _StringsTaskTypeRu {
	_StringsTaskTypeRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get ALL => 'Все';
	String get DEFECT => 'Дефект';
	String get WORK_CHECK => 'Приёмка работ';
}

// Path: task_view
class _StringsTaskViewRu {
	_StringsTaskViewRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get ALL => 'Все задачи';
	String get MY_TASK => 'Мои задачи';
}

// Path: connection_message
class _StringsConnectionMessageRu {
	_StringsConnectionMessageRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get connection_lost => 'Соединение потеряно';
	String get connection_resumed => 'Соединение восстановлено';
}

// Path: local_errors
class _StringsLocalErrorsRu {
	_StringsLocalErrorsRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get worker_and_contrator_is_same => 'Контроль и Подрядчик не должны совпадать';
	String get select_floor_first => 'Сначала выберите этаж';
	String get select_house_first => 'Сначала выберите строение';
	String get building_has_no_floors => 'У этого строения нет привязанных этажей';
	String get no_plans_on_this_floor => 'У этого этажа нет привязанных планов';
	String get this_task_synk_in_progress => 'Задача синхронизируется, пожалуйста подождите';
	String get logout_no_internet => 'Отсутствует соединение с сетью Интернет. Выход из учетной записи невозможен';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.yes': return 'Да';
			case 'common.no': return 'Нет';
			case 'common.next': return 'Далее';
			case 'common.error_title': return 'Ошибка';
			case 'common.ok': return 'Ок';
			case 'common.cancel': return 'Отменить';
			case 'common.save': return 'Сохранить';
			case 'common.error': return 'Ошибка';
			case 'common.version': return ({required Object version}) => 'Версия ${version}';
			case 'input_empty_error': return 'Поле не может быть пустым';
			case 'sign_in.authorisation': return 'Авторизация';
			case 'sign_in.login_hint': return 'Логин...';
			case 'sign_in.password_hint': return 'Пароль...';
			case 'sign_in.policy_hint': return ({required InlineSpanBuilder link}) => TextSpan(children: [
				const TextSpan(text: 'Согласен(-на) с усл-ми '),
				link('Политики конфиденциальности'),
			]);
			case 'sign_in.enter': return 'Войти';
			case 'projects_label': return 'Проекты';
			case 'tasks.search_hint': return 'Поиск по задачам';
			case 'tasks.defects_tab': return 'Дефекты';
			case 'tasks.work_check_tab': return 'Приёмка работ';
			case 'tasks.add_defect_button': return 'Добавить дефект';
			case 'tasks.sort_new_first': return 'Сначала новые';
			case 'create_defect.title': return 'Запись дефекта';
			case 'create_defect.choice_building_hint': return 'Выберите строение';
			case 'create_defect.choice_floor_hint': return 'Выберите этаж';
			case 'create_defect.name_hint': return 'Название';
			case 'create_defect.choice_contractor_hint': return 'Выберите подрядчика';
			case 'create_defect.choice_controller_hint': return 'Выберите контроль';
			case 'create_defect.task_description_hint': return 'Описание задачи';
			case 'create_defect.choice_creation_date_hint': return 'Выберите дату создания';
			case 'create_defect.choice_end_date_hint': return 'Выберите дату завершения';
			case 'create_defect.choice_regulatory_document_hint': return 'Выберите нормативный документ';
			case 'create_defect.choice_defect_type_hint': return 'Выберите вид дефекта';
			case 'create_defect.comment_hint': return 'Комментарий';
			case 'create_defect.building_label': return 'Строение';
			case 'create_defect.floor_label': return 'Этаж';
			case 'create_defect.contractor_label': return 'Подрядчик';
			case 'create_defect.controller_label': return 'Контроль';
			case 'create_defect.normative_doc_label': return 'Нормативный документ (от пользователя)';
			case 'create_defect.creation_date_label': return 'Дата создания';
			case 'create_defect.end_date_label': return 'Дата завершения';
			case 'create_defect.regulatory_document_label': return 'Нормативный документ';
			case 'create_defect.defect_type_label': return 'Вид дефекта';
			case 'create_defect.photos_label': return 'Фотографии';
			case 'create_defect.add_photo_button': return 'Добавить фото';
			case 'create_defect.location_on_plan_label': return 'Расположение на плане';
			case 'create_defect.set_location_on_plan_button': return 'Указать расположение';
			case 'create_defect.recorde_done_message': return 'Запись сохранена в черновики';
			case 'add_photo.title': return 'Добавление фото';
			case 'add_photo.make_photo_button': return 'Сделать фото';
			case 'add_photo.make_photo_load_from_gallery_button': return 'Загрузить из галереи';
			case 'photo_gallery.title': return ({required Object photoNumber, required Object photoCount}) => 'Фото ${photoNumber} из ${photoCount}';
			case 'photo_gallery.delete_photo': return 'Удалить';
			case 'popup.warning_title': return 'Внимание!';
			case 'popup.warning_network_message': return ({required num n, required Object lastSync}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
				zero: 'Время вне сети составляет ${n} часов. \nПоследнее обновление совершено ${lastSync}',
				one: 'Время вне сети составляет ${n} час. \nПоследнее обновление совершено ${lastSync}',
				two: 'Время вне сети составляет ${n} часа. \nПоследнее обновление совершено ${lastSync}',
				few: 'Время вне сети составляет ${n} часа. \nПоследнее обновление совершено ${lastSync}',
				many: 'Время вне сети составляет ${n} часов. \nПоследнее обновление совершено ${lastSync}',
				other: 'Время вне сети составляет ${n} часов. \nПоследнее обновление совершено ${lastSync}',
			);
			case 'popup.network_connected_message': return 'Соединение восстановлено';
			case 'defect_card.contractor_label': return 'Подрядчик: ';
			case 'defect_card.work_check_label': return 'Приёмка работ: ';
			case 'defect_card.created_date_label': return ({required Object date}) => 'Создано ${date}';
			case 'defect_card.building_and_floor_value': return ({required Object building, required Object floor}) => 'Строение ${building}, Этаж ${floor}';
			case 'filter.sort_type_new_first': return 'Сначала новые';
			case 'filter.sort_type_old_first': return 'Сначала старые';
			case 'filter.drop_all_filters': return 'Сбросить фильтры';
			case 'filter.drop_all': return 'Сбросить всё';
			case 'filter.for_contractor': return 'Подрядчик';
			case 'filter.choice_contractor': return 'Выбор подрядчика';
			case 'filter.advanced_search_title': return 'Фильтры';
			case 'filter.task_type_label': return 'Тип задачи';
			case 'filter.contractor_label': return 'Подрядчик';
			case 'filter.select_contractor_hint': return 'Выберите подрядчика';
			case 'filter.structure_label': return 'Строение';
			case 'filter.select_structure_hint': return 'Выберите строение';
			case 'filter.status_label': return 'Статус';
			case 'filter.defect_type_label': return 'Вид дефекта';
			case 'filter.defect_create_time': return 'Дата создания дефекта';
			case 'filter.select_dates_period_hint': return 'Выберите период';
			case 'filter.select_dates_period_title': return 'Выбор периода';
			case 'filter.apply_button': return 'Найти задачи';
			case 'filter.reset_button': return 'Сбросить';
			case 'filter.list_settings_title': return 'Настройки списка';
			case 'filter.list_settings_filter': return 'Фильтр';
			case 'filter.list_settings_task_type': return 'Тип задачи';
			case 'filter.list_settings_contractor': return 'Подрядчик';
			case 'filter.list_settings_sort': return 'Сортировка';
			case 'filter.list_settings_view': return 'Отображение';
			case 'filter.choice_contractor_title': return 'Выбор подрядчика';
			case 'filter.filtered_task_count_label': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
				zero: 'Найдено ${n} задач',
				one: 'Найдена ${n} задача',
				two: 'Найдено ${n} задачи',
				few: 'Найдено ${n} задачи',
				many: 'Найдено ${n} задач',
				other: 'Найдено ${n} задач',
			);
			case 'selecting_dates.title': return 'Выбор периода';
			case 'selecting_dates.select': return 'Применить';
			case 'defect_draft.number_title': return ({required Object value}) => 'Дефект ${value}';
			case 'defect_draft.edit_button': return 'Редактировать';
			case 'defect_draft.commit_button': return 'Опубликовать';
			case 'defect_draft.description_label': return 'Описание';
			case 'defect_draft.continue_filling': return 'Продолжить заполнение';
			case 'task_status.DRAFT': return 'Черновик';
			case 'task_status.NEW': return 'Новая';
			case 'task_status.WAIT_WORKER': return 'В ожидании рабочего';
			case 'task_status.WAIT_WORKER_SECOND_STAGE': return 'В ожидании рабочего (2 стадия)';
			case 'task_status.IN_WORK': return 'В работе';
			case 'task_status.COMPLETED': return 'Исправлено';
			case 'task_status.FINISHED': return 'Завершено';
			case 'task_status.FINISHED_NOT_ACCEPTED': return 'Завершено (Не подтверждено)';
			case 'task_status.REFUSED': return 'Отменено';
			case 'task_status.REVIEW': return 'Ревью';
			case 'api_error.no_server_response': return 'Сервер не отвечает. Попробуйте ещё раз.';
			case 'api_error.server': return ({required Object httpCode}) => 'Ошибка сервера (код: ${httpCode})';
			case 'api_error.generic_client': return ({required Object httpCode}) => 'Не удалось получить детали ошибки (код: ${httpCode})';
			case 'api_error.no_server_connection': return 'Нет соединения с сервером. Проверьте соединение и попробуйте ещё раз.';
			case 'api_error.unknown': return ({required Object httpCode}) => 'Ошибка сети (код: ${httpCode})';
			case 'api_error.no_connection': return 'Нет соединения с интернетом';
			case 'api_error.session_expired': return 'Сессия истекла. Войдите снова, чтобы продолжить работу.';
			case 'api_error.forbidden': return 'Доступ запрещён.';
			case 'api_error.connection_timeout': return 'Время ожидания истекло. Проверьте соединение и попробуйте ещё раз.';
			case 'api_error.bad_request': return ({required Object method, required Object httpCode}) => 'Запрос ${method} не распознан (код: ${httpCode})';
			case 'defect_type.REMOVABLE': return 'Устранимый';
			case 'defect_type.SIGNIFICANT': return 'Значительный';
			case 'defect_type.CRITICAL': return 'Критический';
			case 'task_type.ALL': return 'Все';
			case 'task_type.DEFECT': return 'Дефект';
			case 'task_type.WORK_CHECK': return 'Приёмка работ';
			case 'task_view.ALL': return 'Все задачи';
			case 'task_view.MY_TASK': return 'Мои задачи';
			case 'connection_message.connection_lost': return 'Соединение потеряно';
			case 'connection_message.connection_resumed': return 'Соединение восстановлено';
			case 'local_errors.worker_and_contrator_is_same': return 'Контроль и Подрядчик не должны совпадать';
			case 'local_errors.select_floor_first': return 'Сначала выберите этаж';
			case 'local_errors.select_house_first': return 'Сначала выберите строение';
			case 'local_errors.building_has_no_floors': return 'У этого строения нет привязанных этажей';
			case 'local_errors.no_plans_on_this_floor': return 'У этого этажа нет привязанных планов';
			case 'local_errors.this_task_synk_in_progress': return 'Задача синхронизируется, пожалуйста подождите';
			case 'local_errors.logout_no_internet': return 'Отсутствует соединение с сетью Интернет. Выход из учетной записи невозможен';
			default: return null;
		}
	}
}
