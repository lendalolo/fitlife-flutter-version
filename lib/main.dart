import 'dart:ui';
import 'package:fitness/common/common%20blocs/languge%20blocs/languge_bloc.dart';
import 'package:fitness/common/common%20blocs/last%20database%20update%20bloc/last_data_base_updated_bloc.dart';
import 'package:fitness/common/common%20blocs/theme%20bloc/theme_bloc.dart';
import 'package:fitness/common/localization/applocalizations.dart';
import 'package:fitness/common/utls/simple_bloc_opserviers.dart';
import 'package:fitness/features/on_boarding/presentation/views_bloc/change_page_bloc/change_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'common/Routing.dart';
import 'common/servies_locator.dart';
import 'features/food/presintation/views bloc/bascket add/bascket_add_bloc.dart';
import 'features/food/presintation/views bloc/food bascket/food_pascket_bloc.dart';
import 'features/home/data/repo/profile_repo_impl.dart';
import 'features/home/presintation/veiws bloc/profile statistc bloc/profile_statistics_bloc.dart';

Future<void> main() async {
  setUp();
  Bloc.observer = Observer();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LangugeBloc()..add(getLangugeEvent()),lazy:false ,),
          BlocProvider<BascketAddBloc>(create: (_) => BascketAddBloc()),
           BlocProvider(create: (context) => FoodPascketBloc()),
          BlocProvider(create: (context) => ChangePageBloc(),),
          BlocProvider(create: (context) => ThemeBloc(),),
        BlocProvider(create: (context) => ProfileStatisticsBloc(getIt.get<ProfileStatisticsImpl>()),)
        //  BlocProvider(create: (context) => LastDataBaseUpdatedBloc(getIt.get<LastUpdateDatabaseRepoImpl>())..add(LastDataBaseUpdatedEvent()),)

        ],
        child: BlocBuilder<LangugeBloc, LangugeState>(
          builder: (langcontext, langstate) {
            return BlocBuilder<ThemeBloc, ChangedTheme>(
              builder: (context, state) {
                return MaterialApp.router(
                  locale: langstate.locale,
                  routerConfig: AppRouter.generateRoute,
                  theme: state.theme,
                  title: 'Fitness 3 in 1',
                  debugShowCheckedModeBanner: false,
                  supportedLocales: const [Locale('en'), Locale('ar')],
                  localizationsDelegates: [
                    AppLocalazations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  // localeResolutionCallback: (deviceLocal, supportedLocales) {
                  //   for (var locale in supportedLocales) {
                  //       if (deviceLocal != null) {
                  //         if (locale.languageCode == deviceLocal.languageCode) {
                  //           // return deviceLocal;
                  //           return supportedLocales.first;
                  //         }
                  //       }
                  //   }
                  //   return supportedLocales.first;
                  // },
                );
              },
            );
          },
        ));
  }
}
