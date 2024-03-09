
class Satellites{
  late String id;
  late String country;
  late String date;
  late String mass;
  late String launcher;


Satellites({
  required this.id,
  required this.country,
  required this.date,
  required this.mass,
  required this.launcher
});

 factory Satellites.fromJson(Map<String, dynamic> json) {
    return Satellites(
      id: json['id'],
      country: json['country'],
      date: json['launch_date'],
      mass: json['mass'],
      launcher: json['launcher'],
    );
  }

}

