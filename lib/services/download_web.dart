// import 'dart:convert';
// // ignore: avoid_web_libraries_in_flutter
// import 'dart:html' as html;
// import 'dart:io';

// void download(
//   File file, {
//   String downloadName,
// }) {
//   // Encode our file in base64
//   final _base64 = base64Encode(file.readAsBytesSync());
//   // Create the link with the file
//   final anchor =
//       html.AnchorElement(href: 'data:application/octet-stream;base64,$_base64')
//         ..target = 'blank';
//   // add the name
//   if (downloadName != null) {
//     anchor.download = downloadName;
//   }
//   // trigger download
//   html.document.body.append(anchor);
//   anchor.click();
//   anchor.remove();
//   return;
// }
