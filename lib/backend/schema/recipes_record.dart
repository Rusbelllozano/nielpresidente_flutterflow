import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipesRecord extends FirestoreRecord {
  RecipesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  // "video_source" field.
  String? _videoSource;
  String get videoSource => _videoSource ?? '';
  bool hasVideoSource() => _videoSource != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _thumbnail = snapshotData['thumbnail'] as String?;
    _videoSource = snapshotData['video_source'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recipes');

  static Stream<RecipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecipesRecord.fromSnapshot(s));

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecipesRecord.fromSnapshot(s));

  static RecipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecipesRecordData({
  String? title,
  String? thumbnail,
  String? videoSource,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'thumbnail': thumbnail,
      'video_source': videoSource,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecipesRecordDocumentEquality implements Equality<RecipesRecord> {
  const RecipesRecordDocumentEquality();

  @override
  bool equals(RecipesRecord? e1, RecipesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.thumbnail == e2?.thumbnail &&
        e1?.videoSource == e2?.videoSource;
  }

  @override
  int hash(RecipesRecord? e) =>
      const ListEquality().hash([e?.title, e?.thumbnail, e?.videoSource]);

  @override
  bool isValidKey(Object? o) => o is RecipesRecord;
}
