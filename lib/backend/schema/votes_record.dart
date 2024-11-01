import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VotesRecord extends FirestoreRecord {
  VotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "event_id" field.
  DocumentReference? _eventId;
  DocumentReference? get eventId => _eventId;
  bool hasEventId() => _eventId != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  // "event_participant_id" field.
  DocumentReference? _eventParticipantId;
  DocumentReference? get eventParticipantId => _eventParticipantId;
  bool hasEventParticipantId() => _eventParticipantId != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _eventId = snapshotData['event_id'] as DocumentReference?;
    _score = castToType<int>(snapshotData['score']);
    _eventParticipantId =
        snapshotData['event_participant_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('votes');

  static Stream<VotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VotesRecord.fromSnapshot(s));

  static Future<VotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VotesRecord.fromSnapshot(s));

  static VotesRecord fromSnapshot(DocumentSnapshot snapshot) => VotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVotesRecordData({
  DocumentReference? userId,
  DocumentReference? eventId,
  int? score,
  DocumentReference? eventParticipantId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'event_id': eventId,
      'score': score,
      'event_participant_id': eventParticipantId,
    }.withoutNulls,
  );

  return firestoreData;
}

class VotesRecordDocumentEquality implements Equality<VotesRecord> {
  const VotesRecordDocumentEquality();

  @override
  bool equals(VotesRecord? e1, VotesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.eventId == e2?.eventId &&
        e1?.score == e2?.score &&
        e1?.eventParticipantId == e2?.eventParticipantId;
  }

  @override
  int hash(VotesRecord? e) => const ListEquality()
      .hash([e?.userId, e?.eventId, e?.score, e?.eventParticipantId]);

  @override
  bool isValidKey(Object? o) => o is VotesRecord;
}
