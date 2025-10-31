import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;
  bool get isLoggedIn => _auth.currentUser != null;

  // Listen to auth state changes
  void initializeAuthListener() {
    _auth.authStateChanges().listen((User? user) {
      notifyListeners();
    });
  }

  // Login with email and password
  Future<String?> loginWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Success
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e.code);
    } catch (e) {
      return 'Đã xảy ra lỗi, vui lòng thử lại';
    }
  }

  // Register with email and password
  Future<String?> registerWithEmail(
    String email,
    String password,
    String name,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Update display name
      await _auth.currentUser?.updateDisplayName(name);
      
      return null; // Success
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e.code);
    } catch (e) {
      return 'Đã xảy ra lỗi, vui lòng thử lại';
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Handle auth errors
  String _handleAuthError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'Không tìm thấy người dùng với email này';
      case 'wrong-password':
        return 'Mật khẩu không chính xác';
      case 'email-already-in-use':
        return 'Email này đã được sử dụng';
      case 'weak-password':
        return 'Mật khẩu quá yếu';
      case 'invalid-email':
        return 'Email không hợp lệ';
      default:
        return 'Đã xảy ra lỗi, vui lòng thử lại';
    }
  }
}
