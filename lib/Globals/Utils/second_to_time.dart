String secondToTime(int second) {
  int minute = Duration(seconds: second).inMinutes;
  int secondd = second - (minute * 60);
  String minuteString = minute.toString();
  String secondString = minute.toString();
  if (minute.toString().length == 1) {
    minuteString = "0" + minute.toString();
  }
  if (secondd.toString().length == 1) {
    secondString = "0" + secondd.toString();
  }
  return minuteString + ":" + secondString;
}
