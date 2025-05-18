class Review {
  final String organization;
  final String timeAgo;
  final String content;
  final String reviewerPosition;
  final double tenStarRating;
  final String avatarUrl;

  Review({
    required this.organization,
    required this.timeAgo,
    required this.content,
    required this.reviewerPosition,
    required this.tenStarRating,
    required this.avatarUrl,
  });
}
