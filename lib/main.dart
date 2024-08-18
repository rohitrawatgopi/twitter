import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter2/BLOC/Theme/theme_data_bloc.dart';
import 'package:twitter2/BLOC/Theme/theme_data_state.dart';
import 'package:twitter2/app.dart';
import 'package:twitter2/core/local_database/shared_pre.dart';
import 'package:twitter2/feature/check_internet/internet_bloc.dart';
import 'package:twitter2/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesManager.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeDataBloc themeDataBloc = ThemeDataBloc();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeDataBloc(),
          ),
          BlocProvider(
            create: (context) => InternetBloc(),
          ),
        ],
        child: BlocProvider(
          create: (context) => themeDataBloc,
          child: BlocBuilder<ThemeDataBloc, ThemeDataInitial>(
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      colorScheme: state
                          .colorScheme), // Assuming your ThemeDataState has a themeData property
                  home: DecidedPage());
            },
          ),
        ));
  }
}
