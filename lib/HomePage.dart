// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:translator/translator.dart';
// import 'main.dart'; // Ensure the import path is correct
// import 'translator.dart';
//
// class Homepage extends StatefulWidget {
//   const Homepage({super.key});
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//   bool isCameraActive = false;
//   CameraController? cameraController;
//
//   // // languages
//   final translator = LanguageTranslator();
//   var languages = LanguageTranslator.languageCodes.keys.toList();
//   var selectedLanguage = 'English';
//   var translatedText = "Press the camera icon to begin";
//
//   // Translate function
//   Future<void> _translateText(String text, String language) async {
//     String? languageCode = LanguageTranslator.languageCodes[language];
//     if (languageCode != null) {
//       String translated =
//           await translator.translateToLanguage(text, languageCode);
//       setState(() {
//         translatedText = translated;
//       });
//     }
//   }
//
//   // List<String> languages = ["Hindi", "English", "Marathi"];
//   // String originLang = 'English';
//   // var destinationLang = 'to';
//   // String output = '';
//   // void translate ( String dest , String input ) async{
//   //   GoogleTranslator translator = new GoogleTranslator();
//   //   var translation = await translator.translate(input, from : 'en', to: dest);
//   //   setState(() {
//   //     output = translation.text.toString();
//   //   });
//   // }
//   // String getLanguageCode(String lang) {
//   //   switch (lang) {
//   //     case 'English':
//   //       return 'en';
//   //     case 'Hindi':
//   //       return 'hi';
//   //     default:
//   //       return 'en';
//   //   }
//   // }
//
//   @override
//   void dispose() {
//     cameraController?.dispose();
//     super.dispose();
//   }
//
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (!isCameraActive) {
//       return;
//     }
//     if (state == AppLifecycleState.inactive ||
//         state == AppLifecycleState.paused) {
//       cameraController?.stopImageStream();
//       cameraController?.dispose();
//     } else if (state == AppLifecycleState.resumed) {
//       toggleCamera();
//     }
//   }
//
//   // Toggle camera preview on/off
//   Future<void> toggleCamera() async {
//     if (isCameraActive) {
//       await cameraController?.dispose();
//       setState(() {
//         isCameraActive = false;
//       });
//     } else {
//       cameraController = CameraController(cameras[0], ResolutionPreset.high);
//
//       try {
//         await cameraController?.initialize();
//         setState(() {
//           isCameraActive = true;
//         });
//         cameraController?.startImageStream((imageFromStream) {
//           // Handle the camera stream if needed
//         });
//       } catch (e) {
//         print('Error initializing camera: $e');
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final fheight = MediaQuery.of(context).size.height;
//     final fwidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Camera preview or empty container if the camera is not active
//           Positioned(
//             top: 0,
//             left: 0,
//             child: Container(
//               height: fheight * 0.85,
//               width: fwidth,
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: isCameraActive
//                   ? AspectRatio(
//                       aspectRatio: cameraController!.value.aspectRatio,
//                       child: CameraPreview(cameraController!),
//                     )
//                   : Container(), // Empty container if camera is not active
//             ),
//           ),
//
//           // Display welcome text when the camera is not active
//           if (!isCameraActive)
//             Positioned(
//               top: fheight * 0.35,
//               left: fwidth * 0.2,
//               child: const Center(
//                 child: Text(
//                   "Welcome to \n ISL-Connect",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'Sansita',
//                     fontSize: 38,
//                     fontWeight: FontWeight.w900,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//
//           // Instruction text when the camera is not active
//           if (!isCameraActive)
//             Positioned(
//               top: fheight * 0.5,
//               left: fwidth * 0.2,
//               child: const Center(
//                 child: Text(
//                   "Where we help you to explore \n the world at ease",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'Sansita',
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           // translate icon
//           if (!isCameraActive)
//             Positioned(
//                 top: 20,
//                 right: 5,
//                 child: Row(
//                   children: [
//                     SizedBox(width: 10), // Space between the icon and dropdown
//                     // DropdownButton<String>(
//                     //   focusColor: Colors.white,
//                     //   iconEnabledColor: Colors.white,
//                     //   value: originLang, // This should be the current selected language
//                     //   icon: const Icon(Icons.arrow_drop_down),
//                     //   hint: Text(
//                     //     originLang, style: TextStyle(color: Colors.white),
//                     //   ), // Dropdown icon
//                     //   items: languages.map((String language) {
//                     //     return DropdownMenuItem<String>(
//                     //       value: language,
//                     //       child: Text(language,),
//                     //     );
//                     //   }).toList(),
//                     //   onChanged: (String? newValue) {
//                     //     setState(() {
//                     //       destinationLang = newValue!;
//                     //       translate('hi', "hello");
//                     //     });
//                     //   },
//                     // ),
//                     // Dropdown for language selection
//                     DropdownButton<String>(
//                       value: selectedLanguage,
//                       icon: const Icon(Icons.arrow_drop_down),
//                       iconSize: 24,
//                       elevation: 16,
//                       dropdownColor: Colors.blue,
//                       style: const TextStyle(color: Colors.black),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedLanguage = newValue!;
//                           _translateText("Press the camera icon to begin",
//                               selectedLanguage);
//                         });
//                       },
//                       items: languages
//                           .map<DropdownMenuItem<String>>((String language) {
//                         return DropdownMenuItem<String>(
//                           value: language,
//                           child: Text(language),
//                         );
//                       }).toList(),
//                     ),
//                   ],
//                 )),
//           // result section
//           Positioned(
//             top: fheight * 0.78,
//             left: 0,
//             child: Container(
//                 height: fheight * 0.25,
//                 width: fwidth,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(25),
//                       topLeft: Radius.circular(25)),
//                 ),
//                 child: Center(
//                   child: Text(
//                     translatedText,
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 )),
//           ),
//           // Camera icon button to toggle the camera
//           Positioned(
//             bottom: fheight * 0.15,
//             left: fwidth * 0.35,
//             child: IconButton(
//               onPressed: toggleCamera,
//               icon: Container(
//                 height: 100,
//                 width: 100,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black26, // Semi-transparent shadow
//                       blurRadius: 10,
//                       spreadRadius: 2,
//                       offset: Offset(0, 4), // Vertical offset for shadow
//                     ),
//                   ],
//                 ),
//                 child: const Icon(
//                   Icons.camera_alt_rounded, // Camera icon
//                   color: Colors.black, // Icon color
//                   size: 40.0, // Size of the icon
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'main.dart'; // Ensure the import path is correct
import 'translator.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isCameraActive = false;
  CameraController? cameraController;

  // Languages and translator setup
  final translator = LanguageTranslator();
  var languages = LanguageTranslator.languageCodes.keys.toList();
  var selectedLanguage = 'English'; // Ensure this exists in `languages`
  var translatedText = "Press the camera icon to begin and to start exploring the world. what else are you waiting for ?";

  // Translate function
  Future<void> _translateText(String text, String language) async {
    String? languageCode = LanguageTranslator.languageCodes[language];
    if (languageCode != null) {
      String translated =
      await translator.translateToLanguage(text, languageCode);
      setState(() {
        translatedText = translated;
      });
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!isCameraActive) {
      return;
    }
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      cameraController?.stopImageStream();
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      toggleCamera();
    }
  }

  // Toggle camera preview on/off
  Future<void> toggleCamera() async {
    if (isCameraActive) {
      await cameraController?.dispose();
      setState(() {
        isCameraActive = false;
      });
    } else {
      cameraController = CameraController(cameras[0], ResolutionPreset.high);

      try {
        await cameraController?.initialize();
        setState(() {
          isCameraActive = true;
        });
        cameraController?.startImageStream((imageFromStream) {
          // Handle the camera stream if needed
        });
      } catch (e) {
        print('Error initializing camera: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final fheight = MediaQuery.of(context).size.height;
    final fwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Camera preview or empty container if the camera is not active
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: fheight * 0.85,
              width: fwidth,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: isCameraActive
                  ? AspectRatio(
                aspectRatio: cameraController!.value.aspectRatio,
                child: CameraPreview(cameraController!),
              )
                  : Container(), // Empty container if camera is not active
            ),
          ),

          // Display welcome text when the camera is not active
          if (!isCameraActive)
            Positioned(
              top: fheight * 0.35,
              left: fwidth * 0.2,
              child: const Center(
                child: Text(
                  "Welcome to \n ISL-Connect",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Sansita',
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          // Instruction text when the camera is not active
          if (!isCameraActive)
            Positioned(
              top: fheight * 0.5,
              left: fwidth * 0.2,
              child: const Center(
                child: Text(
                  "Where we help you to explore \n the world at ease",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Sansita',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          // Translate icon and dropdown
          if (!isCameraActive)
            Positioned(
              top: 20,
              right: 5,
              child: Row(
                children: [
                  const SizedBox(width: 10), // Space between the icon and dropdown
                  // Dropdown for language selection
                  DropdownButton<String>(
                    value: selectedLanguage,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    dropdownColor: Colors.white,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLanguage = newValue!;
                        _translateText( translatedText, selectedLanguage);
                      });
                    },
                    items: languages
                        .map<DropdownMenuItem<String>>((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

          // Result section
          Positioned(
            top: fheight * 0.78,
            left: 0,
            child: Container(
              height: fheight * 0.25,
              width: fwidth,
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
              child: Center(
                child: Text(
                  translatedText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),

          // Camera icon button to toggle the camera
          Positioned(
            bottom: fheight * 0.15,
            left: fwidth * 0.35,
            child: IconButton(
              onPressed: toggleCamera,
              icon: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26, // Semi-transparent shadow
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 4), // Vertical offset for shadow
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.camera_alt_rounded, // Camera icon
                  color: Colors.black, // Icon color
                  size: 40.0, // Size of the icon
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
