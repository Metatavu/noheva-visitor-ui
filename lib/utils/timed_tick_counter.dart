import "dart:async";

/// Timed Tick Counter
///
/// Counts ticks and fires [onTicksReached] when [ticksRequired] is reached.
/// Resets ticks if [timeout] is reached before [ticksRequired].
class TimedTickCounter {
  final int ticksRequired;
  final Duration timeout;
  final Function onTicksReached;

  int _ticks = 0;
  Timer? _timer;

  TimedTickCounter({
    required this.ticksRequired,
    required this.timeout,
    required this.onTicksReached,
  });

  /// Ticks the counter
  void tick() {
    if (_ticks == 0) {
      _timer = Timer(timeout, () {
        _ticks = 0;
      });
    }
    _ticks++;
    if (_ticks >= ticksRequired) {
      _timer?.cancel();
      _ticks = 0;
      onTicksReached();
    }
  }
}
