import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;
import 'package:crypto/crypto.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:mindweave/model/user_custom_model.dart';
import 'package:mindweave/service/user_controller.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthController extends GetxController {
  var userController = Get.put(UserController());

  Future<bool> userLogIn(UserCustomModel userCustomModel) async {
    try {
      var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userCustomModel.email ?? "",
        password: userCustomModel.pw ?? "",
      );

      await Purchases.logIn(user.user!.uid);

      Get.offAllNamed(AppRoutes.bottomNav);
      userController.createUser();
      return true;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message ?? "",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return false;
    } catch (e) {
      log("user login $e");
      return false;
    }
  }

  Future<bool> register(UserCustomModel userCustomModel) async {
    try {
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userCustomModel.email ?? "",
        password: userCustomModel.pw ?? "",
      );
      await Purchases.logIn(user.user!.uid);

      Get.offAllNamed(AppRoutes.bottomNav);
      userController.createUser(userCustomModel: userCustomModel);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message ?? "",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
    return true;
  }

  Future<bool> signInWithApple() async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );
      var user =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      await Purchases.logIn(user.user!.uid);

      Get.offAllNamed(AppRoutes.bottomNav);
      userController.createUser();
      return true;
    } on FirebaseAuthException catch (e) {
      log("signInWithApple Log In$e");

      Fluttertoast.showToast(
          msg: e.message ?? "",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        var user = await FirebaseAuth.instance.signInWithCredential(credential);

        await Purchases.logIn(user.user!.uid);

        Get.offAllNamed(AppRoutes.bottomNav);
        userController.createUser();
      }
      return true;
    } on FirebaseAuthException catch (e) {
      log("signInWithGoogle Log In$e");

      Fluttertoast.showToast(
          msg: e.message ?? "",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signInWithAnon() async {
    try {
      var user = await FirebaseAuth.instance.signInAnonymously();

      await Purchases.logIn(user.user!.uid);

      Get.offAllNamed(AppRoutes.bottomNav);
      userController.createUser();
      return true;
    } on FirebaseAuthException catch (e) {
      log("Facebook Log In$e");

      Fluttertoast.showToast(
          msg: e.message ?? "",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return false;
    } catch (e) {
      return false;
    }
  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
