class CaseModel {
  String? adderPhone;
  String anotherDeceases;
  String anyMedications;
  String caseAge;
  String caseGender;
  String caseGovernorate;
  String? caseImage0;
  String? caseImage1;
  String caseName;
  String casePhone;
  String caseType;
  String constructionTime;
  String? notes;
  String previousOperations;

  CaseModel({
    required this.adderPhone,
    required this.anotherDeceases,
    required this.anyMedications,
    required this.caseAge,
    required this.caseGender,
    required this.caseGovernorate,
    required this.caseImage0,
    required this.caseImage1,
    required this.caseName,
    required this.casePhone,
    required this.caseType,
    required this.constructionTime,
    this.notes,
    required this.previousOperations,
  });

  Map<String, dynamic> toJson() {
    return {
      'adderPhone': adderPhone,
      'anotherDeceases': anotherDeceases,
      'anyMedications': anyMedications,
      'caseAge': caseAge,
      'caseGender': caseGender,
      'caseGovernorate': caseGovernorate,
      'caseImage0': caseImage0,
      'caseImage1': caseImage1,
      'caseName': caseName,
      'casePhone': casePhone,
      'caseType': caseType,
      'constructionTime': constructionTime.toString(),
      'notes': notes,
      'previousOperations': previousOperations,
    };
  }

  factory CaseModel.fromJson(Map<String, dynamic> json) {
    return CaseModel(
      adderPhone: json['adderPhone'],
      anotherDeceases: json['anotherDeceases'],
      anyMedications: json['anyMedications'],
      caseAge: json['caseAge'],
      caseGender: json['caseGender'],
      caseGovernorate: json['caseGovernorate'],
      caseImage0: json['caseImage0'],
      caseImage1: json['caseImage1'],
      caseName: json['caseName'],
      casePhone: json['casePhone'],
      caseType: json['caseType'],
      constructionTime: json['constructionTime'].toString(),
      notes: json['notes'],
      previousOperations: json['previousOperations'],
    );
  }
}
