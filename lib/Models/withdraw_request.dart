class WithdrawRequest {
  int? id;
  int? balance;
  String? cardNo;
  int? cvv;
  String? expDate;
  String? cardHolder;
  int? userId;
  String? createTime;
  bool? isApproved;

  WithdrawRequest(
      {this.id,
      this.balance,
      this.cardNo,
      this.cvv,
      this.expDate,
      this.cardHolder,
      this.userId,
      this.createTime,
      this.isApproved});

  WithdrawRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balance = json['balance'];
    cardNo = json['cardNo'];
    cvv = json['cvv'];
    expDate = json['expDate'];
    cardHolder = json['cardHolder'];
    userId = json['userId'];
    createTime = json['createTime'];
    isApproved = json['isApproved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['balance'] = balance;
    data['cardNo'] = cardNo;
    data['cvv'] = cvv;
    data['expDate'] = expDate;
    data['cardHolder'] = cardHolder;
    data['userId'] = userId;
    data['createTime'] = createTime;
    data['isApproved'] = isApproved;
    return data;
  }
}
