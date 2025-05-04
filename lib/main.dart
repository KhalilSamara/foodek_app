import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodek_app/translations/codegen_loader.g.dart';
import 'package:foodek_app/view/screens/splash.dart';
import 'features/register/data/data_source/register_data_source.dart';
import 'features/register/data/repositories/register_repository_imp.dart';
import 'features/register/domain/use_case/register_use_case.dart';
import 'features/register/presentation/cubit/register_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize repository with data source
    final authRepository = RegisterRepositoryImp(
      registerRemoteDataSource: RegisterRemoteDataSource(),
    );

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (_) => RegisterCubit(
                  registerUseCase: RegisterUseCase(repository: authRepository),
                ),
          ),
          // Add other cubits here if needed
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          debugShowCheckedModeBanner: false,
          title: 'Foodek App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          ),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
