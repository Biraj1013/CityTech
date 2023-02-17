import 'package:app/logic/bloc/all_tockets/all_ticket_bloc.dart';
import 'package:app/presentation/screens/ticket_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AllTicketBloc(),
        child: const TicketDetailsPage(),
      ),
    );
  }
}
