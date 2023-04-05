// 카드_가맹점

class CardUser {
  int? id;
  int? idMember;
  int? idCard;
  double? cashbackDiscount;
  double? memberDiscount;
  int? discountValue;
  int? monthMaxDiscount;
  int? dayMaxDiscount;
  int? minDiscount;
  int? maxDiscount;
  int? useCount;

  // 생성자
  CardUser(
      this.id,
      this.idMember,
      this.idCard,
      this.cashbackDiscount,
      this.memberDiscount,
      this.discountValue,
      this.monthMaxDiscount,
      this.dayMaxDiscount,
      this.minDiscount,
      this.maxDiscount,
      this.useCount);

  // 초기화.
  CardUser.empty() {
    this.id = null;
    this.idMember = null;
    this.idCard = null;
    this.idCard = null;
    this.cashbackDiscount = null;
    this.memberDiscount = null;
    this.discountValue = null;
    this.monthMaxDiscount = null;
    this.dayMaxDiscount = null;
    this.minDiscount = null;
    this.maxDiscount = null;
    this.useCount = null;
  }

  // json 변경.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_가맹점': idMember,
      'id_카드': idCard,
      '캐시백할인율': cashbackDiscount,
      '가맹점할인율': memberDiscount,
      '할인금액': discountValue,
      '월최대할인': monthMaxDiscount,
      '일최대할인': dayMaxDiscount,
      '할인금액범위min': minDiscount,
      '할인금액범위max': maxDiscount,
      '이용횟수': useCount
    };
  }

  // 객체에 데이터 넣기.
  CardUser.fromjson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] : null,
        idMember = json['id_가맹점'] != null ? json['id_가맹점'] : null,
        idCard = json['id_카드'] != null ? json['id_카드'] : null,
        cashbackDiscount = json['캐시백할인율'] != null ? json['캐시백할인율'] : null,
        memberDiscount = json['가맹점할인율'] != null ? json['가맹점할인율'] : null,
        discountValue = json['할인금액'] != null ? json['할인금액'] : null,
        monthMaxDiscount = json['월최대할인'] != null ? json['월최대할인'] : null,
        dayMaxDiscount = json['일최대할인'] != null ? json['일최대할인'] : null,
        minDiscount = json['할인금액범위min'] != null ? json['할인금액범위min'] : null,
        maxDiscount = json['할인금액범위max'] != null ? json['할인금액범위max'] : null,
        useCount = json['이용횟수'] != null ? json['id'] : null;
}
