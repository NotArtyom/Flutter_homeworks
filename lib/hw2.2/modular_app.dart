import 'package:flutter_modular/flutter_modular.dart';
import 'package:flut_homework/hw2.2/modular_home.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [ModuleRoute('/', module: HomeModule())];
}