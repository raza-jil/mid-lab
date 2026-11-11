import 'package:flutter/material.dart';
import '../theme.dart';
import 'read_notes_screen.dart';

class NotesPreviewScreen extends StatefulWidget {
  final String format;
  final String language;
  final bool includeTimestamps;

  const NotesPreviewScreen({
    super.key,
    this.format = 'Detailed',
    this.language = 'English',
    this.includeTimestamps = true,
  });

  @override
  State<NotesPreviewScreen> createState() => _NotesPreviewScreenState();
}

class _NotesPreviewScreenState extends State<NotesPreviewScreen> {
  bool _saved = false;

  void _saveNote() {
    if (_saved) return;
    setState(() => _saved = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Note saved successfully!'),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: kTextDark),
            onPressed: () => Navigator.pop(context)),
        title: const Text("Your notes",
            style: TextStyle(
                color: kTextDark, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: Column( // ✅ Fixed Bottom Overflow: Using Column + Expanded
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: kAccentColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check, size: 14, color: kPrimaryColor),
                        SizedBox(width: 4),
                        Text("Notes are ready",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("Introduction to\nPhotosynthesis",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: kTextDark,
                          height: 1.1)),
                  const SizedBox(height: 8),
                  Text("12:48 video · ${widget.language} · ${widget.format} notes",
                      style: const TextStyle(fontSize: 12, color: kTextLight)),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: kAccentColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("At a glance",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: kPrimaryColor)),
                        SizedBox(height: 8),
                        Text(
                            "Plants use sunlight to turn water and carbon dioxide into glucose. This process releases oxygen and supports life on Earth.",
                            style: TextStyle(color: kTextDark, height: 1.5)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Inside your notes",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("4 sections",
                          style: TextStyle(color: kTextLight, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _section("00:00", "What is photosynthesis?"),
                  _section("02:15", "The role of chlorophyll"),
                  _section("05:40", "Light to chemical energy"),
                  _section("09:20", "Why photosynthesis matters"),
                  const SizedBox(height: 20), // Added space at bottom
                ],
              ),
            ),
          ),
          // ✅ Buttons moved outside ScrollView to prevent overflow
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ReadNotesScreen(
                            format: widget.format,
                            language: widget.language,
                            includeTimestamps: widget.includeTimestamps,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.menu_book, color: Colors.white, size: 20),
                    label: const Text("Read full notes",
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _saveNote,
                    icon: Icon(_saved ? Icons.check_circle : Icons.save_alt,
                        color: kPrimaryColor, size: 20),
                    label: Text(_saved ? "Saved!" : "Save to my notes",
                        style: const TextStyle(color: kPrimaryColor)),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      side: BorderSide(
                          color: _saved ? kPrimaryColor : kBorderColor),
                      backgroundColor: _saved
                          ? kAccentColor.withOpacity(0.3)
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String time, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Text(time,
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12)),
          const SizedBox(width: 16),
          Expanded(
              child: Text(title,
                  style: const TextStyle(
                      color: kTextDark, fontWeight: FontWeight.w500))),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
        ],
      ),
    );
  }
}