import 'package:flutter_api_rest/src/pages/home/subpages/create/create_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutter_api_rest/src/app/app_module.dart';

void main() {
  initModule(AppModule());
  CreateBloc bloc;

  setUp(() {
    bloc = AppModule.to.bloc<CreateBloc>();
  });

  group('CreateBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<CreateBloc>());
    });
  });
}
