abstract class BaseStates {}

class InitState extends BaseStates {}

class CurrentIndexState extends BaseStates {
  final int currentIndex;

  // to init state
  CurrentIndexState(this.currentIndex);
}
