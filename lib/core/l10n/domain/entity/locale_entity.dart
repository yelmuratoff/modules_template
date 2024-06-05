// import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ispect/ispect.dart';

import '../../../env/environment.dart';
import '../../../../shared/utils/throw_if_needed.dart';
import '../../../storage/general/domain/interface/i_local_storage_repo.dart';
import '../../data/convert/app_locale_convert.dart';
import '../../generated/l10n.dart';
import '../value_objects/app_locale.dart';
import 'state.dart';

export 'state.dart';

class LocaleEntity extends Cubit<LocaleState> {
  LocaleEntity({required this.local})
      : super(
          LocaleState(
            AppLocaleConvert.fromLocale(
                  _localeFromString(
                    Intl.getCurrentLocale(),
                  ),
                ) ??
                Environment.locale,
          ),
        );

  final ILocalStorageRepo local;

  Future<bool> init() async {
    try {
      final dto = await local.read<String>(
        AppLocaleConvert.storageName,
      );
      return apply(
        AppLocaleConvert.fromStorage(dto),
      );
    } catch (error, stack) {
      talkerWrapper.handle(
        exception: error,
        stackTrace: stack,
        message: 'Failed to apply locale',
      );
      return false;
    }
  }

  Future<bool> apply(AppLocale? appLocale) async {
    try {
      final locale = _localeFromString(appLocale?.code);
      if (locale == null) return false;
      await L10n.load(locale);
      await local.write(appLocale!.toStorage());
      emit(
        LocaleState(appLocale),
      );
      return true;
    } catch (error, stack) {
      talkerWrapper.handle(
        exception: error,
        stackTrace: stack,
        message: 'Failed to apply locale',
      );
      throwIfNeeded(error, stack);
      return false;
    }
  }

  List<AppLocale> get supportedLocales {
    return L10n.delegate.supportedLocales
        .map(
          AppLocaleConvert.fromLocale,
        )
        .whereType<AppLocale>()
        .toList();
  }

  static Locale? _localeFromString(String? languageTag) {
    if (languageTag == null || languageTag.isEmpty) return null;
    final tagsList = languageTag.split('_');
    final languageCode = tagsList[0];
    String? scriptCode;
    if (tagsList.length == 3) {
      scriptCode = tagsList[1];
    }
    String? countryCode;
    if (tagsList.length > 1) {
      countryCode = tagsList.last;
    }
    return Locale.fromSubtags(
      languageCode: languageCode,
      scriptCode: scriptCode,
      countryCode: countryCode,
    );
  }
}
