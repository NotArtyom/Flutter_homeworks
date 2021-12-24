import 'package:flutter_modular/flutter_modular.dart';
import 'package:flut_homework/hw2.2/modular_hw1.dart';
import 'package:flut_homework/hw2.2/modular_hw2.dart';

import './home_screen.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
        child: (context, args) => MyHomePage(
          title: 'Homeworks',
        )),
    ModuleRoute('/HW1/', module: HW1Module()),
    ModuleRoute('/HW2/', module: HW2Module()),
    ModuleRoute('/HW3/', module: module)
  ];
}