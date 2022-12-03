import 'dart:convert';

class User {
  dynamic id;
  dynamic name;
  dynamic username;
  dynamic followers;
  dynamic followings;

  User({
    this.id,
    this.name,
    this.username,
    this.followers,
    this.followings,
  });


  factory User.fromMap(map) {
    return User(
      id: map['user']['id'] ?? '',
      name: map['user']['name'] ?? '',
      username: map['user']['username'] ?? '',
      followers: map['followers'] ?? {},
      followings: map['followings'] ?? {},
    );
  }
  factory User.fromMap2(map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
    );
  }

  factory User.fromJson(source) => User.fromMap(source);

  @override
  String toString() {
    return 'User(id: $id, name: $name, username: $username, followers: $followers, followings: $followings)';
  }

  get getRelations{
    List nodos = [];
    for (var i = 0; i < followers.length; i++) {
      User user = User.fromMap2(followers['$i']);
      nodos.add(user);
    }
    
    for (var i = 0; i < followings.length; i++) {
      User user = User.fromMap2(followings['$i']);
      nodos.add(user);
    }
    return nodos;
  }
}
