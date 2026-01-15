class InformationClassModel {
  String className;
  String eventName;
  DateTime startTime;
  DateTime endTime;
  String tanggal;
  int sesi;
  String location;
  int perserta;

  InformationClassModel({
    required this.className,
    required this.eventName,
    required this.startTime,
    required this.endTime,
    required this.tanggal,
    required this.sesi,
    required this.location,
    required this.perserta,
  });

  static List<InformationClassModel> getAllInformationClass() {
    final now = DateTime.now();

    List<InformationClassModel> classes = [
      InformationClassModel(
        className: '',
        eventName: 'Public Speakaing - Regular A',
        startTime: now.add(const Duration(hours: 1)),
        endTime: now.add(const Duration(hours: 2)),
        tanggal: 'Hari ini | ${now.hour + 1}.00 - ${now.hour + 2}.00 WIB',
        sesi: 1,
        location: 'Ruang A',
        perserta: 5,
      ),
      InformationClassModel(
        className: '',
        eventName: 'Aku bisa MC - Regular A',
        startTime: now.add(const Duration(hours: 5)),
        endTime: now.add(const Duration(hours: 6)),
        tanggal: 'Hari ini | ${now.hour + 5}.00 - ${now.hour + 6}.00 WIB',
        sesi: 2,
        location: 'Ruang B',
        perserta: 8,
      ),
      InformationClassModel(
        className: '',
        eventName: 'Ngoding Itu Gampang - Regular A',
        startTime: now.add(const Duration(days: 1, hours: 2)),
        endTime: now.add(const Duration(days: 1, hours: 3)),
        tanggal: 'Besok | 10.00 - 11.00 WIB',
        sesi: 3,
        location: 'Ruang C',
        perserta: 10,
      ),
    ];

    /// 🔹 1. Urutkan berdasarkan waktu terdekat
    classes.sort((a, b) => a.startTime.compareTo(b.startTime));

    /// 🔹 2. Set className
    for (int i = 0; i < classes.length; i++) {
      classes[i].className = i == 0 ? 'Kelas Berikutnya' : 'Kelas Fasilitator';
    }

    return classes;
  }

  String get countdownText {
    final now = DateTime.now();
    final diff = startTime.difference(now);

    if (diff.isNegative) {
      return 'Sudah dimulai';
    }

    final hours = diff.inHours;
    final minutes = diff.inMinutes % 60;

    if (hours > 0) {
      return 'Mulai dalam $hours jam';
    } else {
      return 'Mulai dalam $minutes menit';
    }
  }
}
