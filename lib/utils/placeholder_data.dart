import 'package:flutter/material.dart';
import 'package:timer_app/data/models/project_model.dart';
import 'package:timer_app/data/models/task_model.dart';

Map<String, ProjectModel> projects = {
  "1": ProjectModel(
      color: Colors.red, name: "Apexive: Content Planning 1", id: "1"),
  "2": ProjectModel(
      color: Colors.blue, name: "Apexive: Content Planning 2", id: "2"),
  "3": ProjectModel(
      color: Colors.green, name: "Apexive: Content Planning 3", id: "3"),
  "4": ProjectModel(
      color: Colors.yellow, name: "Apexive: Content Planning 4", id: "4"),
  "5": ProjectModel(
      color: Colors.purple, name: "Apexive: Content Planning 5", id: "5"),
};

Map<String, Map<String, TaskModel>> tasks = {
  "1": {
    "1": TaskModel(
        id: "1",
        assignedTo: "Ivan",
        deadline: DateTime.now().add(const Duration(minutes: 5)),
        name: "Task 1",
        projectId: "1",
        description:
            "As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis"),
    "2": TaskModel(
        id: "2",
        assignedTo: "Ivan",
        deadline: DateTime.now().add(const Duration(minutes: 10)),
        name: "Task 2",
        projectId: "1",
        description:
            "As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis")
  },
  "2": {
    "1": TaskModel(
        id: "1",
        assignedTo: "Ivan",
        deadline: DateTime.now().add(const Duration(minutes: 30)),
        name: "Task 1",
        projectId: "1",
        description:
            "As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis"),
    "2": TaskModel(
        id: "2",
        assignedTo: "Ivan",
        deadline: DateTime.now().add(const Duration(hours: 3)),
        name: "Task 2",
        projectId: "2",
        description:
            "As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis")
  },
  "3": {
    "1": TaskModel(
        id: "1",
        assignedTo: "Ivan",
        deadline: DateTime.now().add(const Duration(hours: 2)),
        name: "Task 1",
        projectId: "3",
        description:
            "As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis"),
  },
  "4": {
    "1": TaskModel(
        id: "1",
        assignedTo: "Ivan",
        deadline: DateTime.now().add(const Duration(hours: 1)),
        name: "Task 1",
        projectId: "4",
        description:
            "As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis"),
  },
  "5": {
    "1": TaskModel(
        id: "1",
        assignedTo: "Ivan",
        deadline: DateTime.now().add(const Duration(hours: 2)),
        name: "Task 1",
        projectId: "5",
        description:
            "As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis"),
  },
};
