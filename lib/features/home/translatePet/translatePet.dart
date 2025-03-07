import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class TranslatePet extends StatefulWidget {
  @override
  _TranslatePetState createState() => _TranslatePetState();
}

class _TranslatePetState extends State<TranslatePet> {
  File? _image;
  File? _resultImage;
  bool _isLoading = false;
  String? _errorMessage;
  List<Map<String, dynamic>> _detectedResults = [];

  final String _apiUrl = 'https://sonwt34-pawrenting-ml.hf.space/predict/';

  Future<void> _pickImage(ImageSource source) async {
    if (_isLoading) return;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _resultImage = null;
        _errorMessage = null;
        _detectedResults.clear();
      });
      _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _detectedResults.clear();
    });

    try {
      var request = http.MultipartRequest('POST', Uri.parse(_apiUrl));
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        _image!.path,
        contentType:
            MediaType.parse(lookupMimeType(_image!.path) ?? 'image/jpeg'),
      ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print("Response Headers: ${response.headers}");

      if (response.statusCode == 200) {
        String? contentType = response.headers['content-type'];

        if (contentType != null && contentType.contains('image')) {
          Uint8List imageBytes = response.bodyBytes;
          File tempFile =
              File('${(await getTemporaryDirectory()).path}/result.png');
          await tempFile.writeAsBytes(imageBytes);

          // ✅ Ambil JSON dari "x-detected-results"
          var detectedResultsHeader = response.headers['x-detected-results'];
          if (detectedResultsHeader != null &&
              detectedResultsHeader.isNotEmpty) {
            print("Raw Detected Results Header: $detectedResultsHeader");
            try {
              // 🔄 Perbaiki format JSON sebelum decoding
              String fixedJson = fixJsonString(detectedResultsHeader);
              List<dynamic> detectedResults = jsonDecode(fixedJson);

              setState(() {
                _detectedResults = detectedResults.map((item) {
                  return {
                    "animal": item["animal"],
                    "emotion": item["emotion"],
                    "emotion_confidence":
                        (item["emotion_confidence"] as num).toDouble()
                  };
                }).toList();
              });

              print("Parsed Detected Results: $_detectedResults");
            } catch (e) {
              print("❌ Error parsing x-detected-results: $e");
              setState(() {
                _errorMessage = "Gagal membaca hasil deteksi.";
              });
            }
          } else {
            setState(() {
              _errorMessage = "⚠️ Tidak ada hasil deteksi yang diterima.";
            });
          }

          setState(() {
            _resultImage = tempFile;
          });
        } else {
          throw Exception("Unknown response format!");
        }
      } else {
        throw Exception(
            "Gagal memproses gambar. Status: ${response.statusCode}");
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Error: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// ✅ Fungsi untuk memperbaiki format JSON yang mungkin memiliki kutip tunggal
  String fixJsonString(String jsonString) {
    return jsonString
        .replaceAll("'", "\"") // Mengubah kutip tunggal ke kutip ganda
        .replaceAll("None", "null"); // Jika ada None, ubah ke null
  }

  Widget _buildLoading() {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          child: Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
        const SizedBox(height: 10),
        Text("Memproses gambar...",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildDetectionResults() {
    // Tampilkan pesan hanya jika gambar sudah diproses dan hasilnya kosong
    if (_image != null && !_isLoading && _detectedResults.isEmpty) {
      return Text("⚠️ Tidak ada hasil deteksi!",
          style: TextStyle(color: Colors.red));
    }

    if (_detectedResults.isEmpty)
      return SizedBox(); // Jangan tampilkan apa pun sebelum deteksi

    return Column(
      children: _detectedResults.map((result) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            title: Text("Hewan: ${result['animal'] ?? 'Unknown'}"),
            subtitle: Text(
              "Emosi: ${result['emotion'] ?? 'Unknown'} "
              "(Confidence: ${(result['emotion_confidence'] ?? 0) * 100}%)",
              style: TextStyle(fontFamily: 'AlbertSans', fontSize: 16),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _resetPage() {
    setState(() {
      _image = null;
      _resultImage = null;
      _isLoading = false;
      _errorMessage = null;
      _detectedResults.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/login/wallpaper-login.png"), // Replace with your wallpaper path
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
        ),
        child: Scaffold(
          backgroundColor:
              Colors.transparent, // Make scaffold transparent to show wallpaper
          appBar: TAppBar2(
              title: 'Translate Pet', subtitle: 'Detect your pet\'s emotion'),
          bottomNavigationBar: InsideNavBar(
              controller: controller, navcontroller: navcontroller),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_image != null) ...[
                    SizedBox(height: 5),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(_image!,
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.contain),
                      ),
                    ),
                  ],
                  if (!_isLoading && _image == null) ...[
                    Center(
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        color: Colors.white, // Semi-transparent
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Pilih Gambar",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: TColors.lightPurple)),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () =>
                                        _pickImage(ImageSource.gallery),
                                    icon:
                                        Icon(Icons.image, color: Colors.white),
                                    label: Text("Dari Galeri",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: TColors.lightPurple,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton.icon(
                                    onPressed: () =>
                                        _pickImage(ImageSource.camera),
                                    icon: Icon(Icons.camera_alt,
                                        color: Colors.white),
                                    label: Text("Ambil Foto",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: TColors.lightPurple,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                  if (_isLoading) ...[
                    const SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(color: TColors.lightPurple),
                          const SizedBox(height: 10),
                          Text("Sedang memproses...",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueAccent)),
                        ],
                      ),
                    ),
                  ],
                  if (_resultImage != null) ...[
                    SizedBox(height: 20),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(_resultImage!,
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.contain),
                      ),
                    ),
                  ],
                  SizedBox(height: 20),
                  Center(child: _buildDetectionResults()),
                  if (_resultImage != null) ...[
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.lightPurple,
                        ),
                        onPressed: _resetPage,
                        child: Text(
                          "Terjemahkan Lagi",
                          style: TextStyle(
                              fontFamily: 'AlbertSans',
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
