class Weather{
  final String location;
  final int temperature;
  final String condition;
  final int humidity;
  final int windSpeed;
  
  Weather({
    required this.location,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });

factory Weather.fromJson(Map<String, dynamic> json){
  return Weather(
    location:json['location'],
    temperature:json['temperature'],
    condition:json['condition'],
    humidity:json['humidity'],
    windSpeed:json['windSpeed'],
  );
}
}