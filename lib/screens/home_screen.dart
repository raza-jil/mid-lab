import 'package:flutter/material.dart';
import '../theme.dart';
import 'add_video_screen.dart';
import 'read_notes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.videocam_outlined, color: kPrimaryColor),
              SizedBox(width: 8),
              Text("Video Convert Into Notice",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 24),
          const Text("Turn videos into notes",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: kTextDark)),
          const SizedBox(height: 12),
          const Text(
              "Upload a video or paste a link and get a readable note you can review anytime.",
              style: TextStyle(color: kTextLight, height: 1.5)),
          const SizedBox(height: 32),

          // Main Action Card
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: kAccentColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.videocam, color: kPrimaryColor, size: 32),
                const SizedBox(height: 16),
                const Text("Start with a video",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kTextDark)),
                const SizedBox(height: 8),
                const Text("Upload a file or paste a video link.",
                    style: TextStyle(color: kTextLight)),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AddVideoScreen())),
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text("Convert a video"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Recent Notes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Recent notes",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kTextDark)),
              Text("View all",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 16),

          _buildRecentCard(
              context,
              "Introduction to Photosynthesis",
              "Today · 12:48 video",
              "4 sections · Detailed notes", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ReadNotesScreen()));
          }),
          const SizedBox(height: 12),
          _buildRecentCard(context, "The water cycle",
              "Yesterday · 08:32 video", "3 sections · Summary", () {}),
        ],
      ),
    );
  }

  Widget _buildRecentCard(BuildContext context, String title, String subtitle,
      String details, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kBorderColor),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: kAccentColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12)),
              child:
              const Icon(Icons.description_outlined, color: kPrimaryColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: kTextDark)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style:
                      const TextStyle(fontSize: 12, color: kTextLight)),
                  const SizedBox(height: 4),
                  Text(details,
                      style:
                      const TextStyle(fontSize: 12, color: kTextLight)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}