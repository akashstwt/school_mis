import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> googleSignIn() async {
    try {
      // Attempt to sign in the user with Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Check if the user canceled the sign-in
      if (googleUser == null) {
        print("User canceled the Google Sign-In");
        return;
      }

      // Get the authentication details from the Google sign-in process
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a credential for Firebase authentication
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the credential
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      // Print a success message and optionally user details
      print("User signed in successfully: ${userCredential.user?.email}");
    } catch (e) {
      // Handle any errors that occur during the process
      print("Error during Google Sign-In: $e");
    }
  }
}
