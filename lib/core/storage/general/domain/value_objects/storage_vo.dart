class StorageVo<T> {
  StorageVo({
    required this.key,
    required this.value,
  });

  final String key;
  final T value;

  @override
  String toString() {
    return 'StorageDto{$key, $value}';
  }
}
