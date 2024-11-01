import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventParticipantsRecord extends FirestoreRecord {
  EventParticipantsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_id" field.
  DocumentReference? _eventId;
  DocumentReference? get eventId => _eventId;
  bool hasEventId() => _eventId != null;

  // "media" field.
  String? _media;
  String get media => _media ?? '';
  bool hasMedia() => _media != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "instagram_url" field.
  String? _instagramUrl;
  String get instagramUrl => _instagramUrl ?? '';
  bool hasInstagramUrl() => _instagramUrl != null;

  // "facebook_url" field.
  String? _facebookUrl;
  String get facebookUrl => _facebookUrl ?? '';
  bool hasFacebookUrl() => _facebookUrl != null;

  // "tiktok_url" field.
  String? _tiktokUrl;
  String get tiktokUrl => _tiktokUrl ?? '';
  bool hasTiktokUrl() => _tiktokUrl != null;

  // "google_maps_url" field.
  String? _googleMapsUrl;
  String get googleMapsUrl => _googleMapsUrl ?? '';
  bool hasGoogleMapsUrl() => _googleMapsUrl != null;

  void _initializeFields() {
    _eventId = snapshotData['event_id'] as DocumentReference?;
    _media = snapshotData['media'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _instagramUrl = snapshotData['instagram_url'] as String?;
    _facebookUrl = snapshotData['facebook_url'] as String?;
    _tiktokUrl = snapshotData['tiktok_url'] as String?;
    _googleMapsUrl = snapshotData['google_maps_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event_participants');

  static Stream<EventParticipantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventParticipantsRecord.fromSnapshot(s));

  static Future<EventParticipantsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EventParticipantsRecord.fromSnapshot(s));

  static EventParticipantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventParticipantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventParticipantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventParticipantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventParticipantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventParticipantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventParticipantsRecordData({
  DocumentReference? eventId,
  String? media,
  String? title,
  String? description,
  String? instagramUrl,
  String? facebookUrl,
  String? tiktokUrl,
  String? googleMapsUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_id': eventId,
      'media': media,
      'title': title,
      'description': description,
      'instagram_url': instagramUrl,
      'facebook_url': facebookUrl,
      'tiktok_url': tiktokUrl,
      'google_maps_url': googleMapsUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventParticipantsRecordDocumentEquality
    implements Equality<EventParticipantsRecord> {
  const EventParticipantsRecordDocumentEquality();

  @override
  bool equals(EventParticipantsRecord? e1, EventParticipantsRecord? e2) {
    return e1?.eventId == e2?.eventId &&
        e1?.media == e2?.media &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.instagramUrl == e2?.instagramUrl &&
        e1?.facebookUrl == e2?.facebookUrl &&
        e1?.tiktokUrl == e2?.tiktokUrl &&
        e1?.googleMapsUrl == e2?.googleMapsUrl;
  }

  @override
  int hash(EventParticipantsRecord? e) => const ListEquality().hash([
        e?.eventId,
        e?.media,
        e?.title,
        e?.description,
        e?.instagramUrl,
        e?.facebookUrl,
        e?.tiktokUrl,
        e?.googleMapsUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is EventParticipantsRecord;
}
