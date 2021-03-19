import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String imageUrl;

Future<User> signInWithGoogle() async {
    await Firebase.initializeApp();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        await googleSignInAccount.authentication;
      
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken, 
        accessToken: googleSignInAuthentication.accessToken);
          
    final UserCredential authResult = await auth.signInWithCredential(credential);
    User user = authResult.user;
      print(user.email);

    if (user != null){
      assert(user.displayName != null);
      assert(user.photoURL !=null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = auth.currentUser;
      assert(user.uid == currentUser.uid);

      print("Sign Success: $user");
      return user;
    }
    return user;
}
  
Future<void> signOutGoogle() async{
  await googleSignIn.signOut();
  print("User signed out");
}