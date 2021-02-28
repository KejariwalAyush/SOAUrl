import 'package:firebase_auth/firebase_auth.dart';

User user;

String durationString(Duration d) {
  return (d.inSeconds > 60)
      ? (d.inMinutes > 60)
          ? (d.inHours > 24)
              ? '${d.inDays} days'
              : '${d.inHours} hrs'
          : '${d.inMinutes} mins'
      : '${d.inSeconds} secs';
}
