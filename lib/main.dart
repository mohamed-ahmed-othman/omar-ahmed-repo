import 'package:flutter/material.dart';
import 'package:oop/core/di/dependency_injections.dart';
import 'package:oop/core/routing/app_router.dart';
import 'package:oop/doc_app.dart';

void main() {
  setupGetIt();
  //update the runApp function to use the DocApp widget
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
