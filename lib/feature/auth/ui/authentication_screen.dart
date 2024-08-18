import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter2/design/widgets/logo.dart';
import 'package:twitter2/design/widgets/textform.dart';
import 'package:twitter2/feature/auth/bloc/auth_bloc.dart';
import 'package:twitter2/feature/tweet/ui/tweet_page.dart';

class AuthScreen extends StatefulWidget {
  bool isLogin;
  AuthScreen({super.key, required this.isLogin});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  @override
  final AuthBloc _authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    void dispose() {
      _emailController.dispose();
      _nameController.dispose();
      _passwordController.dispose();
    }

    return Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          title: const LogoImage(),
          centerTitle: true,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          bloc: _authBloc,
          listenWhen: (previous, current) => current is AuthActionState,
          buildWhen: (previous, current) => current is! AuthActionState,
          listener: (context, state) {
            if (state is AuthErrorState) {
              isLoading = false;
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            } else if (state is AuthSuccessState) {
              isLoading = false;
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => TweetScreen()),
                  (route) => route.isFirst);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    widget.isLogin
                        ? const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          )
                        : const Text(
                            "Create your account",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                    widget.isLogin
                        ? const SizedBox()
                        : primaryTextForm(
                            formKey: formKey,
                            textEditingController: _nameController,
                            label: "Name",
                            hint: "Name"),
                    const SizedBox(
                      height: 10,
                    ),
                    primaryTextForm(
                        formKey: formKey,
                        textEditingController: _emailController,
                        label: "Email address",
                        hint: "Email"),
                    const SizedBox(
                      height: 10,
                    ),
                    primaryTextForm(
                        formKey: formKey,
                        textEditingController: _passwordController,
                        label: "Password",
                        hint: "Password"),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        height: 50,
                        width: double.maxFinite,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onPressed: () {
                              isLoading = true;
                              if (formKey.currentState!.validate()) {
                                if (widget.isLogin) {
                                  _authBloc.add(AuthenticationEvent(
                                      authType: AuthType.login,
                                      email: _emailController.text,
                                      password: _passwordController.text));
                                } else {
                                  _authBloc.add(AuthenticationEvent(
                                      name: _nameController.text,
                                      authType: AuthType.register,
                                      email: _emailController.text,
                                      password: _passwordController.text));
                                }
                              }
                            },
                            child: isLoading
                                ? CircularProgressIndicator()
                                : Text(
                                    widget.isLogin ? "Login" : "Register",
                                    style: const TextStyle(color: Colors.white),
                                  ))),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.isLogin
                            ? "   D'ont have an account?   "
                            : "Already have an account?  "),
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.isLogin = !widget.isLogin;
                              log(widget.isLogin.toString());
                            });
                          },
                          child: Text(
                            !widget.isLogin ? "Login" : "Register",
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
          },
        ));
  }
}
