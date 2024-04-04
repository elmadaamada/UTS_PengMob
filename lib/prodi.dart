class Prodi {
  final String label;
  final String imageUrl;

  Prodi(this.label, this.imageUrl);

  static List<Prodi> samples = [
    Prodi('Informatika', 'assets/informatikalogo.jpg'),
    Prodi('Sistem Informasi', 'assets/sifologo.jpeg'),
    Prodi('Sains Data', 'assets/sadalogo.jpg'),
    Prodi('Bisnis Digital', 'assets/bisdilogo.jpeg'),
    Prodi('Magister Teknologi Informasi', 'assets/mti.jpg'),
    Prodi('Profil: Deva Elmada Romadhana', 'assets/elmada.jpg'),
  ];
}
