// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';

// class FilePickerWidget extends StatefulWidget {
//   const FilePickerWidget({super.key});

//   @override
//   State<FilePickerWidget> createState() => _FilePickerWidgetState();
// }

// class _FilePickerWidgetState extends State<FilePickerWidget> {
//   String fileName = "No File Selected";
//   String filePath = "";
//   int fileSize = 0;

//   //----------------------------------------
//   // Pick File
//   //----------------------------------------

//   Future<void> pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();

//     if (result != null) {
//       PlatformFile file = result.files.first;

//       setState(() {
//         fileName = file.name;

//         filePath = file.path ?? "";

//         fileSize = file.size;
//       });

//       print("File Name : $fileName");
//       print("File Path : $filePath");
//       print("File Size : $fileSize Bytes");
//     } else {
//       print("User Cancelled File Picker");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("File Picker"),

//         backgroundColor: Colors.blue,

//         foregroundColor: Colors.white,
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(20),

//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,

//           children: [
//             ElevatedButton.icon(
//               onPressed: pickFile,

//               icon: const Icon(Icons.upload_file),

//               label: const Text("Choose File"),
//             ),

//             const SizedBox(height: 25),

//             Text(
//               "File Name",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),

//             Text(fileName),

//             const SizedBox(height: 20),

//             Text(
//               "File Size",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),

//             Text("$fileSize Bytes"),

//             const SizedBox(height: 20),

//             Text(
//               "File Path",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),

//             Text(filePath),
//           ],
//         ),
//       ),
//     );
//   }
// }