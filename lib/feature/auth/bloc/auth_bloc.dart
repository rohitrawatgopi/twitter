import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:twitter2/app.dart';
import 'package:twitter2/core/local_database/shared_pre.dart';
import 'package:twitter2/feature/auth/models/user_model.dart';
import 'package:twitter2/feature/auth/repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum AuthType { login, register }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthenticationEvent>(authenticationEvent);
  }

  FutureOr<void> authenticationEvent(
      AuthenticationEvent event, Emitter<AuthState> emit) async {
    UserCredential? credential;
    switch (event.authType) {
      case AuthType.login:
        try {
          log(event.email);
          log(event.password);
          credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.email, password: event.password);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            log('No user found for that email.');
            emit(AuthErrorState(error: "No user found for that email"));
          } else if (e.code == 'wrong-password') {
            emit(AuthErrorState(error: "'wrong-password"));
            log('Wrong password provided for that user.');
          }
        }
        break;
      case AuthType.register:
        try {
          log("resgister called");
          credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(AuthErrorState(error: "weak-password"));
            log('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            emit(AuthErrorState(error: "email-already-in-use"));
            log('The account already exists for that email.');
          }
        } catch (e) {
          emit(AuthErrorState(error: "something went wrong"));
          log(e.toString());
        }
    }
    log("HEllo ");
    log(credential.toString());
    if (credential != null) {
      log("f");
      if (event.authType == AuthType.login) {
        UserModel? userModel =
            await AuthRepo.getUserRepo(credential.user?.uid ?? "");
        if (userModel != null) {
          await SharedPreferencesManager.saveUid(credential.user?.uid ?? "");
          DecidedPage.authStream.add(credential.user?.uid ?? "");
          emit(AuthSuccessState());
        } else {
          emit(AuthErrorState(error: "Something went wrong "));
        }
      } else if (event.authType == AuthType.register) {
        log("f");
        bool success = await AuthRepo.createUser(UserModel(
            uid: credential.user?.uid ?? "",
            tweets: [],
            firstName: event.name,
            lastName: "Rawat",
            email: event.email,
            createdAt: DateTime.now()));
        if (success) {
          await SharedPreferencesManager.saveUid(credential.user?.uid ?? "");
          DecidedPage.authStream.add(credential.user?.uid ?? "");
          emit(AuthSuccessState());
        } else {
          emit(AuthErrorState(error: "Something went wrong "));
        }
      }
    } else {
      log("Credential is null");
      emit(AuthErrorState(error: "Something went wrong"));
    }
  }
}
