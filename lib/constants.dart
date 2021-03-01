import 'package:firebase_auth/firebase_auth.dart';

User user;
bool roundedQr = true;

/// will display logo with qr
bool qrWithLogo = true;

String durationString(Duration d) {
  return (d.inSeconds > 60)
      ? (d.inMinutes > 60)
          ? (d.inHours > 24)
              ? (d.inDays > 30)
                  ? '${(d.inDays) ~/ 30} months'
                  : '${d.inDays} days'
              : '${d.inHours} hrs'
          : '${d.inMinutes} mins'
      : '${d.inSeconds} secs';
}
