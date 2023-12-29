// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

/// This class represents the fields for a project.
class ProjectModel {
  Color color;
  String name;
  String id;
  ProjectModel({
    required this.color,
    required this.name,
    required this.id,
  });

  ProjectModel copyWith({
    Color? color,
    String? name,
    String? id,
  }) {
    return ProjectModel(
      color: color ?? this.color,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color.value,
      'name': name,
      'id': id,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      color: Color(map['color'] as int),
      name: map['name'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) =>
      ProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Project(color: $color, name: $name, id: $id)';

  @override
  bool operator ==(covariant ProjectModel other) {
    if (identical(this, other)) return true;

    return other.color == color && other.name == name && other.id == id;
  }

  @override
  int get hashCode => color.hashCode ^ name.hashCode ^ id.hashCode;
}
