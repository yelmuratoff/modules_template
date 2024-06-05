import 'dart:math';

extension StringCoreX on String? {
  String? get extractDigits {
    if (this == null) return null;
    if (this!.isEmpty) return '';
    var output = '';
    for (var i = 0; i < this!.length; i++) {
      if (int.tryParse(this![i]) != null) output += this![i];
    }
    return output;
  }

  String? get formatAsPhone {
    final digits = extractDigits;
    if (digits == null) return null;
    if (digits.isEmpty) return '';
    final output = '+${digits.substring(0, 1)}'
        ' (${digits.substring(1, 4)})'
        ' ${digits.substring(4, 7)}-'
        '${digits.substring(7, 9)}-'
        '${digits.substring(9, digits.length)}';
    return output;
  }

  ///get string with [qty] of non-breakable spaces
  String nbsp(int qty) => String.fromCharCodes(List.filled(qty, 0x00A0));

  String? padLeftNbsp(int minWidth) {
    if (this == null) return null;
    final qtyToAdd = minWidth - this!.length;
    return qtyToAdd > 0 ? nbsp(qtyToAdd) + this! : this;
  }

  String? padRightNbsp(int minWidth) {
    if (this == null) return null;
    final qtyToAdd = minWidth - this!.length;
    return qtyToAdd > 0 ? this! + nbsp(qtyToAdd) : this;
  }

  String? padRightNbspX2(int minWidth) {
    if (this == null) return null;
    final qtyToAdd = minWidth - this!.length;
    return qtyToAdd > 0 ? this! + nbsp(qtyToAdd * 2) : this;
  }

  String? get separateThousands {
    if (this == null) return null;
    var text = this!.replaceAll(' ', '');
    final lastIndexOfDot = text.lastIndexOf('.');
    if (lastIndexOfDot != -1) {
      text = text.substring(0, lastIndexOfDot);
    }
    final length = text.length;
    final subChunks = <String>[];
    var subChunk = '';
    for (var i = length - 1; i >= 0; i--) {
      subChunk = text[i] + subChunk;
      if (subChunk.length % 3 == 0 || i == 0) {
        subChunks.insert(0, subChunk);
        subChunk = '';
      }
    }
    return subChunks.join(String.fromCharCode(0x00A0)) + removeTrailingZeroes;
  }

  bool? get containsLetters {
    if (this == null) return null;
    return this!.contains(RegExp('[a-zA-Z]'));
  }

  String? get removeSpaces {
    if (this == null) return null;
    return this!.replaceAll(' ', '').replaceAll(
          String.fromCharCode(0x00A0),
          '',
        );
  }

  String? get removeTrailingDots {
    if (this == null) return null;
    return removeSpaces!
        .replaceFirst(
          '.',
          '#',
        )
        .split('.')
        .join()
        .replaceFirst(
          '#',
          '.',
        );
  }

  String get removeTrailingZeroes {
    var output = '';
    if (this == null) return output;
    final lastIndexOfDot = this!.lastIndexOf('.');
    if (lastIndexOfDot != -1) {
      output = this!.substring(lastIndexOfDot);
      final lastIndexOfNonZero = output.lastIndexOf(
        RegExp('[1-9]'),
      );
      if (lastIndexOfNonZero != -1) {
        output = output.substring(0, lastIndexOfNonZero);
      } else {
        output = '';
      }
    }
    return output;
  }

  String? limitSymbols(int symbols) {
    if (this == null) return null;
    return this!.substring(
      0,
      this!.length >= symbols ? symbols : this!.length,
    );
  }

  String formatAsCurrency({int decimals = 0, bool showSymbol = false}) {
    // if (this == null) return '';
    // final value = num.tryParse(this!);
    // if (value == null) return '';
    // return NumberFormat.currency(
    //   locale: 'ru',
    //   name: showSymbol ? ' ₸' : null,
    //   symbol: '',
    //   decimalDigits: 0,
    // ).format(value);

    String output;
    if (this == null) return '';
    if (this!.isEmpty) return '';
    output = removeTrailingDots ?? '';
    if (output[0] == '.') output = '0$output';
    final chunks = output.split('.');
    chunks.first = chunks.first.separateThousands ?? '';
    if (decimals == 0 || chunks.length == 1) return chunks.first;
    chunks[1] = chunks[1].limitSymbols(decimals) ?? '';
    if (chunks[1].endsWith('0')) chunks[1] = chunks[1][0];
    return chunks.join('.');
  }

  int? get toInt => int.tryParse(this ?? '');

  String? toCamelCase() {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    if (this!.length == 1) return this!.toUpperCase();
    return this!.splitMapJoin(
      ' ',
      onMatch: (m) => ' ',
      onNonMatch: (n) {
        if (n.isEmpty) return n;
        if (n.length == 1) return n.toUpperCase();
        return '${n[0].toUpperCase()}${n.substring(1).toLowerCase()}';
      },
    );
  }

  String? capitalize() {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    if (this!.length == 1) return this!.toUpperCase();
    return '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
  }

  DateTime? get toDate {
    if (this == null) return null;
    if (this!.isEmpty) return null;
    final chunks = this!.split('.').reversed.toList();
    if (chunks.isEmpty) return null;
    if (chunks.length < 3) {
      chunks.add('01');
    }
    if (chunks.length < 3) {
      chunks.add('01');
    }
    final tempDate = chunks.join('-');
    final output = DateTime.tryParse(tempDate);
    return output;
  }

  String randomString([int length = 10]) {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(
          Random().nextInt(chars.length),
        ),
      ),
    );
  }
}
