import 'package:flutter/material.dart';
import '../theme.dart';
import 'video_details_screen.dart';

class AddVideoScreen extends StatefulWidget {
  const AddVideoScreen({super.key});

  @override
  State<AddVideoScreen> createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  final TextEditingController _linkController =
  TextEditingController(text: "https://youtu.be/8uQh7Yp2Vn4");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: kTextDark),
            onPressed: () => Navigator.pop(context)),
        title: const Text("Add video",
            style: TextStyle(
                color: kTextDark, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("What would you\nlike to convert?",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: kTextDark,
                    height: 1.2)),
            const SizedBox(height: 12),
            const Text("Choose a video file or add a link below.",
                style: TextStyle(color: kTextLight)),
            const SizedBox(height: 32),

            // Upload Box
            Container(
              width: double.infinity,
              padding:
              const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: kBorderColor),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: kAccentColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.upload_file,
                        color: kPrimaryColor, size: 28),
                  ),
                  const SizedBox(height: 16),
                  const Text("Upload a video",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  const Text("MP4, MOV or WEBM · Up to 500 MB",
                      style: TextStyle(fontSize: 12, color: kTextLight)),
                  const SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: kBorderColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      foregroundColor: kPrimaryColor,
                    ),
                    child: const Text("Choose file"),
                  )
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Row(
              children: [
                Expanded(child: Divider(color: kBorderColor)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child:
                    Text("or", style: TextStyle(color: kTextLight))),
                Expanded(child: Divider(color: kBorderColor)),
              ],
            ),
            const SizedBox(height: 24),

            const Text("Paste a video link",
                style:
                TextStyle(fontWeight: FontWeight.w600, color: kTextDark)),
            const SizedBox(height: 12),
            TextField(
              controller: _linkController,
              decoration: InputDecoration(
                hintText: "https://youtu.be/...",
                prefixIcon: const Icon(Icons.link, color: kPrimaryColor),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: kPrimaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: kPrimaryColor)),
              ),
            ),
            const SizedBox(height: 8),
            const Text("Use a publicly accessible video link.",
                style: TextStyle(fontSize: 12, color: kTextLight)),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const VideoDetailsScreen())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Continue with link",
                        style: TextStyle(color: Colors.white)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}