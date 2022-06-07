String formatDouble(String data) {
  String newData = '';
  newData += data.split(".")[0] + ".";
  String tmp = data.split(".")[1];
  newData += tmp[0] + tmp[1];
  return newData;
}
