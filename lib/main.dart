import 'package:flatter_test_projact/common/url_page.dart';
import 'package:flatter_test_projact/presentation/admin/admin_main.dart';
import 'package:flatter_test_projact/presentation/auth/sign_in.dart';
import 'package:flatter_test_projact/presentation/auth/sign_up.dart';
import 'package:flatter_test_projact/presentation/user/user_main.dart';
import 'package:flutter/material.dart';
import 'core/db/data_base_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseHelper.instance.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: UrlPage.singIn,
      routes: {
        UrlPage.admin: (context) => AdminMain(),
        UrlPage.user: (context) => UserMain(),
        UrlPage.singIn: (context) => SignIn(),
        UrlPage.signUp: (context) => SignUp()
      },
    );
  }
}
