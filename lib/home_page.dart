import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202837),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Quotora"),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AnimatedQuoteCard(),
            const SizedBox(height: 32),
            const Text(
              "Themes",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                _ThemeChip(label: "Success", icon: Icons.emoji_events),
                _ThemeChip(label: "Love", icon: Icons.favorite),
                _ThemeChip(label: "Mindset", icon: Icons.psychology),
                _ThemeChip(label: "Faith", icon: Icons.church),
                _ThemeChip(label: "Discipline", icon: Icons.fitness_center),
                _ThemeChip(label: "Healing", icon: Icons.healing),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedQuoteCard extends StatefulWidget {
  @override
  State<_AnimatedQuoteCard> createState() => _AnimatedQuoteCardState();
}

class _AnimatedQuoteCardState extends State<_AnimatedQuoteCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeIn,
      child: Card(
        color: const Color(0xFF232B3B),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
          child: Column(
            children: [
              const Text(
                "The only way to do great work is to love what you do.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              const Text("Steve Jobs", style: TextStyle(color: Colors.white54)),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _IconText(icon: Icons.favorite_border, text: "123"),
                  _IconText(icon: Icons.bookmark_border, text: "45"),
                  _IconText(icon: Icons.share, text: "67"),
                  _IconText(icon: Icons.copy, text: "89"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  const _IconText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white54, size: 20),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.white54)),
      ],
    );
  }
}

class _ThemeChip extends StatelessWidget {
  final String label;
  final IconData icon;
  const _ThemeChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: const Color(0xFF232B3B),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white54, size: 18),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
