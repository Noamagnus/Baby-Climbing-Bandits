class Counter {
  final int counts;

  Counter(this.counts);

  Counter copyWith({
    int? counts,
  }) {
    return Counter(
      counts ?? this.counts,
    );
  }
}
