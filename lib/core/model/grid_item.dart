enum StaggeredGridSize {
  fullWidth,
  halfWidthFullHeight,
  halfWidthHalfHeight,
}

class GridItem {
  final StaggeredGridSize size;
  final String title;
  final String imagePath;

  GridItem({required this.size, required this.title, required this.imagePath});
}
