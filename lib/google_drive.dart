//
// import 'dart:io';
// import 'package:driveupload/secure_storage.dart';
// import 'package:googleapis/drive/v3.dart' as ga;
// import 'package:googleapis_auth/auth.dart';
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart' as p;
// import 'package:url_launcher/url_launcher.dart';
//
//
//
// const _clientId = "8649007811-jcfhjtcnc3cre771sncp4ub7bkl5crkb.apps.googleusercontent.com";
// const _clientSecret = "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";
// const _scopes = [ga.DriveApi.driveFileScope];
//
// class GoogleDrive {
//   final storage = SecureStorage();
//   //Get Authenticated Http Client
//   Future<http.Client> getHttpClient() async {
//     //Get Credentials
//     var credentials = await storage.getCredentials();
//     if (credentials == null) {
//       //Needs user authentication
//       var authClient = await clientViaUserConsent(
//           ClientId(_clientId, _clientSecret), _scopes, (url) {
//         //Open Url in Browser
//         launch(url);
//       });
//       //Save Credentials
//       await storage.saveCredentials(
//         authClient.credentials.accessToken,
//         authClient.credentials.refreshToken ?? '',
//       );
//       return authClient;
//     } else {
//       print(credentials["expiry"]);
//       //Already authenticated
//       return authenticatedClient(
//         http.Client(),
//         AccessCredentials(
//           AccessToken(
//             credentials["type"],
//             credentials["data"],
//             DateTime.tryParse(credentials["expiry"]) ?? DateTime.now(),
//           ),
//           credentials["refreshToken"],
//           _scopes,
//         ),
//       );
//
//     }
//   }
//
//   //Upload File
//   Future upload(File file) async {
//     var client = await getHttpClient();
//     var drive = ga.DriveApi(client);
//     print("Uploading file");
//     var response = await drive.files.create(
//         ga.File()..name = p.basename(file.absolute.path),
//         uploadMedia: ga.Media(file.openRead(), file.lengthSync()));
//
//     print("Result ${response.toJson()}");
//   }
// }


// const String googleDriveClientId = "8649007811-jcfhjtcnc3cre771sncp4ub7bkl5crkb.apps.googleusercontent.com";
// const String googleDriveClientSecret = "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";
// const String googleDriveProjectId = "driveuploading-406406";
// const String googleDriveAuthUri = "https://accounts.google.com/o/oauth2/auth";
// const String googleDriveTokenUri = "https://oauth2.googleapis.com/token";
// const String googleDriveAuthProviderX509CertUrl = "https://www.googleapis.com/oauth2/v1/certs";





import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign-In Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: _handleSignIn,
                child: Text('Sign in with Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      print(googleUser);
    } catch (error) {
      print(error);
    }
  }
}
