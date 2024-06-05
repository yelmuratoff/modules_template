// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(address) => "Отправили код подтверждения на\n${address}";

  static String m1(phone) => "Код отправлен на номер ${phone}";

  static String m2(duration) => "Подождите ${duration} сек.";

  static String m3(address) => "Отправили код подтверждения на\n${address}";

  static String m4(timeout) => "Запросить код повторно через ${timeout} сек";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutApp": MessageLookupByLibrary.simpleMessage("О приложении"),
        "accountDelete":
            MessageLookupByLibrary.simpleMessage("Удалить аккаунт"),
        "accountDeletetionConfirmationBody":
            MessageLookupByLibrary.simpleMessage(
                "Ваши данные будут удалены без возможности восстановления."),
        "accountDeletetionConfirmationTitle":
            MessageLookupByLibrary.simpleMessage(
                "Вы действительно хотите удалить аккаунт?"),
        "accountIsDeleted":
            MessageLookupByLibrary.simpleMessage("Аккаунт удален"),
        "accountLogout":
            MessageLookupByLibrary.simpleMessage("Выйти из аккаунта?"),
        "agree": MessageLookupByLibrary.simpleMessage("Согласиться"),
        "allServices": MessageLookupByLibrary.simpleMessage("Все сервисы"),
        "allow": MessageLookupByLibrary.simpleMessage("Разрешить"),
        "appExitConfirmation": MessageLookupByLibrary.simpleMessage(
            "Вы действительно хотите выйти?"),
        "appLogo": MessageLookupByLibrary.simpleMessage("Логотип приложения"),
        "appTheme": MessageLookupByLibrary.simpleMessage("Тема оформления"),
        "areYouSureWantToExit": MessageLookupByLibrary.simpleMessage(
            "Вы действительно хотите выйти?"),
        "back": MessageLookupByLibrary.simpleMessage("Назад"),
        "biometricEntry": MessageLookupByLibrary.simpleMessage(
            "Вход по отпечатку пальца и Face ID"),
        "biometrics": MessageLookupByLibrary.simpleMessage(
            "Вход по отпечатку пальца и Face ID"),
        "biometricsOnlyWithPin": MessageLookupByLibrary.simpleMessage(
            "Использование отпечатка пальца/Face ID возможно только при установленном коде быстрого доступа"),
        "byEmail": MessageLookupByLibrary.simpleMessage("По email"),
        "byPhone": MessageLookupByLibrary.simpleMessage("По мобильному"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "cancelVerb": MessageLookupByLibrary.simpleMessage("Отменить"),
        "change": MessageLookupByLibrary.simpleMessage("Изменить"),
        "changeAccessCode": MessageLookupByLibrary.simpleMessage(
            "Изменить код быстрого доступа"),
        "changeEmail": MessageLookupByLibrary.simpleMessage("Изменить email"),
        "changeFastAccessCode": MessageLookupByLibrary.simpleMessage(
            "Изменить код быстрого доступа"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Изменить пароль"),
        "changePhoneNumber":
            MessageLookupByLibrary.simpleMessage("Изменить номер телефона"),
        "checkData":
            MessageLookupByLibrary.simpleMessage("Проверьте введенные данные"),
        "choose": MessageLookupByLibrary.simpleMessage("Выбрать"),
        "clear": MessageLookupByLibrary.simpleMessage("Очистить"),
        "close": MessageLookupByLibrary.simpleMessage("Закрыть"),
        "closeModal":
            MessageLookupByLibrary.simpleMessage("Закрыть диалоговое окно"),
        "closePermAlert": MessageLookupByLibrary.simpleMessage(
            "Закрыть окно с настройкой кода доступа"),
        "codeLabelHint": m0,
        "codeSentFor": m1,
        "comeBack": MessageLookupByLibrary.simpleMessage("Вернуться назад"),
        "confPassword":
            MessageLookupByLibrary.simpleMessage("Подтвердить пароль"),
        "confirm": MessageLookupByLibrary.simpleMessage("Подтвердить"),
        "createAccount":
            MessageLookupByLibrary.simpleMessage("Регистрация аккаунта"),
        "currentPassword":
            MessageLookupByLibrary.simpleMessage("Текущий пароль"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "discard": MessageLookupByLibrary.simpleMessage("Сбросить"),
        "done": MessageLookupByLibrary.simpleMessage("Готово"),
        "dontHaveAccount": MessageLookupByLibrary.simpleMessage("Нет аккаунта"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailCodeLabel":
            MessageLookupByLibrary.simpleMessage("Введите код из письма"),
        "emailSaved": MessageLookupByLibrary.simpleMessage("Email сохранен"),
        "enterEmailCode":
            MessageLookupByLibrary.simpleMessage("Введите код из письма"),
        "enterFastAccessCode": MessageLookupByLibrary.simpleMessage(
            "Введите код быстрого доступа"),
        "enterPincode":
            MessageLookupByLibrary.simpleMessage("Ввести код быстрого доступа"),
        "enterPincodeAgain":
            MessageLookupByLibrary.simpleMessage("Повторите код"),
        "enterPincodeImperative": MessageLookupByLibrary.simpleMessage(
            "Введите код быстрого доступа"),
        "enterSmsCode":
            MessageLookupByLibrary.simpleMessage("Введите код из смс"),
        "error": MessageLookupByLibrary.simpleMessage("Ошибка"),
        "error399":
            MessageLookupByLibrary.simpleMessage("Нет соединения с интернетом"),
        "error401": MessageLookupByLibrary.simpleMessage(
            "Ошибка 401: пользователь не авторизован"),
        "error403": MessageLookupByLibrary.simpleMessage(
            "Ошибка 403: пользователь не авторизован"),
        "error404": MessageLookupByLibrary.simpleMessage(
            "Ошибка 404: путь не найден, попробуйте позже"),
        "error408": MessageLookupByLibrary.simpleMessage(
            "Ошибка 408: запрос превысил время ожидания"),
        "error500": MessageLookupByLibrary.simpleMessage(
            "Ошибка 500: ошибка на сервере, попробуйте позже"),
        "error504": MessageLookupByLibrary.simpleMessage(
            "Ошибка 504: превышено время ожидания ответа сервера"),
        "error710": MessageLookupByLibrary.simpleMessage(
            "Ошибка 710: конвертация объекта не удалась, попробуйте позже"),
        "error711": MessageLookupByLibrary.simpleMessage(
            "Ошибка 711: не удалось записать данные на устройство"),
        "error712": MessageLookupByLibrary.simpleMessage(
            "Ошибка 712: не удалось прочитать данные с устройства"),
        "exit": MessageLookupByLibrary.simpleMessage("Выход"),
        "exitFromAccount":
            MessageLookupByLibrary.simpleMessage("Выход из аккаунта"),
        "faceIdAuth": MessageLookupByLibrary.simpleMessage("Вход по биометрии"),
        "find": MessageLookupByLibrary.simpleMessage("Найти"),
        "fingerprintsAuth":
            MessageLookupByLibrary.simpleMessage("Вход по отпечатку пальца"),
        "forgotPassword": MessageLookupByLibrary.simpleMessage("Забыли пароль"),
        "forgotPin": MessageLookupByLibrary.simpleMessage(
            "Забыли код быстрого доступа?"),
        "forgotPinHint": MessageLookupByLibrary.simpleMessage(
            "Для сброса кода быстрого доступа необходимо выйти из аккаунта и авторизоваться снова."),
        "forgotPincode":
            MessageLookupByLibrary.simpleMessage("Забыли код-пароль?"),
        "fullName": MessageLookupByLibrary.simpleMessage("Имя и фамилия"),
        "haveAccount": MessageLookupByLibrary.simpleMessage("Есть аккаунт"),
        "help": MessageLookupByLibrary.simpleMessage("Помощь"),
        "iconForPassword": MessageLookupByLibrary.simpleMessage(
            "Иконка показать или скрыть пароль"),
        "inputEmail":
            MessageLookupByLibrary.simpleMessage("Введите новый email"),
        "inputErrorEmailIncorrect":
            MessageLookupByLibrary.simpleMessage("Проверьте email"),
        "inputErrorEmailIsEmpty":
            MessageLookupByLibrary.simpleMessage("Введите email"),
        "inputErrorGeneral":
            MessageLookupByLibrary.simpleMessage("Проверьте данные"),
        "inputErrorPasswordIsEmpty":
            MessageLookupByLibrary.simpleMessage("Введите пароль"),
        "inputErrorPasswordIsShort":
            MessageLookupByLibrary.simpleMessage("Минимум 8 символов"),
        "inputErrorPasswordMustContainDigit":
            MessageLookupByLibrary.simpleMessage("Минимум одна цифра"),
        "inputErrorPasswordMustContainSpecSymbol":
            MessageLookupByLibrary.simpleMessage(
                "Минимум один специальный символ (%, \$, @, &, *, #, ^ и т.д.)"),
        "inputErrorPhoneIncorrect":
            MessageLookupByLibrary.simpleMessage("Проверьте номер телефона"),
        "inputErrorPhoneIsEmpty":
            MessageLookupByLibrary.simpleMessage("Введите номер телефона"),
        "inputIin": MessageLookupByLibrary.simpleMessage("Введите ИИН"),
        "inputPhone": MessageLookupByLibrary.simpleMessage(
            "Введите новый номер телефона"),
        "interfaceLang":
            MessageLookupByLibrary.simpleMessage("Язык интерфейса"),
        "kazakh": MessageLookupByLibrary.simpleMessage("Казахский"),
        "language": MessageLookupByLibrary.simpleMessage("Язык"),
        "listIsEmpty": MessageLookupByLibrary.simpleMessage("Список пуст"),
        "localAuthLocalizedReason": MessageLookupByLibrary.simpleMessage(
            "Используйте отпечаток пальца или пароль"),
        "localAuthNotEnrolled": MessageLookupByLibrary.simpleMessage(
            "Защита паролем не установлена в настройках вашего устройстве"),
        "localAuthPassCodeNotSet": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, установите пароль в настройках вашего устройства"),
        "localAuthPermanentlyLocked": MessageLookupByLibrary.simpleMessage(
            "Слишком много попыток, требуется разблокировка"),
        "localAuthSignInTitle":
            MessageLookupByLibrary.simpleMessage("Требуется авторизация"),
        "localAuthTooManyAttempts": MessageLookupByLibrary.simpleMessage(
            "Слишком много попыток, попробуйте позже"),
        "localAuthUnavailable": MessageLookupByLibrary.simpleMessage(
            "Биометрия недоступна, попробуйте позже"),
        "logout": MessageLookupByLibrary.simpleMessage("Выйти"),
        "main": MessageLookupByLibrary.simpleMessage("Главная"),
        "mainMenuHint":
            MessageLookupByLibrary.simpleMessage("Показать главное меню"),
        "name": MessageLookupByLibrary.simpleMessage("Имя"),
        "navigateToNotificationsScreen": MessageLookupByLibrary.simpleMessage(
            "Перейти на экран уведомлений"),
        "newPassword": MessageLookupByLibrary.simpleMessage("Новый пароль"),
        "next": MessageLookupByLibrary.simpleMessage("Далее"),
        "no": MessageLookupByLibrary.simpleMessage("Нет"),
        "noAccount": MessageLookupByLibrary.simpleMessage("Нет аккаунта"),
        "noData": MessageLookupByLibrary.simpleMessage("Нет данных"),
        "noNotificationType": MessageLookupByLibrary.simpleMessage(
            "Не удалось отпределить тип уведомления"),
        "noThanks": MessageLookupByLibrary.simpleMessage("Нет, спасибо"),
        "notification": MessageLookupByLibrary.simpleMessage("Уведомление"),
        "notifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
        "notifs": MessageLookupByLibrary.simpleMessage("Уведомления"),
        "numberIsMissing":
            MessageLookupByLibrary.simpleMessage("Номер отсутствует"),
        "ok": MessageLookupByLibrary.simpleMessage("Понятно, спасибо"),
        "okay": MessageLookupByLibrary.simpleMessage("ОК"),
        "or": MessageLookupByLibrary.simpleMessage("Или"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "passwordSaved":
            MessageLookupByLibrary.simpleMessage("Пароль сохранен"),
        "passwordsDidntMatched":
            MessageLookupByLibrary.simpleMessage("Пароли не совпадают"),
        "passwordsDontMatch":
            MessageLookupByLibrary.simpleMessage("Пароли не совпадают"),
        "permissionsRequestCamera": MessageLookupByLibrary.simpleMessage(
            "Приложению требуется разрешение на доступ к камере"),
        "permissionsRequestHint": MessageLookupByLibrary.simpleMessage(
            "Разрешить доступ можно в настройках приватности на вашем устройстве"),
        "permissionsRequestPhoto": MessageLookupByLibrary.simpleMessage(
            "Приложению требуется разрешение на доступ к фото"),
        "permissionsRequestPushNotifs": MessageLookupByLibrary.simpleMessage(
            "Нет разрешения на доступ к уведомлениям"),
        "permissionsRequestStorage": MessageLookupByLibrary.simpleMessage(
            "Приложению требуется разрешение на доступ к файлам"),
        "permissionsRequestVideo": MessageLookupByLibrary.simpleMessage(
            "Приложению требуется разрешение на доступ к видео"),
        "personData": MessageLookupByLibrary.simpleMessage("Личные данные"),
        "personalDataUsage": MessageLookupByLibrary.simpleMessage(
            "Согласен на сбор и обработку персональных данных"),
        "phone": MessageLookupByLibrary.simpleMessage("Телефон"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Номер телефона"),
        "phoneNumberSaved":
            MessageLookupByLibrary.simpleMessage("Номер телефона сохранен"),
        "phoneSaved":
            MessageLookupByLibrary.simpleMessage("Номер телефона сохранен"),
        "pinDoesntMatch":
            MessageLookupByLibrary.simpleMessage("Коды не совпадают"),
        "pinForgot": MessageLookupByLibrary.simpleMessage(
            "Забыли код быстрого доступа?"),
        "pinForgotText": MessageLookupByLibrary.simpleMessage(
            "Для сброса кода быстрого доступа необходимо выйти из аккаунта и авторизоваться снова."),
        "pincodeAuth": MessageLookupByLibrary.simpleMessage(
            "Вход по коду быстрого доступа"),
        "pincodeErrorTimeout": m2,
        "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
        "pushNotifications":
            MessageLookupByLibrary.simpleMessage("Push - уведомления"),
        "pushNotifs":
            MessageLookupByLibrary.simpleMessage("Push - уведомления"),
        "pushNotifsErrorCantSwitchOff": MessageLookupByLibrary.simpleMessage(
            "Не удалось отключить уведомления"),
        "pushNotifsErrorCantSwitchOn": MessageLookupByLibrary.simpleMessage(
            "Не удалось включить уведомления"),
        "recoverPassword":
            MessageLookupByLibrary.simpleMessage("Восстановить пароль"),
        "removeAccount":
            MessageLookupByLibrary.simpleMessage("Удалить аккаунт"),
        "russian": MessageLookupByLibrary.simpleMessage("Русский"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "security": MessageLookupByLibrary.simpleMessage("Безопасность"),
        "securityPolicy":
            MessageLookupByLibrary.simpleMessage("Политика безопасности"),
        "sendCode": MessageLookupByLibrary.simpleMessage("Отправить код"),
        "sendSmsCode":
            MessageLookupByLibrary.simpleMessage("Отправить смс-код"),
        "sentCodeTo": m3,
        "setFastAccessCode": MessageLookupByLibrary.simpleMessage(
            "Установите код быстрого доступа"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "signIn": MessageLookupByLibrary.simpleMessage("Войти"),
        "signInWithApple":
            MessageLookupByLibrary.simpleMessage("Войти с Apple"),
        "signInWithFacebook":
            MessageLookupByLibrary.simpleMessage("Войти с Facebook"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Войти с Google"),
        "signUp": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "signin": MessageLookupByLibrary.simpleMessage("Войти"),
        "signinAs": MessageLookupByLibrary.simpleMessage("Войти как"),
        "signinViaBmg": MessageLookupByLibrary.simpleMessage("Войти через БМГ"),
        "signinWithApple":
            MessageLookupByLibrary.simpleMessage("Войти с Apple"),
        "signinWithFacebook":
            MessageLookupByLibrary.simpleMessage("Войти с Facebook"),
        "signinWithGoogle":
            MessageLookupByLibrary.simpleMessage("Войти с Google"),
        "signout": MessageLookupByLibrary.simpleMessage("Выйти"),
        "signoutOfAccount":
            MessageLookupByLibrary.simpleMessage("Выйти из аккаунта"),
        "signup": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "skip": MessageLookupByLibrary.simpleMessage("Пропустить"),
        "smsCodeRequest": MessageLookupByLibrary.simpleMessage("Запросить код"),
        "smsCodeRequestTimeout": m4,
        "smsCodeTooManyAttemts": MessageLookupByLibrary.simpleMessage(
            "Слишком много попыток.\nПожалуйста, подождите"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так"),
        "tapToSwitch":
            MessageLookupByLibrary.simpleMessage("Нажмите для переключения"),
        "textField": MessageLookupByLibrary.simpleMessage("Текстовое поле"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Попробовать снова"),
        "use": MessageLookupByLibrary.simpleMessage("Использовать"),
        "useAccessCode": MessageLookupByLibrary.simpleMessage(
            "Использовать код быстрого доступа"),
        "useBiometry": MessageLookupByLibrary.simpleMessage(
            "Разрешить вход по отпечатку пальца и Face ID?"),
        "useFastAccessCode": MessageLookupByLibrary.simpleMessage(
            "Использовать код быстрого доступа"),
        "useFingerprints": MessageLookupByLibrary.simpleMessage(
            "Разрешить вход по отпечатку пальца?"),
        "user": MessageLookupByLibrary.simpleMessage("Пользователь"),
        "userAgreement":
            MessageLookupByLibrary.simpleMessage("Пользовательское соглашение"),
        "userLicenseAgree1":
            MessageLookupByLibrary.simpleMessage("Cоглашаюсь с условиями"),
        "userLicenseAgree2": MessageLookupByLibrary.simpleMessage(
            "Пользовательского соглашения"),
        "version": MessageLookupByLibrary.simpleMessage("Версия "),
        "withEmail": MessageLookupByLibrary.simpleMessage("По email"),
        "withPhone": MessageLookupByLibrary.simpleMessage("По мобильному"),
        "wrongCode": MessageLookupByLibrary.simpleMessage("Неверный код"),
        "yes": MessageLookupByLibrary.simpleMessage("Да"),
        "youGetNewNotification": MessageLookupByLibrary.simpleMessage(
            "Вы получили новое уведомление!")
      };
}
