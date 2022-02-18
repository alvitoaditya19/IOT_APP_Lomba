part of 'shared.dart';

Future<File> getImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  return image;
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  firebase_storage.Reference ref =
  firebase_storage.FirebaseStorage.instance.ref().child(fileName);
  firebase_storage.UploadTask task = ref.putFile(image);
  firebase_storage.TaskSnapshot snapshot = await task;

  return await snapshot.ref.getDownloadURL();
}

Future getSaintek() async {
  var firestore = FirebaseFirestore.instance;

  QuerySnapshot qn = await firestore.collection('saintek').get();

  return qn;
}
