import 'package:flutter/material.dart';
import '../theme.dart';
import 'edit_notes_screen.dart';

class ReadNotesScreen extends StatefulWidget {
  final String format;
  final String language;
  final bool includeTimestamps;

  const ReadNotesScreen({
    super.key,
    this.format = 'Detailed',
    this.language = 'English',
    this.includeTimestamps = true,
  });

  @override
  State<ReadNotesScreen> createState() => _ReadNotesScreenState();
}

class _ReadNotesScreenState extends State<ReadNotesScreen> {
  // State to hold the text returned from Edit Screen
  String _title = "Introduction to\nPhotosynthesis";
  String _content =
      "00:00 · What is photosynthesis?\n"
      "Plants use sunlight to turn water and carbon dioxide into glucose. Oxygen is released as a by-product.\n\n"
      "02:15 · The role of chlorophyll\n"
      "Chlorophyll is the green pigment in chloroplasts. It absorbs the light needed to power photosynthesis.\n\n"
      "05:40 · Light to chemical energy\n"
      "Light-dependent reactions capture energy. The Calvin cycle uses that energy to build sugars from carbon dioxide.\n\n"
      "09:20 · Why photosynthesis matters\n"
      "Glucose fuels plant growth. Plants form the base of food chains and supply oxygen for other living things.";

  // Function to open Edit Screen and update data when returned
  Future<void> _openEditScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditNotesScreen(
          initialTitle: _title,
          initialContent: _content,
        ),
      ),
    );

    // If the Edit screen returns data, update the UI
    if (result != null) {
      setState(() {
        _title = result['title'];
        _content = result['content'];
      });
    }
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
        title: const Text("Read notes",
            style: TextStyle(
                color: kTextDark, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_title,
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: kTextDark,
                    height: 1.1)),
            const SizedBox(height: 8),
            Text("${widget.language} · ${widget.format} notes",
                style: const TextStyle(fontSize: 12, color: kTextLight)),
            const SizedBox(height: 16),
            if (widget.includeTimestamps)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: kAccentColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8)),
                child: const Row(
                  children: [
                    Icon(Icons.play_circle_outline,
                        color: kPrimaryColor, size: 20),
                    SizedBox(width: 8),
                    Text("Tap a timestamp to revisit the video",
                        style:
                        TextStyle(color: kPrimaryColor, fontSize: 13)),
                  ],
                ),
              ),
            const SizedBox(height: 24),

            // ✅ Display the content that came from Edit Screen
            Text(_content,
                style: const TextStyle(
                    color: kTextDark, height: 1.6, fontSize: 14)),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _openEditScreen,
                icon: const Icon(Icons.edit, color: Colors.white, size: 20),
                label: const Text("Edit notes",
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