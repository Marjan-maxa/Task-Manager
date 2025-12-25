import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/provider/auth_provider.dart';
import 'package:task_management/provider/network_provider.dart';

import 'app.dart';

void main() {
  runApp(

    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthProvider()),
      ChangeNotifierProvider(create: (_)=>NetworkProvider()),
    ],
      child: TaskManagement(),
    )

  );
}

