class ListarTareasResponse {
    final bool state;
    final DateTime timestamp;
    final int status;
    final String message;
    final Data data;

    ListarTareasResponse({
        required this.state,
        required this.timestamp,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ListarTareasResponse.fromJson(Map<String, dynamic> json) => ListarTareasResponse(
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
    final List<Tarea> tareas;

    Data({
        required this.tareas,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        tareas: List<Tarea>.from(json["tareas"].map((x) => Tarea.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tareas": List<dynamic>.from(tareas.map((x) => x.toJson())),
    };
}

class Tarea {
    final int id;
    final String titulo;
    final String descripcion;

    Tarea({
        required this.id,
        required this.titulo,
        required this.descripcion,
    });

    factory Tarea.fromJson(Map<String, dynamic> json) => Tarea(
        id: json["id"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "descripcion": descripcion,
    };
}
