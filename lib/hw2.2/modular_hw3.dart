import 'package:flutter_modular/flutter_modular.dart';
import 'package:flut_homework/hw3/store/image_store.dart';
import 'package:flut_homework/hw3/hw3.dart';

class HW3Module extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => ImageStore())];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HW3(),
        transition: TransitionType.downToUp),
  ];
}