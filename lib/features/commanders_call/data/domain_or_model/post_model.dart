class PostModel {
  final String imagePath;
  final String overlayText;
  final String title;

  PostModel({
    required this.imagePath,
    required this.overlayText,
    required this.title,
  });
}

// Updated samplePosts with network image URLs
// final List<PostModel> samplePosts = [
//   PostModel(
//     imagePath: 'https://images.unsplash.com/photo-1603064752734-3e75c3c9f6df',
//     overlayText: 'ENLISTED PERSPECTIVE',
//     title: 'The argument for mandatory military service...'
//   ),
//   PostModel(
//     imagePath: 'https://images.unsplash.com/photo-1517841905240-472988babdf9',
//     overlayText: 'MEDICATION & LEADERSHIP',
//     title: 'Pills and power: Managing leadership while on medication'
//   ),
//   PostModel(
//     imagePath: 'https://images.unsplash.com/photo-1573497491208-6b1acb260507',
//     overlayText: 'MILITARY LEADERSHIP',
//     title: 'The problem with different standards for different ranks'
//   ),
//   PostModel(
//     imagePath: 'https://images.unsplash.com/photo-1603048290438-e88b1e217e9b',
//     overlayText: 'CONGRESSIONAL & SENATORIAL ASSISTANCE',
//     title: 'Are senatorial/congressional inquiries impactful?'
//   ),
//   PostModel(
//     imagePath: 'https://images.unsplash.com/photo-1568605114967-8130f3a36994',
//     overlayText: 'INSPECTOR GENERAL & MILITARY EQUAL OPPORTUNITY',
//     title: 'Is the MEO office effective?'
//   ),
//   PostModel(
//     imagePath: 'https://images.unsplash.com/photo-1502767089025-6572583495b0',
//     overlayText: 'PSYCHOLOGY OF LEADERSHIP',
//     title: 'How military commanders manage mental health in crises'
//   ),
//   PostModel(
//     imagePath: 'https://images.unsplash.com/photo-1551836022-d5d88e9218df',
//     overlayText: 'VETERANS',
//     title: 'New civilian contractors replacing veterans in leadership?'
//   ),
//   PostModel(
//     imagePath: 'https://images.unsplash.com/photo-1488521787991-ed7bbaae773c',
//     overlayText: 'INTERNATIONAL & COALITION LEADERSHIP',
//     title: 'Lessons from global coalition efforts'
//   ),
// ];

List<PostModel> samplePosts = [
  PostModel(
    imagePath: 'assets/post1.jpg',
    overlayText: 'ENLISTED PERSPECTIVE',
    title: 'The argument for mandatory military service...',
  ),
  PostModel(
    imagePath: 'assets/post2.jpg',
    overlayText: 'MEDICATION & LEADERSHIP',
    title: 'Pills and power: Managing leadership while on medication',
  ),
  PostModel(
    imagePath: 'assets/post3.jpg',
    overlayText: 'MILITARY LEADERSHIP',
    title: 'The problem with different standards for different ranks',
  ),
  PostModel(
    imagePath: 'assets/post4.jpg',
    overlayText: 'CONGRESSIONAL & SENATORIAL ASSISTANCE',
    title: 'Are senatorial/congressional inquiries impactful?',
  ),
  PostModel(
    imagePath: 'assets/post5.jpg',
    overlayText: 'INSPECTOR GENERAL & MILITARY EQUAL OPPORTUNITY',
    title: 'Is the MEO office effective?',
  ),
  PostModel(
    imagePath: 'assets/post6.jpg',
    overlayText: 'PSYCHOLOGY OF LEADERSHIP',
    title: 'How military commanders manage mental health in crises',
  ),
  PostModel(
    imagePath: 'assets/post7.jpg',
    overlayText: 'VETERANS',
    title: 'New civilian contractors replacing veterans in leadership?',
  ),
  PostModel(
    imagePath: 'assets/post8.jpg',
    overlayText: 'INTERNATIONAL & COALITION LEADERSHIP',
    title: 'Lessons from global coalition efforts',
  ),
];
