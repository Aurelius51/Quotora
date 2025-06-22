import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  static const List<String> categories = [
    "Motivation",
    "Love",
    "Life",
    "Success",
    "Happiness",
    "Wisdom",
  ];

  static const List<Map<String, String>> authors = [
    {"name": "Maya Angelou", "image": "https://shorturl.at/f75d7"},
    {"name": "Nelson Mandela", "image": "https://shorturl.at/AmltJ"},
    {"name": "Oprah Winfrey", "image": "https://shorturl.at/qLJkw"},
    {"name": "Albert Einstein", "image": "https://shorturl.at/hrrfM"},
    {"name": "Michelle Obama", "image": "https://shorturl.at/zH9Mj"},
    {"name": "Steve Jobs", "image": "https://tinyurl.com/5n7fyyk2"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202837),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Explore"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF232B3B),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search quotes, authors, or topics",
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(Icons.search, color: Colors.white54),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Categories
            const Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 38,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  return Chip(
                    label: Text(
                      categories[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: const Color(0xFF232B3B),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // Popular Authors
            const Text(
              "Popular Authors",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: authors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 22,
                  crossAxisSpacing: 22,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final author = authors[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.white12,
                        backgroundImage: NetworkImage(author["image"]!),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        author["name"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
