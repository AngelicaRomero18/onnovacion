// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:onnovacion/Users/application/login/login.dart';
import 'package:onnovacion/Users/insfrastructure/get.api.dart';
import 'package:onnovacion/widget/button.dart';
import 'package:onnovacion/widget/input.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String username;
  late String password;

  @override
  void initState() {
    username = "";
    password = "";
    super.initState();
  }

  LoginService loginService = LoginService(
    repository: UserApiRepository(),
  );

  void login(context) async {
    bool authorized = await loginService.execute(username, password);
    if (!authorized) return;
    Navigator.pushNamed(context, "home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topCenter,
            padding:
                const EdgeInsets.only(top: 50, left: 33, right: 33, bottom: 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0794DB),
                  Color(0xff97D2F4),
                ],
                begin: Alignment(0.49, -0.87),
                end: Alignment(-0.49, 0.87),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/group.png'),
                  ),
                  const SizedBox(height: 150),
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 16,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Input(
                          obligatoryField: '',
                          width: double.infinity,
                          labelInput: 'Email',
                          labelText: 'example@email.com',
                          validator: (value) {
                            return (value != null)
                                ? null
                                : 'Debe de ingresar un valor';
                          },
                          onChange: (value) {
                            setState(() {
                              username = value;
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        Input(
                          obligatoryField: '',
                          width: double.infinity,
                          labelInput: 'Contraseña',
                          labelText: '********',
                          validator: (value) {
                            return (value.length >= 8)
                                ? null
                                : 'La contraseña debe de ser de 8 caracteres';
                          },
                          onChange: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        Button(
                            width: double.infinity,
                            labelText: 'Ingresar',
                            onTap: () => login(context)),
                        const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'No tienes cuenta? ',
                                    style: TextStyle(
                                      color: Color(0xFF262626),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Registrate',
                                    style: TextStyle(
                                      color: Color(0xFF0793DA),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
