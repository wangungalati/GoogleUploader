//brings up dialogue

// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:driveupload/google_drive.dart';
// import 'package:googledrivehandler/googledrivehandler.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Drive',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final drive = GoogleDrive();
//
//   Future getFileFromGoogleDrive() async {
//     File? file;
//     GoogleDriveHandler().setAPIKey(apiKey: "AIzaSyCY5a-_7AD0MQ_ftaFb10-XvvP4dMBpeYU");
//     File? myFile = await GoogleDriveHandler().getFileFromGoogleDrive(context: context);
//     if (myFile != null) {
//       // Do something with the file
//     } else {
//       // Discard...
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Drive Demo"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: const Text("UPLOAD"),
//               onPressed: () async {
//                 await getFileFromGoogleDrive();
//                 var file = await FilePicker.platform.pickFiles();
//                 print(":: file::main.dart::value:: $file");
//                 await drive.upload(File(file!.files.single.path!));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


//picker then redirect
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:driveupload/google_drive.dart';
// import 'package:googledrivehandler/googledrivehandler.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Drive',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final drive = GoogleDrive();
//
//   Future getFileFromGoogleDrive() async {
//     GoogleDriveHandler().setAPIKey(apiKey: "AIzaSyCY5a-_7AD0MQ_ftaFb10-XvvP4dMBpeYU");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Drive Demo"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: const Text("UPLOAD"),
//               onPressed: () async {
//                 await getFileFromGoogleDrive();
//                 FilePickerResult? result = await FilePicker.platform.pickFiles();
//                 if (result != null) {
//                   var file = result.files.single;
//                   await drive.upload(File(file.path!));
//                 } else {
//                   // User canceled the file picking
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



//sign in into a google account then pic file

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:googleapis/drive/v3.dart' as ga;
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:http/http.dart' as http;
//
// const String CLIENT_ID = '8649007811-jcfhjtcnc3cre771sncp4ub7bkl5crkb.apps.googleusercontent.com';
// const String CLIENT_SECRET = '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';
// const String REDIRECT_URI = 'https://developers.google.com/oauthplayground';
//
// const String REFRESH_TOKEN = '1//04pGd1aUBU0ztCgYIARAAGAQSNwF-L9IrLu3-AJoZZ1WgtfELwIHc6cwK3LnVfUJ6qvGpGqCHFIKmTHovQa115qUntmQpAX1UdEM';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Drive',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['https://www.googleapis.com/auth/drive.file']);
//   final ga.DriveApi _drive = ga.DriveApi(http.Client());
//
//   GoogleSignInAccount? _googleSignInAccount;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Drive"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: Text("UPLOAD"),
//               onPressed: () async {
//                 await _signIn();
//                 await _uploadFile();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _signIn() async {
//     try {
//       _googleSignInAccount = await _googleSignIn.signIn();
//     } catch (error) {
//       print("Error signing in: $error");
//     }
//   }
//
//   _uploadFileToGoogleDrive() async {
//     try {
//       var client = GoogleHttpClient(await googleSignInAccount.authHeaders);
//       var drive = ga.DriveApi(client);
//       ga.File fileToUpload = ga.File();
//
//       FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//       if (result != null && result.files.isNotEmpty) {
//         final file = result.files.first;
//
//         fileToUpload.parents = ["appDataFolder"];
//         fileToUpload.name = path.basename(file.name!);
//
//         var response = await drive.files.create(
//           fileToUpload,
//           uploadMedia: ga.Media(file.readByteStream(), file.size),
//         );
//
//         print("File uploaded successfully! Path: ${file.name}");
//         _listGoogleDriveFiles();
//       } else {
//         // User canceled the file picking
//         print("File upload canceled.");
//       }
//     } catch (error) {
//       print("Error uploading file: $error");
//     }
//   }
//
// }






//show available accounts on device for google
// import 'dart:async';
// import 'dart:io';
//
// import 'package:account_picker/account_picker.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late String _email = ""; // Initialize with an empty string
//   late String _accountType = ""; // Initialize with an empty string
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Text('Running on: ${Platform.operatingSystem}\n'),
//               Text('Email: $_email'),
//               Text('Email Type: $_accountType'),
//               ElevatedButton(
//                 onPressed: () async {
//                   final EmailResult? emailResult =
//                   await AccountPicker.emailHint();
//                   print(emailResult);
//                   setState(() {
//                     _email = emailResult?.email ?? ""; // Use the null-aware operator
//                     _accountType = emailResult?.type ?? ""; // Use the null-aware operator
//                   });
//                 },
//                 child: Text('Pick Email'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




// code takes you to google drive app after selecting account
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final String googleDriveUrl =
//       'https://drive.google.com'; // Replace with your Google Drive URL
//
//   Future<void> _handleSignIn() async {
//     if (await canLaunch(googleDriveUrl)) {
//       await launch(googleDriveUrl);
//     } else {
//       throw 'Could not launch $googleDriveUrl';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Google Drive Example'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Image.asset(
//                 'images/drive.png', // Adjust the path based on your project structure
//                 height: 100.0, // Set the height of the image
//               ),
//               ElevatedButton(
//                 onPressed: _handleSignIn,
//                 child: Text('Open Google Drive'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// this code uploads file.json and folders to google drive
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:save_in_cloud/save_in_cloud.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   Map content = {
//     "Map": {},
//     "String": "string",
//     "int": 0,
//     "bool": true,
//     "List": []
//   };
//   Map newContent = {
//     "Map": {},
//     "String": "string",
//     "int": 0,
//     "bool": true,
//     "List": ["updated"]
//   };
//   String filename = "file";
//   String folderName = "Folder";
//   String description = "This is a description of the folder";
//   String apiKey = "AIzaSyDHptX7iaQvK4Ot59H_O5xl8R6JPOzdFy8"; // todo: insert the API key here
//
//   /// Sign in Google with scope: https://www.googleapis.com/auth/drive.file
//   /// For more information: https://developers.google.com/identity/protocols/oauth2/scopes?hl=en#drive
//   void _signIn() async {
//     bool signIn = await GoogleDriveWrite.signIn();
//
//     if (signIn) {
//       log("User has logged in", name: "Sign in");
//     } else {
//       log("User has not logged in", name: "Sign in");
//     }
//   }
//
//   /// Sign out
//   void _signOut() async {
//     await GoogleDriveWrite.signOut();
//     log("User has logged out", name: "Sign out");
//   }
//
//   /// Create a JSON file
//   void _createJsonFile() async {
//     int? createJsonFileCode = await GoogleDriveWrite.createJsonFile(
//         filename: filename, content: content);
//
//     if (createJsonFileCode == 1) {
//       log("User has not logged in", name: "_createJsonFile()");
//     } else if (createJsonFileCode == 2) {
//       log("Error while creating the empty file.", name: "_createJsonFile()");
//     } else if (createJsonFileCode == 3) {
//       log("Error uploading file.", name: "_createJsonFile()");
//     } else {
//       log("File created successfully.", name: "_createJsonFile()");
//     }
//   }
//
//   /// Create a folder without description
//   void _createFolder() async {
//     bool createFolder =
//     await GoogleDriveWrite.createFolder(folderName: folderName);
//
//     if (createFolder) {
//       log("Folder created successfully.", name: "_createFolder()");
//     } else {
//       log("The user hasn't logged in.", name: "_createFolder()");
//     }
//   }
//
//   /// Create a folder with description
//   void _createFolderWithDescription() async {
//     bool createFolder = await GoogleDriveWrite.createFolder(
//         folderName: folderName, description: description);
//
//     if (createFolder) {
//       log("Folder created successfully.",
//           name: "_createFolderWithDescription()");
//     } else {
//       log("The user hasn't logged in.", name: "_createFolderWithDescription()");
//     }
//   }
//
//   /// Updating an existing file
//   void _updateJsonFile() async {
//     int? updateJsonFileCode = await GoogleDriveWrite.updateJsonFile(
//         filename: filename, content: newContent);
//
//     if (updateJsonFileCode == 1) {
//       log("The user hasn't logged in.", name: "_updateJsonFile()");
//     } else if (updateJsonFileCode == 2) {
//       log("Error in connection with HTTP.", name: "_updateJsonFile()");
//       log("https://developers.google.com/drive/api/guides/handle-errors?hl=en#status-codes",
//           name: "Error code guide");
//     } else if (updateJsonFileCode == 3) {
//       log("File was not found.", name: "_updateJsonFile()");
//     } else if (updateJsonFileCode == 4) {
//       log("File creation failed.", name: "_updateJsonFile()");
//       log("https://developers.google.com/drive/api/guides/handle-errors?hl=en#status-codes",
//           name: "Error code guide");
//     } else {
//       log("File updated successfully.", name: "_updateJsonFile()");
//     }
//   }
//
//   /// Create a JSON file in an existing folder
//   void _createJsonFileInFolder() async {
//     int createJsonFileInFolderCode =
//     await GoogleDriveWrite.createJsonFileInFolder(
//         folderName: folderName, filename: filename, content: content);
//
//     if (createJsonFileInFolderCode == 1) {
//       log("The user hasn't logged in.", name: "_createJsonFileInFolder()");
//     } else if (createJsonFileInFolderCode == 2) {
//       log("Error in connection with HTTP.", name: "_createJsonFileInFolder()");
//       log("https://developers.google.com/drive/api/guides/handle-errors?hl=en#status-codes",
//           name: "Error code guide");
//     } else {
//       log("File created successfully.", name: "_createJsonFileInFolder()");
//     }
//   }
//
//   /// Search for a file or a folder
//   void _searchFile() async {
//     Map? searchFileMap = await GoogleDriveRead.searchFile(filename);
//
//     if (searchFileMap == null) {
//       log("The user hasn't logged in.", name: "_searchFile()");
//     } else if (searchFileMap.isEmpty) {
//       log("No file was found.", name: "_searchFile()");
//     } else if (searchFileMap.keys.toList().first == "search error") {
//       log("Search error: $searchFileMap", name: "_searchFile()");
//     } else {
//       log("File was found.\n$searchFileMap", name: "_searchFile()");
//     }
//   }
//
//   /// Download a file to: /storage/emulated/0/Android/data/com.YOUR_ORGANIZE.APP_NAME/files/downloads
//   void _downloadFile() async {
//     int downloadFileCode =
//     await GoogleDriveRead.downloadFile(filename: filename, apiKey: apiKey);
//
//     if (downloadFileCode == 1) {
//       log("The user hasn't logged in.", name: "_downloadFile()");
//     } else if (downloadFileCode == 2) {
//       log("No file was found.", name: "_downloadFile()");
//     } else {
//       log("File downloaded successfully.", name: "_downloadFile()");
//     }
//   }
//
//   /// Read JSON file local
//   void _readJsonFile() async {
//     Map? readJsonFileMap =
//     await GoogleDriveRead.readJsonFile(filename: filename, apiKey: apiKey);
//
//     if (readJsonFileMap == null) {
//       log("The user hasn't logged in.", name: "_readJsonFile()");
//     } else if (readJsonFileMap.isEmpty) {
//       log("No file found.", name: "_readJsonFile()");
//     } else {
//       log("JSON File: \n$readJsonFileMap\n", name: "_readJsonFile()");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home screen"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               child: const Text("sign in"),
//               onPressed: () => _signIn(),
//             ),
//             ElevatedButton(
//               child: const Text("sign out"),
//               onPressed: () => _signOut(),
//             ),
//             ElevatedButton(
//               child: const Text("create JSON file"),
//               onPressed: () => _createJsonFile(),
//             ),
//             ElevatedButton(
//               child: const Text("create folder"),
//               onPressed: () => _createFolder(),
//             ),
//             ElevatedButton(
//               child: const Text("create folder with description"),
//               onPressed: () => _createFolderWithDescription(),
//             ),
//             ElevatedButton(
//               child: const Text("update JSON file"),
//               onPressed: () => _updateJsonFile(),
//             ),
//             ElevatedButton(
//               child: const Text("create JSON file in folder"),
//               onPressed: () => _createJsonFileInFolder(),
//             ),
//             ElevatedButton(
//               child: const Text("search file or folder"),
//               onPressed: () => _searchFile(),
//             ),
//             ElevatedButton(
//               child: const Text("download JSON file"),
//               onPressed: () => _downloadFile(),
//             ),
//             ElevatedButton(
//               child: const Text("read JSON file"),
//               onPressed: () => _readJsonFile(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





//creates a file and a folder in json but with an extension on the file selected by user accompanied by another extension json

// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:save_in_cloud/save_in_cloud.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   String filename = "";
//   String extension = "cvs"; // Default extension
//   String folderName = "";
//   String description = "";
//
//   // Controllers for text fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//
//   // List of file extensions
//   List<String> fileExtensions = ["cvs", "xml", "pdf", "jpeg", "png"];
//
//   /// Create a JSON file
//   void _createJsonFile() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Create JSON File"),
//           content: Column(
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               DropdownButton<String>(
//                 value: extension,
//                 onChanged: (value) {
//                   setState(() {
//                     extension = value!;
//                   });
//                 },
//                 items: fileExtensions.map((ext) {
//                   return DropdownMenuItem<String>(
//                     value: ext,
//                     child: Text(ext),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 filename = nameController.text;
//                 _createJsonFileLogic();
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Logic for creating JSON file
//   void _createJsonFileLogic() async {
//     int? createJsonFileCode = await GoogleDriveWrite.createJsonFile(
//       filename: "$filename.$extension",
//       content: {
//         "Map": {},
//         "String": "string",
//         "int": 0,
//         "bool": true,
//         "List": [],
//       },
//     );
//
//     if (createJsonFileCode == 1) {
//       log("User has not logged in", name: "_createJsonFile()");
//     } else if (createJsonFileCode == 2) {
//       log("Error while creating the empty file.", name: "_createJsonFile()");
//     } else if (createJsonFileCode == 3) {
//       log("Error uploading file.", name: "_createJsonFile()");
//     } else {
//       log("File created successfully.", name: "_createJsonFile()");
//     }
//   }
//
//   /// Create a folder with description
//   void _createFolderWithDescription() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Create Folder"),
//           content: Column(
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextField(
//                 controller: descriptionController,
//                 decoration: InputDecoration(labelText: 'Description'),
//               ),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 folderName = nameController.text;
//                 description = descriptionController.text;
//                 _createFolderWithDescriptionLogic();
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Logic for creating folder with description
//   void _createFolderWithDescriptionLogic() async {
//     bool createFolder = await GoogleDriveWrite.createFolder(
//       folderName: folderName,
//       description: description,
//     );
//
//     if (createFolder) {
//       log("Folder created successfully.", name: "_createFolderWithDescription()");
//     } else {
//       log("The user hasn't logged in.", name: "_createFolderWithDescription()");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home screen"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () => _createJsonFile(),
//               child: const Text("Create JSON file"),
//             ),
//             ElevatedButton(
//               onPressed: () => _createFolderWithDescription(),
//               child: const Text("Create folder with description"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:save_in_cloud/save_in_cloud.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String filename = "";
  String extension = "cvs"; // Default extension
  String folderName = "";
  String description = "";

  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // List of file extensions
  List<String> fileExtensions = ["cvs", "xml", "pdf", "jpeg", "png"];

  /// Create a JSON file
  void _createJsonFile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Create JSON File"),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              DropdownButton<String>(
                value: extension,
                onChanged: (value) {
                  setState(() {
                    extension = value!;
                  });
                },
                items: fileExtensions.map((ext) {
                  return DropdownMenuItem<String>(
                    value: ext,
                    child: Text(ext),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                filename = nameController.text;
                _createJsonFileLogic();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Logic for creating JSON file
  void _createJsonFileLogic() async {
    int? createJsonFileCode = await GoogleDriveWrite.createJsonFile(
      filename: "$filename.$extension", // Adjusted filename format
      content: {
        "Map": {},
        "String": "string",
        "int": 0,
        "bool": true,
        "List": [],
      },
    );

    if (createJsonFileCode == 1) {
      log("User has not logged in", name: "_createJsonFile()");
    } else if (createJsonFileCode == 2) {
      log("Error while creating the empty file.", name: "_createJsonFile()");
    } else if (createJsonFileCode == 3) {
      log("Error uploading file.", name: "_createJsonFile()");
    } else {
      log("File created successfully.", name: "_createJsonFile()");
    }
  }

  /// Create a folder with description
  void _createFolderWithDescription() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Create Folder"),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                folderName = nameController.text;
                description = descriptionController.text;
                _createFolderWithDescriptionLogic();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Logic for creating folder with description
  void _createFolderWithDescriptionLogic() async {
    bool createFolder = await GoogleDriveWrite.createFolder(
      folderName: folderName,
      description: description,
    );

    if (createFolder) {
      log("Folder created successfully.", name: "_createFolderWithDescription()");
    } else {
      log("The user hasn't logged in.", name: "_createFolderWithDescription()");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('images/drive.png',
              width: 150,
              height: 150,
              fit:BoxFit.fill),
          const SizedBox(height:150),
            ElevatedButton(
              onPressed: () => _createJsonFile(),
              child: const Text("Create JSON file"),
            ),
            ElevatedButton(
              onPressed: () => _createFolderWithDescription(),
              child: const Text("Create folder with description"),
            ),
          ],
        ),
      ),
    );
  }
}



