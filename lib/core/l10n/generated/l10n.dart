// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `Разрешить`
  String get allow {
    return Intl.message(
      'Разрешить',
      name: 'allow',
      desc: '',
      args: [],
    );
  }

  /// `Логотип приложения`
  String get appLogo {
    return Intl.message(
      'Логотип приложения',
      name: 'appLogo',
      desc: '',
      args: [],
    );
  }

  /// `Тема оформления`
  String get appTheme {
    return Intl.message(
      'Тема оформления',
      name: 'appTheme',
      desc: '',
      args: [],
    );
  }

  /// `Отмена`
  String get cancel {
    return Intl.message(
      'Отмена',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Изменить пароль`
  String get changePassword {
    return Intl.message(
      'Изменить пароль',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Очистить`
  String get clear {
    return Intl.message(
      'Очистить',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Закрыть`
  String get close {
    return Intl.message(
      'Закрыть',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Закрыть окно с настройкой кода доступа`
  String get closePermAlert {
    return Intl.message(
      'Закрыть окно с настройкой кода доступа',
      name: 'closePermAlert',
      desc: '',
      args: [],
    );
  }

  /// `Регистрация аккаунта`
  String get createAccount {
    return Intl.message(
      'Регистрация аккаунта',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Готово`
  String get done {
    return Intl.message(
      'Готово',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Введите код из письма`
  String get enterEmailCode {
    return Intl.message(
      'Введите код из письма',
      name: 'enterEmailCode',
      desc: '',
      args: [],
    );
  }

  /// `Введите код быстрого доступа`
  String get enterFastAccessCode {
    return Intl.message(
      'Введите код быстрого доступа',
      name: 'enterFastAccessCode',
      desc: '',
      args: [],
    );
  }

  /// `Ввести код быстрого доступа`
  String get enterPincode {
    return Intl.message(
      'Ввести код быстрого доступа',
      name: 'enterPincode',
      desc: '',
      args: [],
    );
  }

  /// `Повторите код`
  String get enterPincodeAgain {
    return Intl.message(
      'Повторите код',
      name: 'enterPincodeAgain',
      desc: '',
      args: [],
    );
  }

  /// `Введите код из смс`
  String get enterSmsCode {
    return Intl.message(
      'Введите код из смс',
      name: 'enterSmsCode',
      desc: '',
      args: [],
    );
  }

  /// `Выход из аккаунта`
  String get exitFromAccount {
    return Intl.message(
      'Выход из аккаунта',
      name: 'exitFromAccount',
      desc: '',
      args: [],
    );
  }

  /// `Найти`
  String get find {
    return Intl.message(
      'Найти',
      name: 'find',
      desc: '',
      args: [],
    );
  }

  /// `Забыли пароль`
  String get forgotPassword {
    return Intl.message(
      'Забыли пароль',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Забыли код быстрого доступа?`
  String get forgotPin {
    return Intl.message(
      'Забыли код быстрого доступа?',
      name: 'forgotPin',
      desc: '',
      args: [],
    );
  }

  /// `Для сброса кода быстрого доступа необходимо выйти из аккаунта и авторизоваться снова.`
  String get forgotPinHint {
    return Intl.message(
      'Для сброса кода быстрого доступа необходимо выйти из аккаунта и авторизоваться снова.',
      name: 'forgotPinHint',
      desc: '',
      args: [],
    );
  }

  /// `Имя и фамилия`
  String get fullName {
    return Intl.message(
      'Имя и фамилия',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Есть аккаунт`
  String get haveAccount {
    return Intl.message(
      'Есть аккаунт',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Иконка показать или скрыть пароль`
  String get iconForPassword {
    return Intl.message(
      'Иконка показать или скрыть пароль',
      name: 'iconForPassword',
      desc: '',
      args: [],
    );
  }

  /// `Введите новый email`
  String get inputEmail {
    return Intl.message(
      'Введите новый email',
      name: 'inputEmail',
      desc: '',
      args: [],
    );
  }

  /// `Проверьте email`
  String get inputErrorEmailIncorrect {
    return Intl.message(
      'Проверьте email',
      name: 'inputErrorEmailIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Введите email`
  String get inputErrorEmailIsEmpty {
    return Intl.message(
      'Введите email',
      name: 'inputErrorEmailIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Проверьте данные`
  String get inputErrorGeneral {
    return Intl.message(
      'Проверьте данные',
      name: 'inputErrorGeneral',
      desc: '',
      args: [],
    );
  }

  /// `Введите пароль`
  String get inputErrorPasswordIsEmpty {
    return Intl.message(
      'Введите пароль',
      name: 'inputErrorPasswordIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Минимум 8 символов`
  String get inputErrorPasswordIsShort {
    return Intl.message(
      'Минимум 8 символов',
      name: 'inputErrorPasswordIsShort',
      desc: '',
      args: [],
    );
  }

  /// `Минимум одна цифра`
  String get inputErrorPasswordMustContainDigit {
    return Intl.message(
      'Минимум одна цифра',
      name: 'inputErrorPasswordMustContainDigit',
      desc: '',
      args: [],
    );
  }

  /// `Минимум один специальный символ (%, $, @, &, *, #, ^ и т.д.)`
  String get inputErrorPasswordMustContainSpecSymbol {
    return Intl.message(
      'Минимум один специальный символ (%, \$, @, &, *, #, ^ и т.д.)',
      name: 'inputErrorPasswordMustContainSpecSymbol',
      desc: '',
      args: [],
    );
  }

  /// `Проверьте номер телефона`
  String get inputErrorPhoneIncorrect {
    return Intl.message(
      'Проверьте номер телефона',
      name: 'inputErrorPhoneIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Введите номер телефона`
  String get inputErrorPhoneIsEmpty {
    return Intl.message(
      'Введите номер телефона',
      name: 'inputErrorPhoneIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Введите ИИН`
  String get inputIin {
    return Intl.message(
      'Введите ИИН',
      name: 'inputIin',
      desc: '',
      args: [],
    );
  }

  /// `Введите новый номер телефона`
  String get inputPhone {
    return Intl.message(
      'Введите новый номер телефона',
      name: 'inputPhone',
      desc: '',
      args: [],
    );
  }

  /// `Используйте отпечаток пальца или пароль`
  String get localAuthLocalizedReason {
    return Intl.message(
      'Используйте отпечаток пальца или пароль',
      name: 'localAuthLocalizedReason',
      desc: '',
      args: [],
    );
  }

  /// `Защита паролем не установлена в настройках вашего устройстве`
  String get localAuthNotEnrolled {
    return Intl.message(
      'Защита паролем не установлена в настройках вашего устройстве',
      name: 'localAuthNotEnrolled',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, установите пароль в настройках вашего устройства`
  String get localAuthPassCodeNotSet {
    return Intl.message(
      'Пожалуйста, установите пароль в настройках вашего устройства',
      name: 'localAuthPassCodeNotSet',
      desc: '',
      args: [],
    );
  }

  /// `Слишком много попыток, требуется разблокировка`
  String get localAuthPermanentlyLocked {
    return Intl.message(
      'Слишком много попыток, требуется разблокировка',
      name: 'localAuthPermanentlyLocked',
      desc: '',
      args: [],
    );
  }

  /// `Требуется авторизация`
  String get localAuthSignInTitle {
    return Intl.message(
      'Требуется авторизация',
      name: 'localAuthSignInTitle',
      desc: '',
      args: [],
    );
  }

  /// `Слишком много попыток, попробуйте позже`
  String get localAuthTooManyAttempts {
    return Intl.message(
      'Слишком много попыток, попробуйте позже',
      name: 'localAuthTooManyAttempts',
      desc: '',
      args: [],
    );
  }

  /// `Биометрия недоступна, попробуйте позже`
  String get localAuthUnavailable {
    return Intl.message(
      'Биометрия недоступна, попробуйте позже',
      name: 'localAuthUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Нет`
  String get no {
    return Intl.message(
      'Нет',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Нет аккаунта`
  String get noAccount {
    return Intl.message(
      'Нет аккаунта',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Нет данных`
  String get noData {
    return Intl.message(
      'Нет данных',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Нет, спасибо`
  String get noThanks {
    return Intl.message(
      'Нет, спасибо',
      name: 'noThanks',
      desc: '',
      args: [],
    );
  }

  /// `Или`
  String get or {
    return Intl.message(
      'Или',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Разрешить доступ можно в настройках приватности на вашем устройстве`
  String get permissionsRequestHint {
    return Intl.message(
      'Разрешить доступ можно в настройках приватности на вашем устройстве',
      name: 'permissionsRequestHint',
      desc: '',
      args: [],
    );
  }

  /// `Приложению требуется разрешение на доступ к фото`
  String get permissionsRequestPhoto {
    return Intl.message(
      'Приложению требуется разрешение на доступ к фото',
      name: 'permissionsRequestPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Приложению требуется разрешение на доступ к видео`
  String get permissionsRequestVideo {
    return Intl.message(
      'Приложению требуется разрешение на доступ к видео',
      name: 'permissionsRequestVideo',
      desc: '',
      args: [],
    );
  }

  /// `Приложению требуется разрешение на доступ к камере`
  String get permissionsRequestCamera {
    return Intl.message(
      'Приложению требуется разрешение на доступ к камере',
      name: 'permissionsRequestCamera',
      desc: '',
      args: [],
    );
  }

  /// `Приложению требуется разрешение на доступ к файлам`
  String get permissionsRequestStorage {
    return Intl.message(
      'Приложению требуется разрешение на доступ к файлам',
      name: 'permissionsRequestStorage',
      desc: '',
      args: [],
    );
  }

  /// `Нет разрешения на доступ к уведомлениям`
  String get permissionsRequestPushNotifs {
    return Intl.message(
      'Нет разрешения на доступ к уведомлениям',
      name: 'permissionsRequestPushNotifs',
      desc: '',
      args: [],
    );
  }

  /// `Телефон`
  String get phone {
    return Intl.message(
      'Телефон',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Номер телефона`
  String get phoneNumber {
    return Intl.message(
      'Номер телефона',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Подождите {duration} сек.`
  String pincodeErrorTimeout(Object duration) {
    return Intl.message(
      'Подождите $duration сек.',
      name: 'pincodeErrorTimeout',
      desc: '',
      args: [duration],
    );
  }

  /// `Коды не совпадают`
  String get pinDoesntMatch {
    return Intl.message(
      'Коды не совпадают',
      name: 'pinDoesntMatch',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось отключить уведомления`
  String get pushNotifsErrorCantSwitchOff {
    return Intl.message(
      'Не удалось отключить уведомления',
      name: 'pushNotifsErrorCantSwitchOff',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось включить уведомления`
  String get pushNotifsErrorCantSwitchOn {
    return Intl.message(
      'Не удалось включить уведомления',
      name: 'pushNotifsErrorCantSwitchOn',
      desc: '',
      args: [],
    );
  }

  /// `Восстановить пароль`
  String get recoverPassword {
    return Intl.message(
      'Восстановить пароль',
      name: 'recoverPassword',
      desc: '',
      args: [],
    );
  }

  /// `Пропустить`
  String get skip {
    return Intl.message(
      'Пропустить',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message(
      'Сохранить',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Поиск`
  String get search {
    return Intl.message(
      'Поиск',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Отправить код`
  String get sendCode {
    return Intl.message(
      'Отправить код',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `Отправили код подтверждения на\n{address}`
  String sentCodeTo(Object address) {
    return Intl.message(
      'Отправили код подтверждения на\n$address',
      name: 'sentCodeTo',
      desc: '',
      args: [address],
    );
  }

  /// `Установите код быстрого доступа`
  String get setFastAccessCode {
    return Intl.message(
      'Установите код быстрого доступа',
      name: 'setFastAccessCode',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get signin {
    return Intl.message(
      'Войти',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `Войти как`
  String get signinAs {
    return Intl.message(
      'Войти как',
      name: 'signinAs',
      desc: '',
      args: [],
    );
  }

  /// `Войти через БМГ`
  String get signinViaBmg {
    return Intl.message(
      'Войти через БМГ',
      name: 'signinViaBmg',
      desc: '',
      args: [],
    );
  }

  /// `Войти с Apple`
  String get signinWithApple {
    return Intl.message(
      'Войти с Apple',
      name: 'signinWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Войти с Facebook`
  String get signinWithFacebook {
    return Intl.message(
      'Войти с Facebook',
      name: 'signinWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Войти с Google`
  String get signinWithGoogle {
    return Intl.message(
      'Войти с Google',
      name: 'signinWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Выйти`
  String get signout {
    return Intl.message(
      'Выйти',
      name: 'signout',
      desc: '',
      args: [],
    );
  }

  /// `Выйти из аккаунта`
  String get signoutOfAccount {
    return Intl.message(
      'Выйти из аккаунта',
      name: 'signoutOfAccount',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get signup {
    return Intl.message(
      'Зарегистрироваться',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Запросить код`
  String get smsCodeRequest {
    return Intl.message(
      'Запросить код',
      name: 'smsCodeRequest',
      desc: '',
      args: [],
    );
  }

  /// `Запросить код повторно через {timeout} сек`
  String smsCodeRequestTimeout(Object timeout) {
    return Intl.message(
      'Запросить код повторно через $timeout сек',
      name: 'smsCodeRequestTimeout',
      desc: '',
      args: [timeout],
    );
  }

  /// `Слишком много попыток.\nПожалуйста, подождите`
  String get smsCodeTooManyAttemts {
    return Intl.message(
      'Слишком много попыток.\nПожалуйста, подождите',
      name: 'smsCodeTooManyAttemts',
      desc: '',
      args: [],
    );
  }

  /// `Что-то пошло не так`
  String get somethingWentWrong {
    return Intl.message(
      'Что-то пошло не так',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Текстовое поле`
  String get textField {
    return Intl.message(
      'Текстовое поле',
      name: 'textField',
      desc: '',
      args: [],
    );
  }

  /// `Попробовать снова`
  String get tryAgain {
    return Intl.message(
      'Попробовать снова',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Использовать`
  String get use {
    return Intl.message(
      'Использовать',
      name: 'use',
      desc: '',
      args: [],
    );
  }

  /// `Использовать код быстрого доступа`
  String get useAccessCode {
    return Intl.message(
      'Использовать код быстрого доступа',
      name: 'useAccessCode',
      desc: '',
      args: [],
    );
  }

  /// `Разрешить вход по отпечатку пальца и Face ID?`
  String get useBiometry {
    return Intl.message(
      'Разрешить вход по отпечатку пальца и Face ID?',
      name: 'useBiometry',
      desc: '',
      args: [],
    );
  }

  /// `Разрешить вход по отпечатку пальца?`
  String get useFingerprints {
    return Intl.message(
      'Разрешить вход по отпечатку пальца?',
      name: 'useFingerprints',
      desc: '',
      args: [],
    );
  }

  /// `Cоглашаюсь с условиями`
  String get userLicenseAgree1 {
    return Intl.message(
      'Cоглашаюсь с условиями',
      name: 'userLicenseAgree1',
      desc: '',
      args: [],
    );
  }

  /// `Пользовательского соглашения`
  String get userLicenseAgree2 {
    return Intl.message(
      'Пользовательского соглашения',
      name: 'userLicenseAgree2',
      desc: '',
      args: [],
    );
  }

  /// `По email`
  String get withEmail {
    return Intl.message(
      'По email',
      name: 'withEmail',
      desc: '',
      args: [],
    );
  }

  /// `По мобильному`
  String get withPhone {
    return Intl.message(
      'По мобильному',
      name: 'withPhone',
      desc: '',
      args: [],
    );
  }

  /// `Неверный код`
  String get wrongCode {
    return Intl.message(
      'Неверный код',
      name: 'wrongCode',
      desc: '',
      args: [],
    );
  }

  /// `Нет соединения с интернетом`
  String get error399 {
    return Intl.message(
      'Нет соединения с интернетом',
      name: 'error399',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка 401: пользователь не авторизован`
  String get error401 {
    return Intl.message(
      'Ошибка 401: пользователь не авторизован',
      name: 'error401',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка 403: пользователь не авторизован`
  String get error403 {
    return Intl.message(
      'Ошибка 403: пользователь не авторизован',
      name: 'error403',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка 404: путь не найден, попробуйте позже`
  String get error404 {
    return Intl.message(
      'Ошибка 404: путь не найден, попробуйте позже',
      name: 'error404',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка 408: запрос превысил время ожидания`
  String get error408 {
    return Intl.message(
      'Ошибка 408: запрос превысил время ожидания',
      name: 'error408',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка 500: ошибка на сервере, попробуйте позже`
  String get error500 {
    return Intl.message(
      'Ошибка 500: ошибка на сервере, попробуйте позже',
      name: 'error500',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка 504: превышено время ожидания ответа сервера`
  String get error504 {
    return Intl.message(
      'Ошибка 504: превышено время ожидания ответа сервера',
      name: 'error504',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка 710: конвертация объекта не удалась, попробуйте позже`
  String get error710 {
    return Intl.message(
      'Ошибка 710: конвертация объекта не удалась, попробуйте позже',
      name: 'error710',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка 711: не удалось записать данные на устройство`
  String get error711 {
    return Intl.message(
      'Ошибка 711: не удалось записать данные на устройство',
      name: 'error711',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка 712: не удалось прочитать данные с устройства`
  String get error712 {
    return Intl.message(
      'Ошибка 712: не удалось прочитать данные с устройства',
      name: 'error712',
      desc: '',
      args: [],
    );
  }

  /// `О приложении`
  String get aboutApp {
    return Intl.message(
      'О приложении',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// `Все сервисы`
  String get allServices {
    return Intl.message(
      'Все сервисы',
      name: 'allServices',
      desc: '',
      args: [],
    );
  }

  /// `Вы действительно хотите выйти?`
  String get appExitConfirmation {
    return Intl.message(
      'Вы действительно хотите выйти?',
      name: 'appExitConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Вход по отпечатку пальца и Face ID`
  String get biometrics {
    return Intl.message(
      'Вход по отпечатку пальца и Face ID',
      name: 'biometrics',
      desc: '',
      args: [],
    );
  }

  /// `Изменить email`
  String get changeEmail {
    return Intl.message(
      'Изменить email',
      name: 'changeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Изменить код быстрого доступа`
  String get changeFastAccessCode {
    return Intl.message(
      'Изменить код быстрого доступа',
      name: 'changeFastAccessCode',
      desc: '',
      args: [],
    );
  }

  /// `Изменить номер телефона`
  String get changePhoneNumber {
    return Intl.message(
      'Изменить номер телефона',
      name: 'changePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Закрыть диалоговое окно`
  String get closeModal {
    return Intl.message(
      'Закрыть диалоговое окно',
      name: 'closeModal',
      desc: '',
      args: [],
    );
  }

  /// `Подтвердить`
  String get confirm {
    return Intl.message(
      'Подтвердить',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Подтвердить пароль`
  String get confPassword {
    return Intl.message(
      'Подтвердить пароль',
      name: 'confPassword',
      desc: '',
      args: [],
    );
  }

  /// `Текущий пароль`
  String get currentPassword {
    return Intl.message(
      'Текущий пароль',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Введите код из письма`
  String get emailCodeLabel {
    return Intl.message(
      'Введите код из письма',
      name: 'emailCodeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Email сохранен`
  String get emailSaved {
    return Intl.message(
      'Email сохранен',
      name: 'emailSaved',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get error {
    return Intl.message(
      'Ошибка',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Помощь`
  String get help {
    return Intl.message(
      'Помощь',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Язык интерфейса`
  String get interfaceLang {
    return Intl.message(
      'Язык интерфейса',
      name: 'interfaceLang',
      desc: '',
      args: [],
    );
  }

  /// `Казахский`
  String get kazakh {
    return Intl.message(
      'Казахский',
      name: 'kazakh',
      desc: '',
      args: [],
    );
  }

  /// `Язык`
  String get language {
    return Intl.message(
      'Язык',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Главная`
  String get main {
    return Intl.message(
      'Главная',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Показать главное меню`
  String get mainMenuHint {
    return Intl.message(
      'Показать главное меню',
      name: 'mainMenuHint',
      desc: '',
      args: [],
    );
  }

  /// `Перейти на экран уведомлений`
  String get navigateToNotificationsScreen {
    return Intl.message(
      'Перейти на экран уведомлений',
      name: 'navigateToNotificationsScreen',
      desc: '',
      args: [],
    );
  }

  /// `Новый пароль`
  String get newPassword {
    return Intl.message(
      'Новый пароль',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Уведомления`
  String get notifs {
    return Intl.message(
      'Уведомления',
      name: 'notifs',
      desc: '',
      args: [],
    );
  }

  /// `Номер отсутствует`
  String get numberIsMissing {
    return Intl.message(
      'Номер отсутствует',
      name: 'numberIsMissing',
      desc: '',
      args: [],
    );
  }

  /// `ОК`
  String get okay {
    return Intl.message(
      'ОК',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `Пароль сохранен`
  String get passwordSaved {
    return Intl.message(
      'Пароль сохранен',
      name: 'passwordSaved',
      desc: '',
      args: [],
    );
  }

  /// `Пароли не совпадают`
  String get passwordsDontMatch {
    return Intl.message(
      'Пароли не совпадают',
      name: 'passwordsDontMatch',
      desc: '',
      args: [],
    );
  }

  /// `Номер телефона сохранен`
  String get phoneNumberSaved {
    return Intl.message(
      'Номер телефона сохранен',
      name: 'phoneNumberSaved',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Push - уведомления`
  String get pushNotifs {
    return Intl.message(
      'Push - уведомления',
      name: 'pushNotifs',
      desc: '',
      args: [],
    );
  }

  /// `Удалить аккаунт`
  String get removeAccount {
    return Intl.message(
      'Удалить аккаунт',
      name: 'removeAccount',
      desc: '',
      args: [],
    );
  }

  /// `Русский`
  String get russian {
    return Intl.message(
      'Русский',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `Безопасность`
  String get security {
    return Intl.message(
      'Безопасность',
      name: 'security',
      desc: '',
      args: [],
    );
  }

  /// `Политика безопасности`
  String get securityPolicy {
    return Intl.message(
      'Политика безопасности',
      name: 'securityPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Отправить смс-код`
  String get sendSmsCode {
    return Intl.message(
      'Отправить смс-код',
      name: 'sendSmsCode',
      desc: '',
      args: [],
    );
  }

  /// `Настройки`
  String get settings {
    return Intl.message(
      'Настройки',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Нажмите для переключения`
  String get tapToSwitch {
    return Intl.message(
      'Нажмите для переключения',
      name: 'tapToSwitch',
      desc: '',
      args: [],
    );
  }

  /// `Использовать код быстрого доступа`
  String get useFastAccessCode {
    return Intl.message(
      'Использовать код быстрого доступа',
      name: 'useFastAccessCode',
      desc: '',
      args: [],
    );
  }

  /// `Пользовательское соглашение`
  String get userAgreement {
    return Intl.message(
      'Пользовательское соглашение',
      name: 'userAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Удалить аккаунт`
  String get accountDelete {
    return Intl.message(
      'Удалить аккаунт',
      name: 'accountDelete',
      desc: '',
      args: [],
    );
  }

  /// `Ваши данные будут удалены без возможности восстановления.`
  String get accountDeletetionConfirmationBody {
    return Intl.message(
      'Ваши данные будут удалены без возможности восстановления.',
      name: 'accountDeletetionConfirmationBody',
      desc: '',
      args: [],
    );
  }

  /// `Вы действительно хотите удалить аккаунт?`
  String get accountDeletetionConfirmationTitle {
    return Intl.message(
      'Вы действительно хотите удалить аккаунт?',
      name: 'accountDeletetionConfirmationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Аккаунт удален`
  String get accountIsDeleted {
    return Intl.message(
      'Аккаунт удален',
      name: 'accountIsDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Выйти из аккаунта?`
  String get accountLogout {
    return Intl.message(
      'Выйти из аккаунта?',
      name: 'accountLogout',
      desc: '',
      args: [],
    );
  }

  /// `Согласиться`
  String get agree {
    return Intl.message(
      'Согласиться',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `Вы действительно хотите выйти?`
  String get areYouSureWantToExit {
    return Intl.message(
      'Вы действительно хотите выйти?',
      name: 'areYouSureWantToExit',
      desc: '',
      args: [],
    );
  }

  /// `Назад`
  String get back {
    return Intl.message(
      'Назад',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Вход по отпечатку пальца и Face ID`
  String get biometricEntry {
    return Intl.message(
      'Вход по отпечатку пальца и Face ID',
      name: 'biometricEntry',
      desc: '',
      args: [],
    );
  }

  /// `Использование отпечатка пальца/Face ID возможно только при установленном коде быстрого доступа`
  String get biometricsOnlyWithPin {
    return Intl.message(
      'Использование отпечатка пальца/Face ID возможно только при установленном коде быстрого доступа',
      name: 'biometricsOnlyWithPin',
      desc: '',
      args: [],
    );
  }

  /// `По email`
  String get byEmail {
    return Intl.message(
      'По email',
      name: 'byEmail',
      desc: '',
      args: [],
    );
  }

  /// `По мобильному`
  String get byPhone {
    return Intl.message(
      'По мобильному',
      name: 'byPhone',
      desc: '',
      args: [],
    );
  }

  /// `Отменить`
  String get cancelVerb {
    return Intl.message(
      'Отменить',
      name: 'cancelVerb',
      desc: '',
      args: [],
    );
  }

  /// `Изменить`
  String get change {
    return Intl.message(
      'Изменить',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Изменить код быстрого доступа`
  String get changeAccessCode {
    return Intl.message(
      'Изменить код быстрого доступа',
      name: 'changeAccessCode',
      desc: '',
      args: [],
    );
  }

  /// `Проверьте введенные данные`
  String get checkData {
    return Intl.message(
      'Проверьте введенные данные',
      name: 'checkData',
      desc: '',
      args: [],
    );
  }

  /// `Выбрать`
  String get choose {
    return Intl.message(
      'Выбрать',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Отправили код подтверждения на\n{address}`
  String codeLabelHint(Object address) {
    return Intl.message(
      'Отправили код подтверждения на\n$address',
      name: 'codeLabelHint',
      desc: '',
      args: [address],
    );
  }

  /// `Код отправлен на номер {phone}`
  String codeSentFor(Object phone) {
    return Intl.message(
      'Код отправлен на номер $phone',
      name: 'codeSentFor',
      desc: '',
      args: [phone],
    );
  }

  /// `Вернуться назад`
  String get comeBack {
    return Intl.message(
      'Вернуться назад',
      name: 'comeBack',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get delete {
    return Intl.message(
      'Удалить',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Сбросить`
  String get discard {
    return Intl.message(
      'Сбросить',
      name: 'discard',
      desc: '',
      args: [],
    );
  }

  /// `Нет аккаунта`
  String get dontHaveAccount {
    return Intl.message(
      'Нет аккаунта',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Введите код быстрого доступа`
  String get enterPincodeImperative {
    return Intl.message(
      'Введите код быстрого доступа',
      name: 'enterPincodeImperative',
      desc: '',
      args: [],
    );
  }

  /// `Выход`
  String get exit {
    return Intl.message(
      'Выход',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Вход по биометрии`
  String get faceIdAuth {
    return Intl.message(
      'Вход по биометрии',
      name: 'faceIdAuth',
      desc: '',
      args: [],
    );
  }

  /// `Вход по отпечатку пальца`
  String get fingerprintsAuth {
    return Intl.message(
      'Вход по отпечатку пальца',
      name: 'fingerprintsAuth',
      desc: '',
      args: [],
    );
  }

  /// `Забыли код-пароль?`
  String get forgotPincode {
    return Intl.message(
      'Забыли код-пароль?',
      name: 'forgotPincode',
      desc: '',
      args: [],
    );
  }

  /// `Список пуст`
  String get listIsEmpty {
    return Intl.message(
      'Список пуст',
      name: 'listIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Выйти`
  String get logout {
    return Intl.message(
      'Выйти',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get name {
    return Intl.message(
      'Имя',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Далее`
  String get next {
    return Intl.message(
      'Далее',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось отпределить тип уведомления`
  String get noNotificationType {
    return Intl.message(
      'Не удалось отпределить тип уведомления',
      name: 'noNotificationType',
      desc: '',
      args: [],
    );
  }

  /// `Уведомление`
  String get notification {
    return Intl.message(
      'Уведомление',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Уведомления`
  String get notifications {
    return Intl.message(
      'Уведомления',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Понятно, спасибо`
  String get ok {
    return Intl.message(
      'Понятно, спасибо',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Пароли не совпадают`
  String get passwordsDidntMatched {
    return Intl.message(
      'Пароли не совпадают',
      name: 'passwordsDidntMatched',
      desc: '',
      args: [],
    );
  }

  /// `Согласен на сбор и обработку персональных данных`
  String get personalDataUsage {
    return Intl.message(
      'Согласен на сбор и обработку персональных данных',
      name: 'personalDataUsage',
      desc: '',
      args: [],
    );
  }

  /// `Личные данные`
  String get personData {
    return Intl.message(
      'Личные данные',
      name: 'personData',
      desc: '',
      args: [],
    );
  }

  /// `Номер телефона сохранен`
  String get phoneSaved {
    return Intl.message(
      'Номер телефона сохранен',
      name: 'phoneSaved',
      desc: '',
      args: [],
    );
  }

  /// `Вход по коду быстрого доступа`
  String get pincodeAuth {
    return Intl.message(
      'Вход по коду быстрого доступа',
      name: 'pincodeAuth',
      desc: '',
      args: [],
    );
  }

  /// `Забыли код быстрого доступа?`
  String get pinForgot {
    return Intl.message(
      'Забыли код быстрого доступа?',
      name: 'pinForgot',
      desc: '',
      args: [],
    );
  }

  /// `Для сброса кода быстрого доступа необходимо выйти из аккаунта и авторизоваться снова.`
  String get pinForgotText {
    return Intl.message(
      'Для сброса кода быстрого доступа необходимо выйти из аккаунта и авторизоваться снова.',
      name: 'pinForgotText',
      desc: '',
      args: [],
    );
  }

  /// `Push - уведомления`
  String get pushNotifications {
    return Intl.message(
      'Push - уведомления',
      name: 'pushNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get signIn {
    return Intl.message(
      'Войти',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Войти с Apple`
  String get signInWithApple {
    return Intl.message(
      'Войти с Apple',
      name: 'signInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Войти с Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Войти с Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Войти с Google`
  String get signInWithGoogle {
    return Intl.message(
      'Войти с Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get signUp {
    return Intl.message(
      'Зарегистрироваться',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Пользователь`
  String get user {
    return Intl.message(
      'Пользователь',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Версия `
  String get version {
    return Intl.message(
      'Версия ',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Да`
  String get yes {
    return Intl.message(
      'Да',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Вы получили новое уведомление!`
  String get youGetNewNotification {
    return Intl.message(
      'Вы получили новое уведомление!',
      name: 'youGetNewNotification',
      desc: '',
      args: [],
    );
  }

  /// `Рецепты`
  String get receipes {
    return Intl.message(
      'Рецепты',
      name: 'receipes',
      desc: '',
      args: [],
    );
  }

  /// `Продукты`
  String get products {
    return Intl.message(
      'Продукты',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Цитаты`
  String get quotes {
    return Intl.message(
      'Цитаты',
      name: 'quotes',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'kk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
