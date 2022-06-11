import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthService {
  final FirebaseAuth _auth;
  DatabaseReference _dbref;
  AuthService()
      : _auth = FirebaseAuth.instance,
        _dbref = FirebaseDatabase.instance.ref();

 signIn(String email,String password) async {
   var user =await _auth.signInWithEmailAndPassword(email: email, password: password);
   return user.user;
 }

 signOut() async{
   return await _auth.signOut();
 }

 createPerson(String email,String password) async{
   var user=await _auth.createUserWithEmailAndPassword(email: email, password: password);
   return user.user;
 }
 
}
