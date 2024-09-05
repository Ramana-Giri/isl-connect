// import 'package:flutter/material.dart';
//
// class translator extends StatefulWidget {
//   const translator({super.key});
//
//   @override
//   State<translator> createState() => _translatorState();
// }
//
// class _translatorState extends State<translator> {
//   @override
//   var languages = ['Hindi', 'English', 'Marathi'];
//   var originLang = 'English';
//   var destinationLang = 'to';
//   var output = "";
//   TextEditingController languageController = TextEditingController();
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 50,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   DropdownButton<String>(
//                     focusColor: Colors.white,
//                     iconDisabledColor: Colors.white,
//                     iconEnabledColor: Colors.white,
//                     hint: Text(
//                       destinationLang, // Corrected spelling from "destinatinLang"
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     dropdownColor: Colors.white,
//                     icon: Icon(Icons.translate_outlined),
//                     items: languages.map((String dropDownStringItem) {
//                       return DropdownMenuItem<String>(
//                         // Corrected "DropdownmenuItem" to "DropdownMenuItem" and specified type
//                         child: Text(dropDownStringItem),
//                         value: dropDownStringItem,
//                       );
//                     }).toList(),
//                     onChanged: (String? value) {
//                       setState(() {
//                         destinationLang = value!;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:translator/translator.dart';

class LanguageTranslator {
  final GoogleTranslator _translator = GoogleTranslator();

  // Example language codes for Indian languages
  static const Map<String, String> languageCodes = {
    'English': 'en',
    'Hindi': 'hi',
    'Bengali': 'bn',
    'Telugu': 'te',
    'Marathi': 'mr',
    'Tamil': 'ta',
    'Urdu': 'ur',
    'Gujarati': 'gu',
    'Malayalam': 'ml',
    'Kannada': 'kn',
    'Odia': 'or',
    'Punjabi': 'pa',
    'Assamese': 'as',
    'Maithili': 'mai',
    'Santali': 'sat',
    'Kashmiri': 'ks',
    'Nepali': 'ne',
    'Konkani': 'gom',
    'Sindhi': 'sd',
    'Dogri': 'doi',
    'Meitei': 'mni',
    'Bodo': 'brx',
    'Sanskrit': 'sa',
    'Manipuri': 'mni-Mtei',
  };

  // General translate function
  Future<String> translateToLanguage(String text, String languageCode) async {
    var translation = await _translator.translate(text, to: languageCode);
    return translation.text;
  }

}

