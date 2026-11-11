import 'package:flutter/material.dart';
import '../theme.dart';
import 'read_notes_screen.dart';

class SavedNotesScreen extends StatelessWidget {
  const SavedNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.videocam_outlined, color: kPrimaryColor),
              SizedBox(width: 8),
              Text("Saved notes",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold)),
              Spacer(),
              Icon(Icons.add, color: kTextDark),
            ],
          ),
          const SizedBox(height: 24),
          const Text("Saved notes",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: kTextDark)),
          const SizedBox(height: 4),
          const Text("4 notes ready to review.",
              style: TextStyle(color: kTextLight)),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Search notes",
              hintStyle: const TextStyle(color: kTextLight),
              prefixIcon: const Icon(Icons.search, color: kTextLight),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kBorderColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kBorderColor)),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("All notes",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kTextDark)),
              Row(
                children: const [
                  Text("Newest first",
                      style: TextStyle(fontSize: 12, color: kTextLight)),
                  SizedBox(width: 4),
                  Icon(Icons.filter_list, size: 16, color: kTextLight),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildSavedCard(context, "Introduction to Photosynthesis",
                    "Today · 12:48 video", true),
                _buildSavedCard(context, "The water cycle",
                    "Yesterday · 08:32 video", false),
                _buildSavedCard(context, "Understanding fractions",
                    "Oct 12 · 15:06 video", false),
                _buildSavedCard(context, "How volcanoes form",
                    "Oct 10 · 10:24 video", false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedCard(
      BuildContext context, String title, String subtitle, bool isFirst) {
    return GestureDetector(
      onTap: isFirst
          ? () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => const ReadNotesScreen()))
          : () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
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
              child: const Icon(Icons.description_outlined,
                  color: kPrimaryColor),
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
                      style: const TextStyle(
                          fontSize: 12, color: kTextLight)),
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