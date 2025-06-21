import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CreateQuotePage extends StatefulWidget {
  const CreateQuotePage({super.key});

  @override
  State<CreateQuotePage> createState() => _CreateQuotePageState();
}

class _CreateQuotePageState extends State<CreateQuotePage> {
  final TextEditingController _quoteController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  File? _backgroundImage;
  Color _textColor = Colors.white;
  String _selectedFont = 'Roboto';

  final List<String> _fonts = [
    'Roboto',
    'Merriweather',
    'Lobster',
    'Montserrat',
    'Dancing Script',
    'Oswald',
  ];

  Future<void> _pickBackgroundImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _backgroundImage = File(pickedFile.path);
      });
    }
  }

  void _pickTextColor() async {
    Color? picked = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick Text Color'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: _textColor,
            onColorChanged: (color) => Navigator.of(context).pop(color),
          ),
        ),
      ),
    );
    if (picked != null) {
      setState(() {
        _textColor = picked;
      });
    }
  }

  void _pickFont() async {
    String? picked = await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Pick Font'),
        children: _fonts
            .map(
              (font) => SimpleDialogOption(
                onPressed: () => Navigator.pop(context, font),
                child: Text(font, style: GoogleFonts.getFont(font)),
              ),
            )
            .toList(),
      ),
    );
    if (picked != null) {
      setState(() {
        _selectedFont = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final quoteText = _quoteController.text;
    final fontStyle = GoogleFonts.getFont(_selectedFont);

    return Scaffold(
      backgroundColor: const Color(0xFF202837),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Create"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Preview Card
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(14),
                    image: _backgroundImage != null
                        ? DecorationImage(
                            image: FileImage(_backgroundImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: _backgroundImage != null
                          ? Colors.black.withValues(alpha: 0.35)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          quoteText.isEmpty
                              ? "Your quote will appear here..."
                              : quoteText,
                          style: fontStyle.copyWith(
                            color: _textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            _authorController.text.isEmpty
                                ? ""
                                : "- ${_authorController.text}",
                            style: fontStyle.copyWith(
                              color: _textColor.withValues(alpha: 0.8),
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                // Quote Input
                TextField(
                  controller: _quoteController,
                  maxLines: 3,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Write your quote here...",
                    hintStyle: TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Color(0xFF232B3B),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 12),
                // Author Input
                TextField(
                  controller: _authorController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Author",
                    hintStyle: TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Color(0xFF232B3B),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Customize",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Customization Options
                _CustomizationTile(
                  icon: Icons.image,
                  text: "Background Image",
                  onTap: _pickBackgroundImage,
                ),
                _CustomizationTile(
                  icon: Icons.format_color_text,
                  text: "Text Color",
                  onTap: _pickTextColor,
                ),
                _CustomizationTile(
                  icon: Icons.font_download,
                  text: "Font",
                  onTap: _pickFont,
                ),
                const SizedBox(height: 16),
                // Submit Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Submit logic
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomizationTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _CustomizationTile({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.white70),
      title: Text(text, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.white38,
      ),
      onTap: onTap,
    );
  }
}
