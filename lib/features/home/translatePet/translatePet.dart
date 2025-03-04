import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:http_parser/http_parser.dart';

class TranslatePetPage extends StatefulWidget {
  @override
  _TranslatePetPageState createState() => _TranslatePetPageState();
}

class _TranslatePetPageState extends State<TranslatePetPage> {
  File? _image;
  bool _isLoading = false;
  File? _resultImage;
  String? _errorMessage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return;

    setState(() {
      _image = File(pickedFile.path);
      _errorMessage = null;
    });
    await _uploadImage();
  }

  Future<void> _uploadImage() async {
  if (_image == null) return;

  setState(() {
    _isLoading = true;
    _errorMessage = null;
  });

  try {
    var response = await _sendRequest('https://sonwt34-pawrenting-ml.hf.space/predict');

    if (response == null) {
      setState(() {
        _errorMessage = "Failed to process the image.";
      });
    }
  } catch (e) {
    setState(() {
      _errorMessage = "Upload error: $e";
    });
  }

  setState(() {
    _isLoading = false;
  });
}

Future<http.StreamedResponse?> _sendRequest(String url) async {
  try {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        _image!.path,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    var response = await request.send();

    print("Response status: ${response.statusCode}");
    print("Response headers: ${response.headers}");

    if (response.statusCode == 200) {
      var responseBody = await response.stream.toBytes();
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/result.png';
      final file = File(filePath);
      await file.writeAsBytes(responseBody);

      setState(() {
        _resultImage = file;
      });
      return response;
    } else if (response.statusCode == 307) {
      final newUrl = response.headers['location'];
      if (newUrl != null) {
        print("Redirecting to: $newUrl");
        return await _sendRequest(newUrl);
      } else {
        setState(() {
          _errorMessage = "Redirect detected but no new location found.";
        });
      }
    } else {
      setState(() {
        _errorMessage = "Failed to process the image: ${response.statusCode}";
      });
    }
  } catch (e) {
    setState(() {
      _errorMessage = "Request error: $e";
    });
  }
  return null;
}

  Future<void> _handleRedirect(String newUrl) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(newUrl));
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          _image!.path,
          contentType: MediaType('image', 'jpeg'),
        ),
      );
      var response = await request.send();
      var responseBody = await response.stream.toBytes();

      if (response.statusCode == 200) {
        final directory = await getTemporaryDirectory();
        final filePath = '\${directory.path}/result.png';
        final file = File(filePath);
        await file.writeAsBytes(responseBody);

        setState(() {
          _resultImage = file;
        });
      } else {
        setState(() {
          _errorMessage = "Failed after redirect. Status: \${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Redirect error: \$e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Translate Pet')),
      body: Center(
        child: _isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Processing... Please wait.')
                ],
              )
            : _resultImage != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.file(_resultImage!),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _image = null;
                            _resultImage = null;
                          });
                        },
                        child: Text('Try Again'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _image = null;
                            _resultImage = null;
                          });
                          Navigator.pop(context);
                        },
                        child: Text('Back to Home'),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_errorMessage != null) ...[
                        Text(_errorMessage!, style: TextStyle(color: Colors.red)),
                        SizedBox(height: 10),
                      ],
                      ElevatedButton(
                        onPressed: () => _pickImage(ImageSource.gallery),
                        child: Text('Pick from Gallery'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => _pickImage(ImageSource.camera),
                        child: Text('Take a Photo'),
                      ),
                    ],
                  ),
      ),
    );
  }
}
