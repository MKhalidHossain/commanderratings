import 'package:flutter/material.dart';

class TakeRating extends StatefulWidget {
  final void Function(int) onRatingSelected;

  const TakeRating({super.key, required this.onRatingSelected});

  @override
  _TakeRatingState createState() => _TakeRatingState();
}

class _TakeRatingState extends State<TakeRating> {
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(9, (index) {
        int starIndex = index + 1;
        return IconButton(
          onPressed: () {
            setState(() {
              selectedRating = starIndex;
            });
            widget.onRatingSelected(selectedRating);
          },
          icon: Icon(
            Icons.star,
            color: starIndex <= selectedRating ? Colors.yellow : Colors.white,
            size: 32,
          ),
        );
      }),
    );
  }
}

class ShowRating extends StatelessWidget {
  final int rating;

  const ShowRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    assert(rating >= 0 && rating <= 10, 'Rating must be between 0 and 9');
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(10, (index) {
        int starIndex = index + 1;
        return Icon(
          Icons.star,
          color: starIndex <= rating ? Colors.yellow : Colors.white,
          size: 20,
        );
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
  List<int> ratingsList = [];

  void addRating(int rating) {
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
