import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/src/presentation/pages/home/bloc/home_bloc.dart';
import 'package:oktoast/oktoast.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("UCInventory"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is SuccessHomeState) {}
              if (state is FailureHomeState) {
                showToast(
                  'Ha ocurrido algun error inesperado',
                  backgroundColor: Colors.red,
                );
              }
              return ElevatedButton(
                onPressed: () {
                  homeBloc.add(OnChargedBD());
                },
                child: const Row(
                  children: [
                    Icon(Icons.import_export),
                    Text('Importar BD'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
