import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_rest/src/app/app_module.dart';
import 'package:flutter_api_rest/src/pages/home/home_bloc.dart';
import 'package:flutter_api_rest/src/pages/home/home_page.dart';
import 'package:flutter_api_rest/src/pages/home/home_repository.dart';
import 'package:flutter_api_rest/src/pages/home/subpages/create/create_bloc.dart';
import 'package:flutter_api_rest/src/pages/update/update_bloc.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc(HomeModule.to.getDependency<HomeRepository>())),
        Bloc((i) => CreateBloc(HomeModule.to.getDependency<HomeRepository>()),
            singleton: false),
        Bloc((i) => UpdateBloc(HomeModule.to.getDependency<HomeRepository>()))
      ];

  @override
  List<Dependency> get dependencies =>
      [Dependency((i) => HomeRepository(AppModule.to.getDependency<Dio>()))];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
