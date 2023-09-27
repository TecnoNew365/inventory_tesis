import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    // var bytes = File(file!).readAsBytesSync();
    // var excel = Excel.decodeBytes(bytes);
    // log(excel.toString());

    if (result != null) {
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
      // }
      var file = result.files.single.path;

      // var excelBytes = File(file!).readAsBytesSync();
      var excelBytes = await rootBundle.load(file!);
      List<List<dynamic>> excelList = const CsvToListConverter()
          .convert(utf8.decode(excelBytes.buffer.asUint8List()));
      // List<List<dynamic>> excelList =
      //     const CsvToListConverter().convert(utf8.decode(excelBytes));

      // Escribir el archivo CSV
      String csvData = const ListToCsvConverter().convert(excelList);
      log(csvData);
      emit(SuccessHomeState());
    } else {
      emit(FailureHomeState());
    }
  }
}
