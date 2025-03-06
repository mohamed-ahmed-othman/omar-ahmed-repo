import 'package:flutter/material.dart';
import 'package:oop/core/routing/app_router.dart';
import 'package:oop/doc_app.dart';

void main() {
  //update the runApp function to use the DocApp widget
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
