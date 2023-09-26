import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/src/presentation/pages/home/bloc/home_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:inventory_tesis/src/injector.dart';
import 'package:inventory_tesis/src/presentation/config/theme/cubit/app_cubit.dart';
import 'package:inventory_tesis/src/presentation/init_widget.dart';
import 'package:inventory_tesis/src/presentation/pages/home/home.dart';
import 'package:sizer/sizer.dart' as sizer;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key? key}) : super(key: key);

  // final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return sizer.Sizer(builder: (
      BuildContext context,
      Orientation orientation,
      sizer.DeviceType deviceType,
    ) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => injector<AppCubit>(),
          ),
          BlocProvider(
            create: ((context) => injector<HomeBloc>()),
          ),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, appState) {
            return InitWidget(
              child: DevicePreview(
                  enabled: false,
                  builder: (context) => OKToast(
                          child: MaterialApp(
                        // routeInformationParser: _appRouter.defaultRouteParser(),
                        // routerDelegate: _appRouter.delegate(),
                        debugShowCheckedModeBanner: false,
                        title: 'UCInventory',
                        home: const HomePage(),
                        theme: appState.themeData,
                        // supportedLocales: S.delegate.supportedLocales,
                        // localizationsDelegates: const [
                        // S.delegate,
                        // GlobalMaterialLocalizations.delegate,
                        // GlobalCupertinoLocalizations.delegate,
                        // Built-in localization for text direction LTR/RTL
                        // GlobalWidgetsLocalizations.delegate,
                        // ],
                        // locale: appState.locale,
                      ))),
            );
          },
        ),
      );
    });
  }
}
