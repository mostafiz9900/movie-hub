class Rating {
  Rating({
    this.source,
    this.value,
  });

  final String? source;
  final String? value;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        source: json["Source"] == null ? null : json["Source"],
        value: json["Value"] == null ? null : json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Source": source == null ? null : source,
        "Value": value == null ? null : value,
      };
}
