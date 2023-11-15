import 'package:flutter/material.dart';
import 'package:fluttter_hive/home_screen.dart';
import 'package:fluttter_hive/models/notes_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory() ;
  Hive.init(directory.path);

  Hive.registerAdapter(NotesModelAdapter()) ;
  await Hive.openBox<NotesModel>('notes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qurinom Note App',
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: HomeScreen()
    );
  }
}

