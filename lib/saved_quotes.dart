import 'package:flutter/material.dart';

class SavedQuotesPage extends StatelessWidget {
  const SavedQuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quotes = [
      "The only way to do great...",
      "The future belongs to...",
      "Be the change that...",
      "The best and most...",
      "In three words I can...",
      "The only limit to our...",
    ];

    final images = [
      "https://images.unsplash.com/photo-1501785888041-af3ef285b470", // mountain
      "https://media.istockphoto.com/id/538449165/photo/beautiful-cloudscape-over-the-sea-sunset-shot.jpg?s=612x612&w=0&k=20&c=XwieRIV5Df3Azuk8tH3CnAlLA-GO5GBE7R7dKtb1POw=", // sunset
      "https://media.istockphoto.com/id/1446199740/photo/path-through-a-sunlit-forest.jpg?s=612x612&w=0&k=20&c=DuozAED7qfI5E6PcVb4bHtFJ_uM_n1duok56j_liLEA=", // forest
      "https://media.istockphoto.com/id/1212911887/photo/futuristic-digital-block-chain-background.jpg?s=612x612&w=0&k=20&c=tqxa6bZg8XBo_J6h2waJrBZ2UdTeEtzOlRUcM9sDkMc=", // abstract
      "https://images.unsplash.com/photo-1494526585095-c41746248156", // city
      "https://media.istockphoto.com/id/162515751/photo/moon-over-mountains.jpg?s=612x612&w=0&k=20&c=mKsWiAqN8lOGl6bdnDg9ssY25RSJJbSOk3g0MuDZNXw=", // night
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF202837),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Saved Quotes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: quotes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
            childAspectRatio: 1.05,
          ),
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(images[index % images.length]),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.45),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '"${quotes[index]}"',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      shadows: [Shadow(blurRadius: 3, color: Colors.black)],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
