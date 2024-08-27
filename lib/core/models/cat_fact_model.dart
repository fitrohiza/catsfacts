class CatFact {
  Status status;
  String id;
  String user;
  String text;
  int v;
  String source;
  DateTime updatedAt;
  String type;
  DateTime createdAt;
  bool deleted;
  bool used;

  CatFact({
    required this.status,
    required this.id,
    required this.user,
    required this.text,
    required this.v,
    required this.source,
    required this.updatedAt,
    required this.type,
    required this.createdAt,
    required this.deleted,
    required this.used,
  });

  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(
      status: Status.fromJson(json['status']),
      id: json['_id'],
      user: json['user'],
      text: json['text'],
      v: json['__v'],
      source: json['source'],
      updatedAt: DateTime.parse(json['updatedAt']),
      type: json['type'],
      createdAt: DateTime.parse(json['createdAt']),
      deleted: json['deleted'],
      used: json['used'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.toJson(),
      '_id': id,
      'user': user,
      'text': text,
      '__v': v,
      'source': source,
      'updatedAt': updatedAt.toIso8601String(),
      'type': type,
      'createdAt': createdAt.toIso8601String(),
      'deleted': deleted,
      'used': used,
    };
  }

  static List<CatFact> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => CatFact.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> listToJson(List<CatFact> catFacts) {
    return catFacts.map((catFact) => catFact.toJson()).toList();
  }
}

class Status {
  bool verified;
  int sentCount;
  String? feedback;

  Status({
    required this.verified,
    required this.sentCount,
    this.feedback,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      verified: json['verified'],
      sentCount: json['sentCount'],
      feedback: json['feedback'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'verified': verified,
      'sentCount': sentCount,
      'feedback': feedback,
    };
  }
}
