class MedicineModel {
  String? mName;
  int? mCompartment;
  int? mColor;
  String? mType;
  double? mQuantity;
  double? mCount;
  DateTime? mStart;
  DateTime? mEnd;
  String? mFrequency;
  String? mTimes;
  String? mOptions;

  MedicineModel({
    this.mName,
    this.mCompartment,
    this.mColor,
    this.mType,
    this.mQuantity,
    this.mCount,
    this.mStart,
    this.mEnd,
    this.mFrequency,
    this.mTimes,
    this.mOptions,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
        mName: json["mName"] as String?,
        mCompartment: json["mCompartment"] as int?,
        mColor: json["mColor"] as int?,
        mType: json["mType"] as String?,
        mQuantity: json["mQuantity"] as double?,
        mCount: json["mCount"] as double?,
        mStart: json["mStart"] != null
            ? DateTime.parse(json["mStart"] as String)
            : null,
        mEnd: json["mEnd"] != null
            ? DateTime.parse(json["mEnd"] as String)
            : null,
        mFrequency: json["mFrequency"] as String?,
        mTimes: json["mTimes"] as String?,
        mOptions: json["mOptions"] as String?,
      );

  Map<String, dynamic> toJson() => {
        'mName': mName,
        'mCompartment': mCompartment,
        'mColor': mColor,
        'mType': mType,
        'mQuantity': mQuantity,
        'mCount': mCount,
        'mStart': mStart?.toIso8601String(),
        'mEnd': mEnd?.toIso8601String(),
        'mFrequency': mFrequency,
        'mTimes': mTimes,
        'mOptions': mOptions,
      };
}
