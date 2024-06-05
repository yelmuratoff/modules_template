part of 'app_textfield.dart';

class AppTextfieldData {
  AppTextfieldData({
    this.initial,
    bool enabled = true,
    bool obscureText = false,
    this.onUserInput,
    this.onChanged,
    this.onTap,
    this.onSubmit,
    this.onFocusLost,
    this.hintText,
    this.textAlign,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction,
    this.maxLength,
    this.validator,
    this.maxLines = 1,
    this.minLines,
    this.isVisibleObscureButton = false,
    FocusNode? nextFocus,
    this.readonly = false,
    this.style,
    this.hintStyle,
    this.visibleErrors = true,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixText,
    this.textCapitalization = TextCapitalization.sentences,
    Duration? debounce,
    this.autofocus = false,
    this.validateOnFocusLost = true,
    this.validateOnInit = false,
    this.padding = const EdgeInsets.all(17),
  })  : _obscureText = obscureText,
        _nextFocus = nextFocus,
        _enabled = enabled {
    controller = TextEditingController(text: initial);
    errors.addListener(_errorsListener);
    _debounce = Debounce(duration: debounce);
  }

  final List<String> Function(String)? validator;
  final void Function(String value)? onUserInput;
  final void Function(String value)? onChanged;
  final void Function(BuildContext context, TextEditingController controller)?
      onTap;
  final void Function(String)? onSubmit;
  final void Function(String)? onFocusLost;
  final Widget Function(Color? color)? prefixIcon;
  final Widget Function(Color? color)? suffixIcon;
  final bool autofocus;
  bool autovalidationOn = false;
  late final TextEditingController controller;
  final errors = ValueNotifier<List<String>>(const []);
  final focusNode = FocusNode();
  final TextStyle? hintStyle;
  final String? hintText;
  final String? initial;
  final List<TextInputFormatter>? inputFormatters;
  final bool isVisibleObscureButton;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final EdgeInsetsGeometry padding;
  final bool readonly;
  final TextStyle? style;
  final String? suffixText;
  final TextAlign? textAlign;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;

  /// If true, the field will be validated when it loses focus
  bool validateOnFocusLost;

  /// If true, the field will be validated when it is initialized
  bool validateOnInit;

  final bool visibleErrors;

  late final Debounce? _debounce;
  late bool _enabled;
  late final _isValidated = ValueNotifier<bool?>(null);
  FocusNode? _nextFocus;
  late bool _obscureText;

  FocusNode? get nextFocus => _nextFocus;

  set nextFocus(FocusNode? value) {
    _nextFocus = value;
    rebuild();
  }

  bool get obscureText => _obscureText;

  void rebuild() => errors.value = errors.value.toList();

  void showErrors(List<String>? messages) {
    if (messages == null) return;
    errors.value = messages;
  }

  void get clearErrors {
    errors.value = const [];
    rebuild();
  }

  set obscureText(bool value) {
    _obscureText = value;
    rebuild();
  }

  ValueListenable<bool?> get isValidated => _isValidated;

  bool get enabled => _enabled;

  set enabled(bool value) {
    _enabled = value;
    rebuild();
  }

  bool get validate {
    errors.value = validator?.call(controller.text) ?? const [];
    return errors.value.isEmpty;
  }

  void dispose() {
    try {
      focusNode.dispose();
    } catch (e) {
      //to avoid "A FocusNode was used after being disposed." error
      //which occurs occasionally when the page is disposed
    }
    errors
      ..removeListener(_errorsListener)
      ..dispose();
    _isValidated.dispose();
    controller.dispose();
  }

  void get reset {
    controller.text = initial ?? '';
    errors.value = const [];
    rebuild();
  }

  void _errorsListener() {
    _isValidated.value = errors.value.isEmpty;
  }
}
