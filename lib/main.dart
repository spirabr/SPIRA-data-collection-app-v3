import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:spira/feature/core/app_const.dart';
import 'package:spira/feature/on_generate_route.dart';
import 'package:spira/feature/presentation/cubits/auth/auth_cubit.dart';
import 'package:spira/feature/presentation/pages/splash/splash_screen.dart';
import 'package:spira/injection_container.dart' as injection;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injection.initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => injection.di.get<AuthCubit>()..appStarted()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SPIRA-BM',
        theme: ThemeData(
          useMaterial3: true,
        ),
        navigatorKey: GetIt.I<Globals>().globalKey,
        initialRoute: '/',
        onGenerateRoute: OnGenerateRoute.onGenerateRoute,
        routes: {
          "/": (context) => const SplashScreen(),
        },
        builder: EasyLoading.init(),
      ),
    );
  }
}
