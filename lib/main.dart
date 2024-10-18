import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t1/data/cubits/home_cubit.dart';
import 'package:t1/data/cubits/image_cubit/image_cubit.dart';
import 'package:t1/data/cubits/info_cubit/info_cubit.dart';
import 'presentation/screens/splash_screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeCubit>(create: (BuildContext) => HomeCubit()),
    BlocProvider<ImageCubit>(create: (BuildContext) => ImageCubit()),
    BlocProvider<InfoCubit>(create: (BuildContext) => InfoCubit())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
