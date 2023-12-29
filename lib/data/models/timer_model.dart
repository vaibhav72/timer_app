// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProjectTimer {
  int elapsed;
  int timerValue;
  String taskId;
  String description;
  String projectId;
  String id;
  bool isFavorite;
  ProjectTimer({
    this.elapsed = 0,
    required this.timerValue,
    required this.taskId,
    required this.description,
    required this.projectId,
    required this.id,
    required this.isFavorite,
  });

  ProjectTimer copyWith({
    int? elapsed,
    int? timerValue,
    String? taskId,
    String? description,
    String? projectId,
    String? id,
    bool? isFavorite,
  }) {
    return ProjectTimer(
      elapsed: elapsed ?? this.elapsed,
      timerValue: timerValue ?? this.timerValue,
      taskId: taskId ?? this.taskId,
      description: description ?? this.description,
      projectId: projectId ?? this.projectId,
      id: id ?? this.id,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'elapsed': elapsed,
      'timerValue': timerValue,
      'taskId': taskId,
      'description': description,
      'projectId': projectId,
      'id': id,
      'isFavorite': isFavorite,
    };
  }

  factory ProjectTimer.fromMap(Map<String, dynamic> map) {
    return ProjectTimer(
      elapsed: map['elapsed'] as int,
      timerValue: map['timerValue'] as int,
      taskId: map['taskId'] as String,
      description: map['description'] as String,
      projectId: map['projectId'] as String,
      id: map['id'] as String,
      isFavorite: map['isFavorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectTimer.fromJson(String source) =>
      ProjectTimer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProjectTimer(elapsed: $elapsed, timerValue: $timerValue, taskId: $taskId, description: $description, projectId: $projectId, id: $id, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(covariant ProjectTimer other) {
    if (identical(this, other)) return true;

    return other.elapsed == elapsed &&
        other.timerValue == timerValue &&
        other.taskId == taskId &&
        other.description == description &&
        other.projectId == projectId &&
        other.id == id &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return elapsed.hashCode ^
        timerValue.hashCode ^
        taskId.hashCode ^
        description.hashCode ^
        projectId.hashCode ^
        id.hashCode ^
        isFavorite.hashCode;
  }
}
