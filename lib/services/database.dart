import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ordersystem_j/models/brew.dart';
import 'package:ordersystem_j/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });

  //collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });

  }

  //brew list from snapshot
  List<Brew> _brewlistFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Brew(
        name: doc.data['name'] ?? '',
        sugars: doc.data['sugars'] ?? '0',
        strength: doc.data['strength'] ?? 0,
      );
    }).toList();
  }

  //userdata from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );
  }

  //get brew stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
      .map(_brewlistFromSnapshot);
  } 

  //get user doc stream
  Stream<UserData> get userdata {
    return brewCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}