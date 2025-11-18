String getCurrentDate({String format = 'yyyy-MM-dd'}) {
  final now = DateTime.now();
  return '${now.year}-${_twoDigits(now.month)}-${_twoDigits(now.day)}';
}

/// Helper to add leading zero for single-digit numbers
String _twoDigits(int n) => n.toString().padLeft(2, '0');
