import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gif/gif.dart';
import 'package:spira/feature/core/app_const.dart';
import 'package:spira/feature/presentation/cubits/auth/auth_cubit.dart';
import 'package:spira/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final GifController controller;

  @override
  void initState() {
    controller = GifController(vsync: this);
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(seconds: 5));
    GetIt.I<AuthCubit>().appStarted().then(
      (authenticated) {
        if (authenticated) {
          Navigator.pushReplacementNamed(
            context,
            PageConst.menuPage,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            PageConst.loginPage,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Gif(
        controller: controller,
        autostart: Autostart.once,
        image: Assets.splash.provider(),
      )),
    );
  }
}
