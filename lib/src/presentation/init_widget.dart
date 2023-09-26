// import 'package:app_tesis/src/core/services_manager/logger_service.dart';
// import 'package:app_tesis/src/injector.dart';
// import 'package:app_tesis/src/presentation/manager/app/app_cubit.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InitWidget extends StatefulWidget {
  const InitWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _InitWidgetState createState() => _InitWidgetState();
}

class _InitWidgetState extends State<InitWidget> {
  // late StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();

    // //Check internet connection
    // subscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) {
    //   context.read<AppCubit>().changeInternetConnectionStatus(result);

    //   injector<LoggerService>().printInfoLog(result.name);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    // subscription.cancel();
    super.dispose();
  }
}
