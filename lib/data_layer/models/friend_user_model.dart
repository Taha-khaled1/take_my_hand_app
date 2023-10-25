class Friend {
  final String id;
  final String name;
  final String profileImage;
  final String? massge;
  final String? docId;
  final String? timestamp;
  Friend({
    this.timestamp,
    this.massge,
    this.docId,
    required this.id,
    required this.name,
    required this.profileImage,
  });

  factory Friend.fromMap(Map<String, dynamic> data) {
    return Friend(
      id: data['id'],
      timestamp: data['timestamp'],
      name: data['name'],
      profileImage: data['image'],
      massge: data['massge'],
      docId: data['docRef_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timestamp': timestamp,
      'name': name,
      'image': profileImage,
      'massge': massge,
      'docRef_id': docId,
    };
  }
}

class UserPro {
  final String userId;
  final String name, country, gender;
  final String profileImage;
  int age;
  final String code;

  UserPro({
    required this.code,
    required this.age,
    required this.country,
    required this.gender,
    required this.userId,
    required this.name,
    required this.profileImage,
  });

  factory UserPro.fromMap(Map<String, dynamic> data) {
    return UserPro(
      code: data['code'],
      age: data['age'],
      userId: data['userId'],
      name: data['name'],
      country: data['country'],
      profileImage: data['image'],
      gender: data['gender'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'age': age,
      'code': code,
      'gender': gender,
      'name': name,
      'country': country,
      'image': profileImage,
    };
  }
}
