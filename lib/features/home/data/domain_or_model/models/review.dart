class Review {
  final String organization;
  final String timeAgo;
  final String content;
  final String reviewerPosition;
  final int nineStarRating;
  final String avatarUrl;
  

  Review({
    required this.organization,
    required this.timeAgo,
    required this.content,
    required this.reviewerPosition,
    required this.nineStarRating,
    required this.avatarUrl,
  });
}