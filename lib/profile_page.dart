import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202837),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile image from URL
            const CircleAvatar(
              radius: 44,
              backgroundColor: Colors.white24,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=47", // You can replace with any other avatar URL
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Sophia Carter",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "@sophiacarter",
              style: TextStyle(color: Colors.white54),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _StatBox(label: "Quotes", value: "12"),
                _StatBox(label: "Saved", value: "34"),
                _StatBox(label: "Followers", value: "56"),
              ],
            ),
            const SizedBox(height: 24),
            const TabBarWidget(),
          ],
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;
  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(label, style: const TextStyle(color: Colors.white54)),
      ],
    );
  }
}

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTab = 0;
  final List<String> tabs = ["Quotes", "Saved", "Preferences"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(
            tabs.length,
            (index) => Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedTab = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: selectedTab == index
                            ? Colors.white
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    tabs[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: selectedTab == index
                          ? Colors.white
                          : Colors.white54,
                      fontWeight: selectedTab == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        if (selectedTab == 0)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _QuoteTile(
                category: "Inspiration",
                quote: "The only way to do great work is to love what you do.",
                author: "Steve Jobs",
                imageUrl:
                    "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=80&q=80",
              ),
              _QuoteTile(
                category: "Motivation",
                quote: "Believe you can and you're halfway there.",
                author: "Theodore Roosevelt",
                imageUrl:
                    "https://t4.ftcdn.net/jpg/02/86/96/95/360_F_286969556_uepKaNce0pdF8hvBTEz24hXfWnApJE94.jpg",
              ),
            ],
          ),
        if (selectedTab == 1)
          const Center(
            child: Text(
              "No saved quotes yet.",
              style: TextStyle(color: Colors.white54),
            ),
          ),
        if (selectedTab == 2)
          const Center(
            child: Text(
              "Preferences coming soon.",
              style: TextStyle(color: Colors.white54),
            ),
          ),
      ],
    );
  }
}

class _QuoteTile extends StatelessWidget {
  final String category;
  final String quote;
  final String author;
  final String imageUrl;

  const _QuoteTile({
    required this.category,
    required this.quote,
    required this.author,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF232B3B),
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(quote, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(author, style: const TextStyle(color: Colors.white54)),
        trailing: Text(
          category,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ),
    );
  }
}
