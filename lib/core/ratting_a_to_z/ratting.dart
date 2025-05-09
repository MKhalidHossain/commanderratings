import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: RatingPage()));

class TakeRating extends StatefulWidget {
  final void Function(double) onRatingSelected;

  const TakeRating({super.key, required this.onRatingSelected});

  @override
  _TakeRatingState createState() => _TakeRatingState();
}

class _TakeRatingState extends State<TakeRating> {
  double selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(20, (index) {
        double starValue = (index + 1) * 0.5;
        bool isHalf = starValue % 1 != 0;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedRating = starValue;
            });
            widget.onRatingSelected(selectedRating);
          },
          child: Icon(
            isHalf ? Icons.star_half : Icons.star,
            color: starValue <= selectedRating ? Colors.yellow : Colors.white,
            size: 32,
          ),
        );
      }),
    );
  }
}

class ShowRating extends StatelessWidget {
  final double rating;

  const ShowRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    assert(rating >= 0 && rating <= 10, 'Rating must be between 0 and 10');

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(10, (index) {
        double currentStar = index + 1;
        if (rating >= currentStar) {
          return const Icon(Icons.star, color: Colors.yellow, size: 20);
        } else if (rating + 0.5 >= currentStar) {
          return const Icon(
            Icons.star_half_outlined,
            color: Colors.yellow,
            size: 20,
          );
        } else {
          return const Icon(
            Icons.star_border_outlined,
            color: Colors.white,
            size: 20,
          );
        }
      }),
    );
  }
}

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  List<double> ratingsList = [];

  void addRating(double rating) {
    setState(() {
      ratingsList.add(rating);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take and Show Ratings'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TakeRating(
              onRatingSelected: (rating) {
                addRating(rating);
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child:
                  ratingsList.isEmpty
                      ? const Center(
                        child: Text(
                          'No ratings yet!',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                      : ListView.builder(
                        itemCount: ratingsList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(
                              'Rating ${index + 1}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            title: ShowRating(rating: ratingsList[index]),
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
