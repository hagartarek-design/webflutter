import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/foundation.dart'; // Add this import
class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  Future<UserCredential?> signInWithFacebook() async {
    try {
      // For web, we need to use a different approach
      if (kIsWeb) {
        // Create a new provider
        FacebookAuthProvider facebookProvider = FacebookAuthProvider();
        
        // Add scopes
        facebookProvider.addScope('email');
        facebookProvider.addScope('public_profile');
        
        // Sign in with popup
        return await _firebaseAuth.signInWithPopup(facebookProvider);
      } else {
        // Mobile implementation remains the same
        final LoginResult result = await _facebookAuth.login(
          permissions: ['public_profile', 'email'],
        );

        if (result.status == LoginStatus.success) {
          final OAuthCredential credential = 
              FacebookAuthProvider.credential(result.accessToken!.tokenString);
          return await _firebaseAuth.signInWithCredential(credential);
        } else {
          throw Exception('Facebook login failed: ${result.status}');
        }
      }
    } catch (e) {
      throw Exception('Facebook login error: $e');
    }
  }

  Future<void> signOut() async {
    if (!kIsWeb) {
      await _facebookAuth.logOut();
    }
    await _firebaseAuth.signOut();
  }
}