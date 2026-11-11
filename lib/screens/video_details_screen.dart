import 'package:flutter/material.dart';
import '../theme.dart';
import 'converting_screen.dart';

class VideoDetailsScreen extends StatefulWidget {
  const VideoDetailsScreen({super.key});

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  bool includeTimestamps = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: kTextDark),
            onPressed: () => Navigator.pop(context)),
        title: const Text("Video details",
            style: TextStyle(
                color: kTextDark, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Player Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: kAccentColor,
                  borderRadius: BorderRadius.circular(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text("BIOLOGY BASICS",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor)),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const CircleAvatar(
                          radius: 24,
                          backgroundColor: kPrimaryColor,
                          child: Icon(Icons.play_arrow, color: Colors.white)),
                      const SizedBox(width: 16),
                      const Expanded(
                          child: Text("How plants turn light into energy",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: kTextDark))),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: Text("12:48",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600))),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text("Introduction to Photosynthesis",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kTextDark)),
            const SizedBox(height: 4),
            const Text("Biology basics · 12 min 48 sec",
                style: TextStyle(color: kTextLight)),
            const SizedBox(height: 24),

            const Text("Make the notes yours",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kTextDark)),
            const SizedBox(height: 16),

            const Text("Notes language",
                style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: kBorderColor),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: "English",
                  isExpanded: true,
                  items: ["English", "Spanish", "French"]
                      .map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Text("Notes format",
                style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: kBorderColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text("Summary",
                        style: TextStyle(color: kTextLight)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: kAccentColor,
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check, size: 16, color: kPrimaryColor),
                        SizedBox(width: 4),
                        Text("Detailed",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Include timestamps",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15)),
                    SizedBox(height: 4),
                    Text("Jump back to key video moments.",
                        style: TextStyle(fontSize: 12, color: kTextLight)),
                  ],
                ),
                Switch(
                    value: includeTimestamps,
                    activeColor: kPrimaryColor,
                    onChanged: (v) => setState(() => includeTimestamps = v)),
              ],
            ),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ConvertingScreen())),
                icon: const Icon(Icons.description, color: Colors.white),
                label: const Text("Generate notes",
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}