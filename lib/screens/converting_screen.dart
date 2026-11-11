import 'dart:async';
import 'package:flutter/material.dart';
import '../theme.dart';
import 'notes_preview_screen.dart';

class ConvertingScreen extends StatefulWidget {
  const ConvertingScreen({super.key});

  @override
  State<ConvertingScreen> createState() => _ConvertingScreenState();
}

class _ConvertingScreenState extends State<ConvertingScreen> {
  double _progress = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startConversion();
  }

  void _startConversion() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (mounted) {
        setState(() {
          _progress += 0.01;
          if (_progress >= 1.0) {
            _timer?.cancel();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const NotesPreviewScreen()));
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool step1Done = _progress > 0.2;
    bool step2Done = _progress > 0.6;
    bool step3Done = _progress > 0.9;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back)),
                const SizedBox(width: 8),
                const Text("Converting video",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),

            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: _progress,
                    strokeWidth: 10,
                    backgroundColor: Colors.grey.shade200,
                    valueColor:
                    const AlwaysStoppedAnimation<Color>(kPrimaryColor),
                    strokeCap: StrokeCap.round,
                  ),
                  Center(
                    child: Text("${(_progress * 100).toInt()}%",
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: kTextDark)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            const Text("Turning video into notes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("About 30 seconds remaining",
                style: TextStyle(color: kTextLight)),
            const SizedBox(height: 32),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: kBorderColor),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Introduction to Photosynthesis",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text("Biology basics · 12 min 48 sec",
                      style: TextStyle(fontSize: 12, color: kTextLight)),
                ],
              ),
            ),
            const SizedBox(height: 32),

            _buildProgressStep("Video ready", "12 min 48 sec of content",
                step1Done, step1Done && !step2Done),
            const SizedBox(height: 24),
            _buildProgressStep("Creating your notes",
                "Organizing key ideas and timestamps", step2Done, step2Done && !step3Done),
            const SizedBox(height: 24),
            _buildProgressStep("Finishing touches",
                "Your notes will be ready soon", step3Done, false),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  _timer?.cancel();
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  side: BorderSide(color: kBorderColor),
                  foregroundColor: kPrimaryColor,
                ),
                child: const Text("Cancel conversion"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressStep(
      String title, String subtitle, bool isActive, bool isProcessing) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: isActive ? kAccentColor : Colors.grey.shade100,
              shape: BoxShape.circle),
          child: isProcessing
              ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2))
              : Icon(isActive ? Icons.check : Icons.circle_outlined,
              size: 16, color: isActive ? kPrimaryColor : Colors.grey),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isActive ? kTextDark : kTextLight)),
            const SizedBox(height: 2),
            Text(subtitle,
                style: const TextStyle(fontSize: 12, color: kTextLight)),
          ],
        )
      ],
    );
  }
}