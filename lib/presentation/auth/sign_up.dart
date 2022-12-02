import 'package:flatter_test_projact/data/repository/auth_repository_impl.dart';
import 'package:flatter_test_projact/domain/usercases/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _signUpState();
}

class _signUpState extends State<SignUp> {
  GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(color: Color.fromARGB(200,115,225,60),border: Border.all(color: Colors.black,width: 1,style: BorderStyle.solid), borderRadius: BorderRadius.circular(100)),
          child: Form(
          key: _key,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //const Expanded(child: SizedBox()),
            SizedBox(height: 50,),
            const Text(
              "Регистрация",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 60,
              width: 250,
              child: TextFormField(
                controller: _loginController,
                validator: (value) {
                  if (!_isValid) {
                    return null;
                  }
                  if (value!.isEmpty) {
                    return 'Поле логин не заполнено';
                  }
                  if (value.length < 3) {
                    return 'Логин должен содержать минимум 3 символов';
                  }
                  if (value.contains(RegExp(
                      r'^(?=.*?[0-9])(?=.*?[!@#\$&*~])(?=.*?[A-Z])(?=.*?[a-z])$'))) {
                    return 'Логин должен содержать 1 цифру, 1 символ, 1 строчную, 1 заглавную букву';
                  }
                  return null;
                },
                maxLength: 16,
                decoration: const InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)),
                    borderSide: BorderSide(
                        color:
                        Color.fromARGB(255, 4, 19, 165),
                        width: 2.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)),
                    borderSide: BorderSide(
                        color:
                        Color.fromARGB(255, 4, 19, 165),
                        width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)),
                    borderSide: BorderSide(
                        color: Colors.black54, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)),
                    borderSide: BorderSide(
                        color:
                        Color.fromARGB(255, 4, 19, 165),
                        width: 2.0),
                  ),
                  hintText: 'Логин',
                  contentPadding: EdgeInsets.only(
                      left: 14.0, bottom: 0.0, top: 0.0),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 5,),
            SizedBox(
              height: 60,
              width: 250,
              child: TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (!_isValid) {
                    return null;
                  }
                  if (value!.isEmpty) {
                    return 'Поле пароль не заполнено';
                  }
                  if (value.length < 5) {
                    return 'Пароль должен содержать не менее 5 символов';
                  }
                  if (value.contains(RegExp(
                      r'^(?=.*?[0-9])(?=.*?[!@#\$&*~])(?=.*?[A-Z])(?=.*?[a-z])$'))) {
                    return 'Логин должен содержать 1 цифру, 1 символ, 1 строчную, 1 заглавную букву';
                  }
                  return null;
                },
                maxLength: 10,
                decoration: const InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)),
                    borderSide: BorderSide(
                        color:
                        Color.fromARGB(255, 4, 19, 165),
                        width: 2.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)),
                    borderSide: BorderSide(
                        color:
                        Color.fromARGB(255, 4, 19, 165),
                        width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)),
                    borderSide: BorderSide(
                        color: Colors.black54, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)),
                    borderSide: BorderSide(
                        color:
                        Color.fromARGB(255, 4, 19, 165),
                        width: 2.0),
                  ),
                  hintText: 'Пароль',
                  contentPadding: EdgeInsets.only(
                      left: 14.0, bottom: 0.0, top: 0.0),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                  child: Text("Зарегистрироваться",style: TextStyle(color: Colors.white),),
                  onPressed: () => {
                    _isValid = true,
                    if (_key.currentState!.validate()) {signUp()} else {}
                  },
                )),
            SizedBox(height: 10,),
            Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                  child: Text("Авторизация",style: TextStyle(color: Colors.white),),
                  onPressed: () => {
                    _loginController.clear(),
                    _passwordController.clear(),
                    _isValid = false,
                    _key.currentState!.validate(),
                    Navigator.pushNamed(context, 'sign_in'),
                  },
                ))
          ],
          ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    final AuthRepositoryImpl auth = AuthRepositoryImpl();

    var result = await Auth(auth).signUp(AuthParams(
      login: _loginController.text,
      password: _passwordController.text,
    ));

    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l.errorMessage),
        ),
      );
    }, (r) {
      Navigator.pushNamed(context, 'sign_in');
    });
  }
}
