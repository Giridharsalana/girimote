import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      // Handle error appropriately, e.g., log it or show a user-friendly message
      return null;
    }
  }

  Future<User?> signUpWithEmailAndPassword(String email, String password, String name) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = result.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
        });
      }
      return user;
    } catch (e) {
      // Handle error appropriately, e.g., log it or show a user-friendly message
      return null;
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // The user canceled the sign-in
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential result = await _auth.signInWithCredential(credential);
      final User? user = result.user;
      if (user != null) {
        final QuerySnapshot snapshot = await _firestore
            .collection('users')
            .where('email', isEqualTo: user.email)
            .get();
        if (snapshot.docs.isEmpty) {
          await _firestore.collection('users').doc(user.uid).set({
            'name': user.displayName,
            'email': user.email,
          });
        }
      }
      return user;
    } catch (e) {
      // Handle error appropriately, e.g., log it or show a user-friendly message
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
