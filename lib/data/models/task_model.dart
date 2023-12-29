// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskModel {
  String id;
  String name;
  String projectId;
  String description;
  DateTime deadline;
  String assignedTo;
  TaskModel({
    required this.id,
    required this.name,
    required this.projectId,
    required this.description,
    required this.deadline,
    required this.assignedTo,
  });

  TaskModel copyWith({
    String? id,
    String? name,
    String? projectId,
    String? description,
    DateTime? deadline,
    String? assignedTo,
  }) {
    return TaskModel(
      id: id ?? this.id,
      name: name ?? this.name,
      projectId: projectId ?? this.projectId,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      assignedTo: assignedTo ?? this.assignedTo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'projectId': projectId,
      'description': description,
      'deadline': deadline.millisecondsSinceEpoch,
      'assignedTo': assignedTo,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      name: map['name'] as String,
      projectId: map['projectId'] as String,
      description: map['description'] as String,
      deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline'] as int),
      assignedTo: map['assignedTo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(id: $id, name: $name, projectId: $projectId, description: $description, deadline: $deadline, assignedTo: $assignedTo)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.projectId == projectId &&
        other.description == description &&
        other.deadline == deadline &&
        other.assignedTo == assignedTo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        projectId.hashCode ^
        description.hashCode ^
        deadline.hashCode ^
        assignedTo.hashCode;
  }
}
