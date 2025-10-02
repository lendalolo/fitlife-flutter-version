enum FontEnum {
  familyCabinet("Cabinet", "Cabinet"),
  familyLora("Lora", "Lora"),
  familyCairo("Cairo", "Cairo");

  // Define properties for the key and value
  final String key;
  final String name;

  // Constructor to initialize the properties
  const FontEnum(this.key, this.name);
}