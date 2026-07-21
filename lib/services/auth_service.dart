import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Sign Up
Future<User?> signUp({
  required String name,
  required String email,
  required String password,
}) async {
  UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  // Save the user's name
  await userCredential.user!.updateDisplayName(name);

  // Refresh the user so displayName is updated immediately
  await userCredential.user!.reload();

  return _auth.currentUser;
}

  // Login
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user;
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Current User
  User? get currentUser => _auth.currentUser;
}