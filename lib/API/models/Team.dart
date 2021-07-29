class Team {
  final int id;
  final String name;
  final int userID;
  final List<String> roles;

  Team({
    required this.id,
    required this.name,
    required this.userID,
    required this.roles
  });

  factory Team.fromJson(Map<String,dynamic> json) {
    final roles = <String>[];
    for (String role in json['Roles']) {
      roles.add(role);
    }
    return Team(
        id: json['ID'],
        name: json['Name'],
        userID: json['UserID'],
        roles: roles
    );
  }
}