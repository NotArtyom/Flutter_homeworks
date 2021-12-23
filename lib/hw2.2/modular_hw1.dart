import 'package:flutter_modular/flutter_modular.dart';
import 'package:flut_homework/hw1/hw1.dart';

class HW1Module extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HW1(),
        transition: TransitionType.downToUp),
  ];
}