class OnBoardItem {
  final String img, title, description;

  OnBoardItem({
    required this.img,
    required this.title,
    required this.description,
  }) : assert(img.contains('.svg'));
}
