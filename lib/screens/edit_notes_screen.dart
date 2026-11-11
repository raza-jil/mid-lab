import 'package:flutter/material.dart';
import '../theme.dart';

class EditNotesScreen extends StatefulWidget {
  final String initialTitle;
  final String initialContent;

  const EditNotesScreen({
    super.key,
    this.initialTitle = "Introduction to Photosynthesis",
    this.initialContent = "",
  });

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  late TextEditingController _titleController;
  late TextEditingController _bodyController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle);
    _bodyController = TextEditingController(text: widget.initialContent);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  // ✅ Function to apply formatting (Bold, Italic, Bullet) to selected text
  void _applyFormatting(String type) {
    final text = _bodyController.text;
    final selection = _bodyController.selection;

    // If no text is selected, do nothing
    if (selection.start < 0 || selection.start == selection.end) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select text to format first!')),
      );
      return;
    }

    String selectedText = text.substring(selection.start, selection.end);
    String newText = "";

    if (type == 'bold') {
      newText = "**$selectedText**"; // Markdown for Bold
    } else if (type == 'italic') {
      newText = "*$selectedText*"; // Markdown for Italic
    } else if (type == 'bullet') {
      newText = "\n• $selectedText"; // Bullet point
    } else if (type == 'undo') {
      // Basic undo (removes the last added markdown)
      newText = selectedText.replaceAll('**', '').replaceAll('*', '').replaceAll('• ', '');
    }

    final updatedText = text.replaceRange(selection.start, selection.end, newText);

    setState(() {
      _bodyController.text = updatedText;
      // Move cursor to end of newly formatted text
      _bodyController.selection = TextSelection.collapsed(
        offset: selection.start + newText.length,
      );
    });
  }

  // ✅ Save and Return Data to Read Screen
  void _saveAndReturn() {
    Navigator.pop(context, {
      'title': _titleController.text,
      'content': _bodyController.text,
    });
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
        title: const Text("Edit notes",
            style: TextStyle(
                color: kTextDark, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Note title",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
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
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notes",
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text("Unsaved changes",
                    style: TextStyle(color: kPrimaryColor, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // ✅ Toolbar Buttons
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: kBorderColor))),
                      child: Row(
                        children: [
                          _toolBtn(Icons.format_bold, () => _applyFormatting('bold')),
                          _toolBtn(Icons.format_italic, () => _applyFormatting('italic')),
                          _toolBtn(Icons.format_list_bulleted, () => _applyFormatting('bullet')),
                          _toolBtn(Icons.undo, () => _applyFormatting('undo')),
                        ],
                      ),
                    ),

                    // ✅ Text Area
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextField(
                          controller: _bodyController,
                          maxLines: null,
                          expands: true,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: const InputDecoration(
                              border: InputBorder.none),
                          style: const TextStyle(
                              color: kTextDark, height: 1.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Timestamps stay linked to your original video.",
                style: TextStyle(fontSize: 12, color: kTextLight)),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _saveAndReturn, // ✅ Save and pop with data
                icon: const Icon(Icons.check, color: Colors.white, size: 20),
                label: const Text("Save changes",
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
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context), // Discards (just pops)
                child: const Text("Discard changes",
                    style: TextStyle(color: kTextLight)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper for Toolbar Buttons
  Widget _toolBtn(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon, size: 20),
      onPressed: onPressed,
    );
  }
}