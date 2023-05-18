class FlaschNail {
  final String path;
  final String id;
  final String imgId;
  bool withCalque;

  FlaschNail({
    required this.path,
    required this.id,
    required this.imgId,
    this.withCalque = false,
  });
}
