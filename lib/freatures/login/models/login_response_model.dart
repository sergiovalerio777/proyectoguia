class LoginResponse {
    final bool state;
    final DateTime timestamp;
    final int status;
    final String message;
    final Data data;

    LoginResponse({
        required this.state,
        required this.timestamp,
        required this.status,
        required this.message,
        required this.data,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        state: json["state"],
        timestamp: DateTime.parse(json["timestamp"]),
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "state": state,
        "timestamp": timestamp.toIso8601String(),
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    final User user;
    final String token;

    Data({
        required this.user,
        required this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
    };
}

class User {
    final bool enabled;
    final List<Role> roles;
    final dynamic password;
    final String username;
    final List<Authority> authorities;
    final bool accountNonExpired;
    final bool accountNonLocked;
    final bool credentialsNonExpired;
    final List<Modulo> modulos;

    User({
        required this.enabled,
        required this.roles,
        required this.password,
        required this.username,
        required this.authorities,
        required this.accountNonExpired,
        required this.accountNonLocked,
        required this.credentialsNonExpired,
        required this.modulos,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        enabled: json["enabled"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        password: json["password"],
        username: json["username"],
        authorities: List<Authority>.from(json["authorities"].map((x) => Authority.fromJson(x))),
        accountNonExpired: json["accountNonExpired"],
        accountNonLocked: json["accountNonLocked"],
        credentialsNonExpired: json["credentialsNonExpired"],
        modulos: List<Modulo>.from(json["modulos"].map((x) => Modulo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "enabled": enabled,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "password": password,
        "username": username,
        "authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
        "accountNonExpired": accountNonExpired,
        "accountNonLocked": accountNonLocked,
        "credentialsNonExpired": credentialsNonExpired,
        "modulos": List<dynamic>.from(modulos.map((x) => x.toJson())),
    };
}

class Authority {
    final String authority;

    Authority({
        required this.authority,
    });

    factory Authority.fromJson(Map<String, dynamic> json) => Authority(
        authority: json["authority"],
    );

    Map<String, dynamic> toJson() => {
        "authority": authority,
    };
}

class Modulo {
    final int id;
    final String nombre;
    final String codigo;
    final int? moduloPadreId;
    final List<Modulo> submodulos;
    final List<Opcione> opciones;

    Modulo({
        required this.id,
        required this.nombre,
        required this.codigo,
        required this.moduloPadreId,
        required this.submodulos,
        required this.opciones,
    });

    factory Modulo.fromJson(Map<String, dynamic> json) => Modulo(
        id: json["id"],
        nombre: json["nombre"],
        codigo: json["codigo"],
        moduloPadreId: json["moduloPadreId"],
        submodulos: List<Modulo>.from(json["submodulos"].map((x) => Modulo.fromJson(x))),
        opciones: List<Opcione>.from(json["opciones"].map((x) => Opcione.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "codigo": codigo,
        "moduloPadreId": moduloPadreId,
        "submodulos": List<dynamic>.from(submodulos.map((x) => x.toJson())),
        "opciones": List<dynamic>.from(opciones.map((x) => x.toJson())),
    };
}

class Opcione {
    final int id;
    final String nombre;
    final String codigo;

    Opcione({
        required this.id,
        required this.nombre,
        required this.codigo,
    });

    factory Opcione.fromJson(Map<String, dynamic> json) => Opcione(
        id: json["id"],
        nombre: json["nombre"],
        codigo: json["codigo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "codigo": codigo,
    };
}

class Role {
    final int id;
    final String nombre;

    Role({
        required this.id,
        required this.nombre,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}
