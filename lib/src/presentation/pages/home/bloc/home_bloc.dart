import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<OnChargedBD>(_onChargedBD);
  }

  Future<FutureOr<void>> _onChargedBD(
      OnChargedBD event, Emitter<HomeState> emit) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );
    var file = result!.files.first.path;
    var bytes = File(file!).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    log(excel.toString());

    // if (result != null) {
    //   var file = result.files.first.path;
    //   var bytes = File(file.toString()).readAsBytesSync();
    //   var excel = Excel.decodeBytes(bytes);
    //   for (var table in excel.tables.keys) {
    //     print(table);
    //     print(excel.tables[table]!.maxCols);
    //     print(excel.tables[table]!.maxRows);
    //     for (var row in excel.tables[table]!.rows) {
    //       print("${row.map((e) => e?.value)}");
    //     }
    //   }
    emit(SuccessHomeState());
    // } else {
    //   emit(FailureHomeState());
    // }
  }
}
