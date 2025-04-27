class TaskModel {
  String? id;
  String? title;
  String? description;
  List<String>? sharedWith;
  DateTime? createdAt;
  DateTime? updates;

  TaskModel({
    this.id,
    this.title,
    this.description,
    this.sharedWith,
    this.createdAt,
    this.updates,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "sharedWith": sharedWith,
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updates?.toIso8601String(),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map["id"] ?? "",
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      sharedWith: List<String>.from(map["sharedWith"] ?? []),
      createdAt:
          map["createdAt"] != null && map["createdAt"].toString().isNotEmpty
              ? DateTime.parse(map["createdAt"])
              : null,
      updates:
          map["updatedAt"] != null && map["updatedAt"].toString().isNotEmpty
              ? DateTime.parse(map["updatedAt"])
              : null,
    );
  }
}
