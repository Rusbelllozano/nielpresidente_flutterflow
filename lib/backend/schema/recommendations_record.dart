import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecommendationsRecord extends FirestoreRecord {
  RecommendationsRecord._(
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

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "instagram_url" field.
  String? _instagramUrl;
  String get instagramUrl => _instagramUrl ?? '';
  bool hasInstagramUrl() => _instagramUrl != null;

  // "google_maps_url" field.
  String? _googleMapsUrl;
  String get googleMapsUrl => _googleMapsUrl ?? '';
  bool hasGoogleMapsUrl() => _googleMapsUrl != null;

  // "menu_url" field.
  String? _menuUrl;
  String get menuUrl => _menuUrl ?? '';
  bool hasMenuUrl() => _menuUrl != null;

  // "facebook_url" field.
  String? _facebookUrl;
  String get facebookUrl => _facebookUrl ?? '';
  bool hasFacebookUrl() => _facebookUrl != null;

  // "tiktok_url" field.
  String? _tiktokUrl;
  String get tiktokUrl => _tiktokUrl ?? '';
  bool hasTiktokUrl() => _tiktokUrl != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _thumbnail = snapshotData['thumbnail'] as String?;
    _video = snapshotData['video'] as String?;
    _description = snapshotData['description'] as String?;
    _instagramUrl = snapshotData['instagram_url'] as String?;
    _googleMapsUrl = snapshotData['google_maps_url'] as String?;
    _menuUrl = snapshotData['menu_url'] as String?;
    _facebookUrl = snapshotData['facebook_url'] as String?;
    _tiktokUrl = snapshotData['tiktok_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recommendations');

  static Stream<RecommendationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecommendationsRecord.fromSnapshot(s));

  static Future<RecommendationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecommendationsRecord.fromSnapshot(s));

  static RecommendationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecommendationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecommendationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecommendationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecommendationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecommendationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecommendationsRecordData({
  String? title,
  String? thumbnail,
  String? video,
  String? description,
  String? instagramUrl,
  String? googleMapsUrl,
  String? menuUrl,
  String? facebookUrl,
  String? tiktokUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'thumbnail': thumbnail,
      'video': video,
      'description': description,
      'instagram_url': instagramUrl,
      'google_maps_url': googleMapsUrl,
      'menu_url': menuUrl,
      'facebook_url': facebookUrl,
      'tiktok_url': tiktokUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecommendationsRecordDocumentEquality
    implements Equality<RecommendationsRecord> {
  const RecommendationsRecordDocumentEquality();

  @override
  bool equals(RecommendationsRecord? e1, RecommendationsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.thumbnail == e2?.thumbnail &&
        e1?.video == e2?.video &&
        e1?.description == e2?.description &&
        e1?.instagramUrl == e2?.instagramUrl &&
        e1?.googleMapsUrl == e2?.googleMapsUrl &&
        e1?.menuUrl == e2?.menuUrl &&
        e1?.facebookUrl == e2?.facebookUrl &&
        e1?.tiktokUrl == e2?.tiktokUrl;
  }

  @override
  int hash(RecommendationsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.thumbnail,
        e?.video,
        e?.description,
        e?.instagramUrl,
        e?.googleMapsUrl,
        e?.menuUrl,
        e?.facebookUrl,
        e?.tiktokUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is RecommendationsRecord;
}
