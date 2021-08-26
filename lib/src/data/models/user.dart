class User {
  final String id, email, name, lastName;
  final DateTime birthday;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.lastName,
    required this.birthday,
  });

  /* También se puede:
  
  User({
    @required this.id,
    @required this.email,
    @required this.name,
    @required this.lastName,
    @required this.birthday,
  }) :
    assert(id != null, "Id can't be null"),
    assert(email != null, "Email can't be null"),
    assert(name != null, "Name can't be null"),
    assert(lastName != null, "Last Name can't be null"),
    assert(birthday != null, "Birthday can't be null");  
  }
  
  */
}
