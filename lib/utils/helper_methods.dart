///Get formated duration from seconds with days, hours, minutes and seconds
String getDuration(int seconds) {
  final Duration duration = Duration(seconds: seconds);
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours) != "00" ? "${twoDigits(duration.inHours)}:" : ""}$twoDigitMinutes:$twoDigitSeconds";
}
