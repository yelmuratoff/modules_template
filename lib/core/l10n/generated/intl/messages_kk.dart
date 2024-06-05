// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a kk locale. All the
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
  String get localeName => 'kk';

  static String m0(address) => "Растау кодын жіберді\n${address}";

  static String m1(phone) => "Код нөмірге жіберілді ${phone}";

  static String m2(duration) => "Күте тұрыңыз ${duration} сек.";

  static String m3(address) => "Растау кодын жіберді\n${address}";

  static String m4(timeout) => "Кодты қайта сұрау ${timeout} сек";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutApp": MessageLookupByLibrary.simpleMessage("Қосымша туралы"),
        "accountDelete": MessageLookupByLibrary.simpleMessage("Аккаунтты жою"),
        "accountDeletetionConfirmationBody":
            MessageLookupByLibrary.simpleMessage(
                "Сіздің деректеріңіз қалпына келтірусіз жойылады."),
        "accountDeletetionConfirmationTitle":
            MessageLookupByLibrary.simpleMessage(
                "Сіз шынымен аккаунтты жойғыңыз келе ме?"),
        "accountIsDeleted":
            MessageLookupByLibrary.simpleMessage("Аккаунт жойылды"),
        "accountLogout":
            MessageLookupByLibrary.simpleMessage("Аккаунттан шығу керек пе?"),
        "agree": MessageLookupByLibrary.simpleMessage("Келісу"),
        "allServices": MessageLookupByLibrary.simpleMessage("Барлық сервистер"),
        "allow": MessageLookupByLibrary.simpleMessage("Рұқсат беру"),
        "appExitConfirmation": MessageLookupByLibrary.simpleMessage(
            "Сіз шынымен шыққыңыз келе ме?"),
        "appLogo": MessageLookupByLibrary.simpleMessage("Қосымшаның логотипі"),
        "appTheme": MessageLookupByLibrary.simpleMessage("Тема оформления"),
        "areYouSureWantToExit": MessageLookupByLibrary.simpleMessage(
            "Сіз шынымен шыққыңыз келе ме?"),
        "back": MessageLookupByLibrary.simpleMessage("Артқа"),
        "biometricEntry": MessageLookupByLibrary.simpleMessage(
            "Саусақ ізі және Face ID арқылы кіру"),
        "biometrics": MessageLookupByLibrary.simpleMessage(
            "Саусақ ізі және Face ID арқылы кіру"),
        "biometricsOnlyWithPin": MessageLookupByLibrary.simpleMessage(
            "Саусақ ізін/Face ID пайдалану тек жылдам қол жеткізу коды орнатылған кезде ғана мүмкін болады"),
        "byEmail": MessageLookupByLibrary.simpleMessage("Email арқылы"),
        "byPhone": MessageLookupByLibrary.simpleMessage("Ұялы телефон арқылы"),
        "cancel": MessageLookupByLibrary.simpleMessage("Бас тарту"),
        "cancelVerb": MessageLookupByLibrary.simpleMessage("Бас тарту"),
        "change": MessageLookupByLibrary.simpleMessage("Өзгерту"),
        "changeAccessCode": MessageLookupByLibrary.simpleMessage(
            "Жылдам қол жеткізу кодын өзгерту"),
        "changeEmail": MessageLookupByLibrary.simpleMessage("Email өзгерту"),
        "changeFastAccessCode": MessageLookupByLibrary.simpleMessage(
            "Жылдам қол жеткізу кодын өзгерту"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Құпия сөзді өзгерту"),
        "changePhoneNumber":
            MessageLookupByLibrary.simpleMessage("Телефон нөмірін өзгерту"),
        "checkData": MessageLookupByLibrary.simpleMessage(
            "Енгізілген деректерді тексеріңіз"),
        "choose": MessageLookupByLibrary.simpleMessage("Таңдау"),
        "clear": MessageLookupByLibrary.simpleMessage("Тазалау"),
        "close": MessageLookupByLibrary.simpleMessage("Жабу"),
        "closeModal":
            MessageLookupByLibrary.simpleMessage("Диалогтық терезені жабу"),
        "closePermAlert": MessageLookupByLibrary.simpleMessage(
            "Кіру кодын орнату арқылы терезені жабыңыз"),
        "codeLabelHint": m0,
        "codeSentFor": m1,
        "comeBack": MessageLookupByLibrary.simpleMessage("Артқа қайту"),
        "confPassword":
            MessageLookupByLibrary.simpleMessage("Құпия сөзді растау"),
        "confirm": MessageLookupByLibrary.simpleMessage("Растау"),
        "createAccount":
            MessageLookupByLibrary.simpleMessage("Есептік жазбаны тіркеу"),
        "currentPassword":
            MessageLookupByLibrary.simpleMessage("Ағымдағы құпия сөз"),
        "delete": MessageLookupByLibrary.simpleMessage("Жою"),
        "discard": MessageLookupByLibrary.simpleMessage("Қалпына келтіру"),
        "done": MessageLookupByLibrary.simpleMessage("Дайын"),
        "dontHaveAccount": MessageLookupByLibrary.simpleMessage("Аккаунт жоқ"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailCodeLabel":
            MessageLookupByLibrary.simpleMessage("Хаттан кодты енгізіңіз"),
        "emailSaved": MessageLookupByLibrary.simpleMessage("Email сақталды"),
        "enterEmailCode":
            MessageLookupByLibrary.simpleMessage("Хаттан кодты енгізіңіз"),
        "enterFastAccessCode": MessageLookupByLibrary.simpleMessage(
            "Жылдам қол жеткізу кодын енгізіңіз"),
        "enterPincode": MessageLookupByLibrary.simpleMessage(
            "Жылдам қол жеткізу кодын енгізіңіз"),
        "enterPincodeAgain":
            MessageLookupByLibrary.simpleMessage("Кодты қайталаңыз"),
        "enterPincodeImperative":
            MessageLookupByLibrary.simpleMessage("Жылдам кіру кодын енгізіңіз"),
        "enterSmsCode":
            MessageLookupByLibrary.simpleMessage("SMS-тен кодты енгізіңіз"),
        "error": MessageLookupByLibrary.simpleMessage("Қате"),
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
        "exit": MessageLookupByLibrary.simpleMessage("Шығу"),
        "exitFromAccount":
            MessageLookupByLibrary.simpleMessage("Аккаунттан шығу"),
        "faceIdAuth":
            MessageLookupByLibrary.simpleMessage("Биометрия бойынша кіру"),
        "find": MessageLookupByLibrary.simpleMessage("Іздеу"),
        "fingerprintsAuth":
            MessageLookupByLibrary.simpleMessage("Саусақ ізімен кіру"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Құпия сөзді ұмыттыңыз ба"),
        "forgotPin": MessageLookupByLibrary.simpleMessage(
            "Жылдам қол жеткізу кодын ұмыттыңыз ба"),
        "forgotPinHint": MessageLookupByLibrary.simpleMessage(
            "Жылдам қол жеткізу кодын қалпына келтіру үшін аккаунттан шығып, қайтадан кіру керек."),
        "forgotPincode":
            MessageLookupByLibrary.simpleMessage("Құпия кодты ұмыттыңыз ба?"),
        "fullName": MessageLookupByLibrary.simpleMessage("Аты - жөні"),
        "haveAccount": MessageLookupByLibrary.simpleMessage("Аккаунт бар"),
        "help": MessageLookupByLibrary.simpleMessage("Көмек"),
        "iconForPassword": MessageLookupByLibrary.simpleMessage(
            "Құпия сөзді көрсету немесе жасыру белгішесі"),
        "inputEmail":
            MessageLookupByLibrary.simpleMessage("Жаңа mail енгізіңіз"),
        "inputErrorEmailIncorrect":
            MessageLookupByLibrary.simpleMessage("mail-ді тексеріңіз"),
        "inputErrorEmailIsEmpty":
            MessageLookupByLibrary.simpleMessage("Mail-ді енгізіңіз"),
        "inputErrorGeneral":
            MessageLookupByLibrary.simpleMessage("Деректерді тексеріңіз"),
        "inputErrorPasswordIsEmpty":
            MessageLookupByLibrary.simpleMessage("Құпия сөзді енгізіңіз"),
        "inputErrorPasswordIsShort":
            MessageLookupByLibrary.simpleMessage("Кем дегенде 8 таңба"),
        "inputErrorPasswordMustContainDigit":
            MessageLookupByLibrary.simpleMessage("Кем дегенде бір сан"),
        "inputErrorPasswordMustContainSpecSymbol":
            MessageLookupByLibrary.simpleMessage(
                "Кем дегенде бір арнайы таңба (%, \$, @, &, *, #, ^ және т. б.)"),
        "inputErrorPhoneIncorrect":
            MessageLookupByLibrary.simpleMessage("Телефон нөмірін тексеріңіз"),
        "inputErrorPhoneIsEmpty":
            MessageLookupByLibrary.simpleMessage("Телефон нөмірін енгізіңіз"),
        "inputIin": MessageLookupByLibrary.simpleMessage("ЖСН енгізіңіз"),
        "inputPhone": MessageLookupByLibrary.simpleMessage(
            "Жаңа телефон нөмірін енгізіңіз"),
        "interfaceLang": MessageLookupByLibrary.simpleMessage("Интерфейс тілі"),
        "kazakh": MessageLookupByLibrary.simpleMessage("Қазақша"),
        "language": MessageLookupByLibrary.simpleMessage("Тіл"),
        "listIsEmpty": MessageLookupByLibrary.simpleMessage("Тізім бос"),
        "localAuthLocalizedReason": MessageLookupByLibrary.simpleMessage(
            "Саусақ ізін немесе құпия сөзді пайдаланыңыз"),
        "localAuthNotEnrolled": MessageLookupByLibrary.simpleMessage(
            "Құпия сөзбен қорғау құрылғының параметрлерінде орнатылмаған"),
        "localAuthPassCodeNotSet": MessageLookupByLibrary.simpleMessage(
            "Құрылғының параметрлерінде құпия сөзді орнатыңыз"),
        "localAuthPermanentlyLocked": MessageLookupByLibrary.simpleMessage(
            "Тым көп әрекет, құлпты ашу қажет"),
        "localAuthSignInTitle":
            MessageLookupByLibrary.simpleMessage("Авторизация қажет"),
        "localAuthTooManyAttempts": MessageLookupByLibrary.simpleMessage(
            "Тым көп әрекет жасадыңыз, кейінірек көріңіз"),
        "localAuthUnavailable": MessageLookupByLibrary.simpleMessage(
            "Биометрия қол жетімді емес, попробуйте позже"),
        "logout": MessageLookupByLibrary.simpleMessage("Шығу"),
        "main": MessageLookupByLibrary.simpleMessage("Басты бет"),
        "mainMenuHint":
            MessageLookupByLibrary.simpleMessage("Негізгі мәзірді көрсету"),
        "name": MessageLookupByLibrary.simpleMessage("Аты"),
        "navigateToNotificationsScreen": MessageLookupByLibrary.simpleMessage(
            "Хабарландыру экранына өтіңіз"),
        "newPassword": MessageLookupByLibrary.simpleMessage("Жаңа құпия сөз"),
        "next": MessageLookupByLibrary.simpleMessage("Келесі"),
        "no": MessageLookupByLibrary.simpleMessage("Жоқ"),
        "noAccount": MessageLookupByLibrary.simpleMessage("Аккаунт жоқ"),
        "noData": MessageLookupByLibrary.simpleMessage("Деректер жоқ"),
        "noNotificationType": MessageLookupByLibrary.simpleMessage(
            "Хабарландыру түрін анықтау мүмкін болмады"),
        "noThanks": MessageLookupByLibrary.simpleMessage("Жоқ, рахмет"),
        "notification": MessageLookupByLibrary.simpleMessage("Хабарлама"),
        "notifications": MessageLookupByLibrary.simpleMessage("Хабарламалар"),
        "notifs": MessageLookupByLibrary.simpleMessage("Хабарламалар"),
        "numberIsMissing": MessageLookupByLibrary.simpleMessage("Нөмір жоқ"),
        "ok": MessageLookupByLibrary.simpleMessage("Түсінікті, рахмет"),
        "okay": MessageLookupByLibrary.simpleMessage("ОК"),
        "or": MessageLookupByLibrary.simpleMessage("Немесе"),
        "password": MessageLookupByLibrary.simpleMessage("Құпия сөз"),
        "passwordSaved":
            MessageLookupByLibrary.simpleMessage("Құпия сөз сақталды"),
        "passwordsDidntMatched": MessageLookupByLibrary.simpleMessage(
            "Құпия сөздер сәйкес келмейді"),
        "passwordsDontMatch": MessageLookupByLibrary.simpleMessage(
            "Құпия сөздер сәйкес келмейді"),
        "permissionsRequestCamera": MessageLookupByLibrary.simpleMessage(
            "Қосымшаға камераға кіруге рұқсат қажет"),
        "permissionsRequestHint": MessageLookupByLibrary.simpleMessage(
            "Құрылғыдағы құпиялылық параметрлерінде кіруге рұқсат беруге болады"),
        "permissionsRequestPhoto": MessageLookupByLibrary.simpleMessage(
            "Қосымшаға фотосуретке кіруге рұқсат қажет"),
        "permissionsRequestPushNotifs": MessageLookupByLibrary.simpleMessage(
            "Хабарламаларға кіруге рұқсат жоқ"),
        "permissionsRequestStorage": MessageLookupByLibrary.simpleMessage(
            "Қосымшаға файлдарға кіруге рұқсат қажет"),
        "permissionsRequestVideo": MessageLookupByLibrary.simpleMessage(
            "Қосымшаға бейнеге кіруге рұқсат қажет"),
        "personData": MessageLookupByLibrary.simpleMessage("Жеке деректер"),
        "personalDataUsage": MessageLookupByLibrary.simpleMessage(
            "Дербес деректерді жинауға және өңдеуге келісім беремін"),
        "phone": MessageLookupByLibrary.simpleMessage("Телефон"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Телефон нөмірі"),
        "phoneNumberSaved":
            MessageLookupByLibrary.simpleMessage("Телефон нөмірі сақталды"),
        "phoneSaved":
            MessageLookupByLibrary.simpleMessage("Телефон нөмірі сақталды"),
        "pinDoesntMatch":
            MessageLookupByLibrary.simpleMessage("Кодтар сәйкес келмейді"),
        "pinForgot": MessageLookupByLibrary.simpleMessage(
            "Жылдам қол жеткізу кодын ұмыттыңыз ба?"),
        "pinForgotText": MessageLookupByLibrary.simpleMessage(
            "Жылдам қол жеткізу кодын қалпына келтіру үшін аккаунттан шығып, қайтадан кіруіңіз керек."),
        "pincodeAuth": MessageLookupByLibrary.simpleMessage(
            "Жылдам қол жеткізу коды бойынша кіру"),
        "pincodeErrorTimeout": m2,
        "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
        "pushNotifications":
            MessageLookupByLibrary.simpleMessage("Push - хабарлама"),
        "pushNotifs":
            MessageLookupByLibrary.simpleMessage("Push - хабарламалар"),
        "pushNotifsErrorCantSwitchOff": MessageLookupByLibrary.simpleMessage(
            "Хабарландыруларды өшіру мүмкін болмады"),
        "pushNotifsErrorCantSwitchOn": MessageLookupByLibrary.simpleMessage(
            "Хабарландыруларды қосу мүмкін болмады"),
        "recoverPassword":
            MessageLookupByLibrary.simpleMessage("Құпия сөзді қалпына келдіру"),
        "removeAccount": MessageLookupByLibrary.simpleMessage("Аккаунтты жою"),
        "russian": MessageLookupByLibrary.simpleMessage("Орысша"),
        "save": MessageLookupByLibrary.simpleMessage("Сақтау"),
        "search": MessageLookupByLibrary.simpleMessage("Іздеу"),
        "security": MessageLookupByLibrary.simpleMessage("Қауіпсіздік"),
        "securityPolicy":
            MessageLookupByLibrary.simpleMessage("Қауіпсіздік саясаты"),
        "sendCode": MessageLookupByLibrary.simpleMessage("Кодты жіберу"),
        "sendSmsCode":
            MessageLookupByLibrary.simpleMessage("SMS кодын жіберіңіз"),
        "sentCodeTo": m3,
        "setFastAccessCode": MessageLookupByLibrary.simpleMessage(
            "Жылдам қол жеткізу кодын орнатыңыз"),
        "settings": MessageLookupByLibrary.simpleMessage("Баптау"),
        "signIn": MessageLookupByLibrary.simpleMessage("Кіру"),
        "signInWithApple":
            MessageLookupByLibrary.simpleMessage("Apple арқылы кіру"),
        "signInWithFacebook":
            MessageLookupByLibrary.simpleMessage("Facebook арқылы кіру"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Google арқылы кіру"),
        "signUp": MessageLookupByLibrary.simpleMessage("Тіркелу"),
        "signin": MessageLookupByLibrary.simpleMessage("Кіру"),
        "signinAs": MessageLookupByLibrary.simpleMessage("Ретінде кіру"),
        "signinViaBmg": MessageLookupByLibrary.simpleMessage("МАБ арқылы кіру"),
        "signinWithApple":
            MessageLookupByLibrary.simpleMessage("Apple мен кіру"),
        "signinWithFacebook":
            MessageLookupByLibrary.simpleMessage("Facebook-тен кіру"),
        "signinWithGoogle":
            MessageLookupByLibrary.simpleMessage("Google мен кіру"),
        "signout": MessageLookupByLibrary.simpleMessage("Шығу"),
        "signoutOfAccount":
            MessageLookupByLibrary.simpleMessage("Аккаунттан шығу"),
        "signup": MessageLookupByLibrary.simpleMessage("Тіркелу"),
        "skip": MessageLookupByLibrary.simpleMessage("Пропустить"),
        "smsCodeRequest": MessageLookupByLibrary.simpleMessage("Кодты сұрау"),
        "smsCodeRequestTimeout": m4,
        "smsCodeTooManyAttemts": MessageLookupByLibrary.simpleMessage(
            "Тым көп әрекет.\nӨтінемін, күтіңіз"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Бірдеңе дұрыс болмады"),
        "tapToSwitch":
            MessageLookupByLibrary.simpleMessage("Ауыстыру үшін басыңыз"),
        "textField": MessageLookupByLibrary.simpleMessage("Мәтін өрісі"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Қайталап көріңіз"),
        "use": MessageLookupByLibrary.simpleMessage("Пайдалану"),
        "useAccessCode": MessageLookupByLibrary.simpleMessage(
            "Жылдам қол жеткізу кодын пайдаланыңыз"),
        "useBiometry": MessageLookupByLibrary.simpleMessage(
            "Саусақ ізі мен Face ID арқылы кіруге рұқсат беру керек пе?"),
        "useFastAccessCode": MessageLookupByLibrary.simpleMessage(
            "Жылдам қол жеткізу кодын пайдаланыңыз"),
        "useFingerprints": MessageLookupByLibrary.simpleMessage(
            "Саусақ ізімен кіруге рұқсат беру керек пе?"),
        "user": MessageLookupByLibrary.simpleMessage("Қолданушы"),
        "userAgreement":
            MessageLookupByLibrary.simpleMessage("Пайдаланушы келісімі"),
        "userLicenseAgree1":
            MessageLookupByLibrary.simpleMessage("Шарттармен келісемін"),
        "userLicenseAgree2":
            MessageLookupByLibrary.simpleMessage("Пайдаланушы келісімі"),
        "version": MessageLookupByLibrary.simpleMessage("Нұсқасы"),
        "withEmail": MessageLookupByLibrary.simpleMessage("Email арқылы"),
        "withPhone":
            MessageLookupByLibrary.simpleMessage("Ұялы телефон арқылы"),
        "wrongCode": MessageLookupByLibrary.simpleMessage("Қате код"),
        "yes": MessageLookupByLibrary.simpleMessage("Иә"),
        "youGetNewNotification":
            MessageLookupByLibrary.simpleMessage("Сіз жаңа хабарлама алдыңыз!")
      };
}
