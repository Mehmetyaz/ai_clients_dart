/// Reasoning effort level for reasoning models.
///
/// Constrains effort on reasoning for reasoning models. Reducing reasoning effort
/// can result in faster responses and fewer tokens used on reasoning in a response.
///
/// **Model-Specific Support:**
///
/// - **gpt-5.1**: Defaults to [none] (no reasoning). Supported values: [none],
///   [low], [medium], [high]. Tool calls supported for all reasoning values.
///
/// - **gpt-5-pro**: Defaults to and only supports [high] reasoning effort.
///
/// - **Models before gpt-5.1**: Default to [medium] reasoning effort and do not
///   support [none].
///
/// - **Models after gpt-5.1-codex-max**: Support all values including [xhigh].
enum ReasoningEffort {
  /// Unknown effort level (fallback for unrecognized values).
  unknown('unknown'),

  /// No reasoning effort. Only supported by gpt-5.1 and later models.
  none('none'),

  /// Minimal reasoning effort.
  minimal('minimal'),

  /// Low reasoning effort.
  low('low'),

  /// Medium reasoning effort. Default for models before gpt-5.1.
  medium('medium'),

  /// High reasoning effort. Only supported value for gpt-5-pro.
  high('high'),

  /// Extra-high reasoning effort. Supported for models after gpt-5.1-codex-max.
  xhigh('xhigh');

  /// The JSON value for this effort level.
  final String value;

  const ReasoningEffort(this.value);

  /// Creates a [ReasoningEffort] from a JSON value.
  factory ReasoningEffort.fromJson(String json) {
    return ReasoningEffort.values.firstWhere(
      (e) => e.value == json,
      orElse: () => ReasoningEffort.unknown,
    );
  }

  /// Converts to JSON value.
  String toJson() => value;
}
