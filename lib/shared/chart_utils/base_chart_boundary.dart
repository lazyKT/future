class BaseChartBoundary<T> {
  final List<T> _elements;
  final double Function(T)? _propertyFinder;

  double minX;
  double minY;
  double maxX;
  double maxY;

  BaseChartBoundary(this._elements, this._propertyFinder)
    : minX = 0,
      minY = 0,
      maxX = 0,
      maxY = 0;

  BaseChartBoundary.empty() : this([], null);

  double getPropertyValue(T t) {
    return _propertyFinder!(t);
  }

  T findMin() {
    return _elements.reduce((value, element) =>
      getPropertyValue(value) < getPropertyValue(element) ? value : element);
  }

  T findMax() {
    return _elements.reduce((value, element) =>
      getPropertyValue(value) > getPropertyValue(element) ? value : element);
  }

  double calculateMinY() {
    return getPropertyValue(findMin());
  }

  double calculateMaxY() {
    return getPropertyValue(findMax());
  }
}