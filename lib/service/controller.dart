import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'authentication_controller.dart';
import 'category_controller.dart';
import 'post_controller.dart';
import 'setting_controller.dart';
import 'task_controller.dart';
import 'user_controller.dart';

class AppProviders {
  static final providers = <SingleChildWidget>[
    ListenableProvider(create: (_) => PostController()),
    ListenableProvider(create: (_) => UserController()),
    ListenableProvider(create: (_) => CategoryController()),
    ListenableProvider(create: (_) => TaskController()),
    ListenableProvider(create: (_) => AuthenticationController()),
    ListenableProvider(create: (_) => SettingController()),
  ];
}
