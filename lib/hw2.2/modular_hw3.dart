import 'package:flutter_modular/flutter_modular.dart';
import 'package:flut_homework/hw2/hw2.dart';
import 'package:flut_homework/hw2/message_store.dart';

class HW2Module extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => MessageStore())];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HW2(),
        transition: TransitionType.downToUp),
  ];
}