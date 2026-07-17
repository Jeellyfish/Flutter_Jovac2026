// import "package:flutter/material.dart";
// import 'package:google_fonts/google_fonts.dart';


// class FontDemo extends StatelessWidget {
//   const FontDemo({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Custom Font Demo"),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               Center(
//                 child: Text(
//                   "I recommend creating one widget that demonstrates multiple Google Fonts instead of showing only one font. This helps students compare different font styles in a single screen.",
//                   style: TextStyle(
//                     fontFamily: "MyFont1",
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20,),
//               Divider(),
//               SizedBox(height: 20,),
//               Text("The Google Fonts package allows you to use hundreds of fonts from the Google Fonts library in your Flutter app without manually downloading font files.",
//               style: GoogleFonts.robotoFlex(
//                 fontSize: 24
//               ),
//               )

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }