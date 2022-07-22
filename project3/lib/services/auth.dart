import 'package:firebase_auth/firebase_auth.dart';
import 'package:project3/models/user.dart';
class AuthService{
  final  FirebaseAuth _auth = FirebaseAuth.instance;
  //create user object based on firebase user
  User1? _userFromFirebaseUser(User user){
    return (user!=null?User1(uid:user.uid):null);
  }
  //auth change user stream
  Stream<User1?> get user {
   return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user!));
  }
  //sign in anonymously
  Future signInAnon() async{
    try{
      UserCredential result =await _auth.signInAnonymously();
     final User user = result.user!;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  //register with email and password

  //sign out
Future SignOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
}
}