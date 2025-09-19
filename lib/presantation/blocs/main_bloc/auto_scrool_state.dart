abstract class AutoScrollState {
  final int currentIndex;
  const AutoScrollState(this.currentIndex);
}

class AutoScrollInitial extends AutoScrollState {
  const AutoScrollInitial() : super(0);
}

class AutoScrollChanged extends AutoScrollState {
  const AutoScrollChanged(int index) : super(index);
}