import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'package:fik/prodi.dart';

class ProdiDetail extends StatefulWidget {
  final Prodi prodi;

  const ProdiDetail({Key? key, required this.prodi}) : super(key: key);

  @override
  _ProdiDetailState createState() => _ProdiDetailState();
}

class _ProdiDetailState extends State<ProdiDetail> {
  bool showProfileDescription = false;
  bool showVisionMission = false;
  bool showAccreditation = false;
  bool showProgramHead = false;
  bool showFacultyMembers = false;
  bool showOfficialWebsite = false;
  bool showStudentAchievements = false;

  void _launchWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchEmail(String email) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunch(_emailLaunchUri.toString())) {
      await launch(_emailLaunchUri.toString());
    } else {
      throw 'Could not launch $_emailLaunchUri';
    }
  }

  Widget buildMenuTile(
    String title,
    bool isExpanded,
    Function(bool) onTap,
    Widget content,
  ) {
    return ExpansionTile(
      title: Text(title),
      trailing: Icon(
        isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
      ),
      backgroundColor: Color.fromARGB(255, 255, 234, 203),
      onExpansionChanged: onTap,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: content,
          ),
      ],
    );
  }

  Widget buildProdiDetail() {
    switch (widget.prodi.label) {
      case 'Informatika':
        return Column(
          children: [
            buildMenuTile(
              'Profile',
              showProfileDescription,
              (value) {
                setState(() {
                  showProfileDescription = value;
                });
              },
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Selamat datang di Program Studi Informatika UPN Veteran Jawa Timur! Kami, di bawah koordinasi saya, Fetty Tri Anggraeny, S.Kom., M.Kom., dengan antusiasme menjembatani pendidikan dan teknologi informasi. Kami berkomitmen untuk memberikan pendidikan berkualitas tinggi dan menciptakan lingkungan penelitian yang inspiratif. Terima kasih telah mengunjungi situs web kami, dan kami berharap Anda akan menemukan segala informasi yang Anda butuhkan untuk menjelajahi peluang pendidikan dan penelitian yang kami tawarkan.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 8),
            buildMenuTile(
              'Visi & Misi',
              showVisionMission,
              (value) {
                setState(() {
                  showVisionMission = value;
                });
              },
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0), // Rata kiri dan kanan
                child: Text(
                  'Berdasarkan Visi Universitas dan Fakultas, maka Program Studi Informatika UPNVJT merumuskan visinya yakni “MENGEMBANGKAN KEILMUAN INFORMATIKA YANG UNGGUL DALAM BIDANG SISTEM CERDAS TEPAT GUNA BERKARAKTER BELA NEGARA”. Visi ini diharapkan akan dapat dicapai pada tahun 2039. Pada rentang tahun 2020 sampai 2024, arah kebijakan UPNVJT adalah pada penguatan kapabilitas kelembagaan yang berorientasi pendidikan dan riset yang berkarakter bela negara untuk meningkatkan daya saing di tingkat ASEAN, dengan didukung oleh SDM yang memiliki kepakaran dan keunggulan riset. Maka dari itu, Renstra Universitas dan Fakultas Ilmu Komputer sebagai acuan utama dalam merencanakan dan menyelenggarakan program-program kegiatan di Program Studi Informatika. Visi Keilmuan Program Studi Informatika memiliki muatan sesuai dengan Kerangka Kualifikasi Nasional Indonesia (KKNI) tingkat Sarjana (Level 6) sesuai dengan jenjang pendidikan program studi.',
                  textAlign: TextAlign.justify, // Atur rata kiri dan kanan
                ),
              ),
            ),
            buildMenuTile(
              'Akreditasi',
              showAccreditation,
              (value) {
                setState(() {
                  showAccreditation = value;
                });
              },
              Column(
                children: [
                  Image.asset(
                    'assets/sertifakreinfor.jpg',
                    height: 200,
                  ),
                  const SizedBox(height: 8),
                  Text('Informatika Telah Terakreditasi Baik Sekali'),
                ],
              ),
            ),
            buildMenuTile(
              'Ketua Program Studi',
              showProgramHead,
              (value) {
                setState(() {
                  showProgramHead = value;
                });
              },
              Column(
                children: [
                  Image.asset(
                    'assets/doseninfor/koorinfor.png',
                    height: 200,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0), // Rata kiri dan kanan
                    child: Text(
                      'Fetty Tri Anggraeny, S.Kom. M.Kom\nNIP : 19820211 2021212 005\nE-Mail : fettyanggraeny.if[at]upnjatim.ac.id\nJabatan Struktural : Koordinator Program Studi Informatika\nJabatan Fungsional : Dosen - Lektor\nKeahlian : Digital Image Processing, Computer Vision',
                      textAlign: TextAlign.justify, // Atur rata kiri dan kanan
                    ),
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Dosen',
              showFacultyMembers,
              (value) {
                setState(() {
                  showFacultyMembers = value;
                });
              },
              Column(
                children: [
                  buildFacultyMember(
                    'assets/doseninfor/koorinfor.png',
                    'Fetty Tri Anggraeny, S.Kom. M.Kom\nNIP : 19820211 2021212 005\nE-Mail : fettyanggraeny.if[at]upnjatim.ac.id\nJabatan Struktural : Koordinator Program Studi Informatika\nJabatan Fungsional : Dosen - Lektor\nKeahlian : Digital Image Processing, Computer Vision\n',
                  ),
                  buildFacultyMember(
                    'assets/doseninfor/infordBasuki.png',
                    'Dr. Basuki Rahmat, S.Si. MT.\nNIP : 19690723 2021211 002\nE-Mail : basukirahmat.if[at]upnjatim.ac.id\nJabatan Struktural : Wakil Dekan III, Fakultas Ilmu Komputer\nJabatan Fungsional : Dosen - Lektor\nKeahlian : A.I and IoT Programming\n',
                  ),
                  buildFacultyMember(
                    'assets/doseninfor/infordIntan.png',
                    'Intan Yuniar Purbasari, S.Kom. MSc.\nNPT : 3 8006 04 0198 1\nE-Mail : intanyuniar.if[at]upnjatim.ac.id\nJabatan Struktural : Dosen Program Studi Informatika\nJabatan Fungsional :\nKeahlian :\n',
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Laman Website Resmi',
              showOfficialWebsite,
              (value) {
                setState(() {
                  showOfficialWebsite = value;
                });
              },
              Column(
                children: [
                  ListTile(
                    title: Text(
                      'Websites: https://if.upnjatim.ac.id',
                      style: TextStyle(
                        color: Colors.blue, // Set text color to blue
                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                    leading: Icon(Icons.link),
                    onTap: () {
                      _launchWebsite(
                          'https://if.upnjatim.ac.id'); // Use _launchWebsite function
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Email: informatika@upnjatim.ac.id',
                      style: TextStyle(
                        color: Colors.blue, // Set text color to blue
                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                    leading: Icon(Icons.link),
                    onTap: () {
                      _launchEmail(
                          'informatika@upnjatim.ac.id'); // Use _launchEmail function
                    },
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Mahasiswa Berprestasi',
              showFacultyMembers,
              (value) {
                setState(() {
                  showFacultyMembers = value;
                });
              },
              Column(
                children: [
                  buildFacultyMember(
                    'assets/inforpride/satu.png',
                    'Congrats Ghabriella Auranizza Fransrico!\n23081010028\nJuara 2 International Karate Championsship UNESA Rektor Cup',
                  ),
                  buildFacultyMember(
                    'assets/inforpride/dua.png',
                    'Congrats Bayu Setya Aji\nJuara 2 Kyorugi Festival Putra Diselenggarakan oleh Pangdam V Brawijaya 09-10 Juni 2023 di Gor Hayam Wuruk Kodam V Brawijaya\n',
                  ),
                  buildFacultyMember(
                    'assets/inforpride/tiga.png',
                    'Congrats Yuaini Pranajelita\nJuara 1 Poomsoe Beregu Senior Putri',
                  ),
                  buildFacultyMember(
                    'assets/inforpride/empat.png',
                    'Congrats Nurkholis Amanullah, Muhammada Hakam Fardana, Kaisar Fauzan\nTop 20 Product Based Capstone Project Bangkit 2023 dari 787 Tim Bangkit Academy 2023 Batch 1 dengan Nama Project: Eco Route (carbon Emission Tracker)',
                  ),
                ],
              ),
            ),
          ],
        );

      case 'Sistem Informasi':
        return Column(
          children: [
            buildMenuTile(
              'Profile',
              showProfileDescription,
              (value) {
                setState(() {
                  showProfileDescription = value;
                });
              },
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Selamat belajar dan berlatih kepada seluruh mahasiswa sistem informasi. Dahulukan akhlak mulia sebelum ilmu, supaya keberkahan senantiasa menyertaimu. Ingatlah selalu bahwa Allah SWT, atas kehendak-Nya telah memberikan kesempatan utk bisa belajar di kampus dan program studi tercinta ini. Dan ingatlah pula, kedua orang tua yg telah mengorbankan dan memberikan apa yg beliau berdua punya untuk membiayai kuliah kalian. Torehkan karya dan prestasi yang akan membuat mereka tersenyum bangga. Semoga kalian akan dapatkan apa yg dicita-citakan nanti. Amin ya Robbal alamin.\nAgung Brastama Putra, S.Kom, M.Kom (Koordinator Program Studi)',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 8),
            buildMenuTile(
              'Visi & Misi',
              showVisionMission,
              (value) {
                setState(() {
                  showVisionMission = value;
                });
              },
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'VISI KEILMUAN PROGRAM STUDI\nVisi Prodi Sistem Informasi adalah menjadi program studi yang unggul berkarakter bela negara. Visi tersebut diwujudkan ke dalam roadmap keilmuan program studi untuk membangun Smart Village (Desa Cerdas) dengan dukungan teknologi/sistem informasi.\n\nTUJUAN PENDIDIKAN PROGRAM STUDI\nMenghasilkan lulusan yang memiliki pengetahuan, dan kompetensi di bidang manajemen, perencanaan, analisis, desain, pengembangan, evaluasi, audit, dan tata kelola produk sistem informasi untuk mendukung tujuan organisasi/bisnis. Menghasilkan lulusan yang beretika, mampu berliterasi, berkomunikasi dan berkolaborasi dengan baik, serta mempunyai jiwa kreatif, inovatif, dan adaptif terhadap dinamika organisasi/bisnis yang terus berubah sesuai dengan tren perkembangan jaman. Menghasilkan lulusan yang cinta tanah air, cerdas berbangsa dan bernegara, yakin Pancasila sebagai dasar negara, rela berkorban untuk bangsa dan negara, serta memiliki kemampuan awal bela negara.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            buildMenuTile(
              'Akreditasi',
              showProfileDescription,
              (value) {
                setState(() {
                  showProfileDescription = value;
                });
              },
              Text('Sistem Informasi Terakreditasi Sangat Baik'),
            ),
            buildMenuTile(
              'Ketua Program Studi',
              showProgramHead,
              (value) {
                setState(() {
                  showProgramHead = value;
                });
              },
              Column(
                children: [
                  Image.asset(
                    'assets/dosensifo/koordAgung.png',
                    height: 200,
                  ),
                  const SizedBox(height: 8),
                  Text(
                      'AGUNG BRASTAMA PUTRA, S.Kom, M.Kom\n\nPENDIDIKAN\n\nS2 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Sistem Informasi Institut Bisnis dan Informatika Stikom Surabaya (STIKOM) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nModeling and Simulation System Dynamics.\nSoftware Development.\nSystem Engineering.\nGoogle Scholar\nSinta Jurnal '),
                ],
              ),
            ),
            buildMenuTile(
              'Dosen',
              showFacultyMembers,
              (value) {
                setState(() {
                  showFacultyMembers = value;
                });
              },
              Column(
                children: [
                  buildFacultyMember(
                    'assets/dosensifo/koordAgung.png',
                    'AGUNG BRASTAMA PUTRA, S.Kom, M.Kom\n\nPENDIDIKAN\n\nS2 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Sistem Informasi Institut Bisnis dan Informatika Stikom Surabaya (STIKOM) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nModeling and Simulation System Dynamics.\nSoftware Development.\nSystem Engineering.\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/pncw.png',
                    'NUR CAHYO WIBOWO, S.Kom, M.Kom\n\nPENDIDIKAN\n\nS2 Teknik Informatika Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Teknik Informatika Institut Teknologi Sepuluh Nopember (ITS) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nJaringan Komputer\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/ppmk.png',
                    'PRISA MARGA KUSUMANTARA, S.Kom, M.Cs\n\nPENDIDIKAN\n\nS2 Ilmu Komputer Universitas Gajah Mada (UGM) Jogjakarta\nS1 Teknik Informatika Institut Teknologi Sepuluh Nopember (ITS) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nMobile & Web Programming\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/pirwan.png',
                    'MOHAMAD IRWAN AFANDI, ST, M.Sc.\n\nPENDIDIKAN\n\nS2 Computer Science, Eastern Kentucky University, USA\nS1 Sekolah Tinggi Teknologi Telekomunikasi (STT TELKOM) Bandung\n\nBIDANG MINAT & PUBLIKASI\n\nData Mining\nTata Kelola\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/pdoddy.png',
                    'DODDY RIDWANDONO, S.Kom. M.Kom\n\nPENDIDIKAN\n\nS2 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Sistem Informasi Institut Bisnis dan Informatika Stikom Surabaya (STIKOM) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nSoftware Engineering.\nSystem Analys.\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/bsiti.png',
                    'SITI MUKAROMAH, S.Kom, M.Kom\n\nPENDIDIKAN\n\nS2 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Sistem Informasi Institut Bisnis dan Informatika Stikom Surabaya (STIKOM) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nIS Audit\nIT Governance\nDesktop Programming\nSystem Analyst\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/brizka.png',
                    'RIZKA HADIWIYANTI, S.Kom, M.Kom, MBA\n\nPENDIDIKAN\n\nS2 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nDatabase\nERP & CRM\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/beka.png',
                    'EKA DYAR WAHYUNI, S.Kom, M.Kom\n\nPENDIDIKAN\n\nS2 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nData Mining\nWeb Programming\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/bamal.png',
                    'AMALIA ANJANI ARIFIYANTI, S.Kom., M.Kom.\n\nPENDIDIKAN\n\nS2 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nData Mining\nWeb Programming\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/plathif.png',
                    'TRI LATHIF MARDI SURYANTO, S.Kom, MT\n\nPENDIDIKAN\n\nS2 Ilmu Komputer Atma Jaya Jogjakarta\nS1 Sistem Informasi UPN Veteran Jawa Timur (UPN) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nEvaluation IT\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/pasif.png',
                    'ASIF FAROQI, S.Kom, M.Kom.\n\nPENDIDIKAN\n\nS2 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nSoftware Engineering\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/paris.png',
                    'ARISTA PRATAMA, S.Kom, M.Kom.\n\nPENDIDIKAN\n\nS2 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Sistem Informasi Universitas Airlangga (UNAIR) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nSoftware Engineering\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/pAgus.png',
                    'Dr. Eng. AGUSSALIM, M.T.\n\nPENDIDIKAN\n\nS3 Computer Science, Kyushu Institute of Technology Japan\nS2 Teknik Informatika Universitas Hasanudin (UNHAS) Makassar\nS1 Universitas Negeri Makassar\n\nBIDANG MINAT & PUBLIKASI\n\nPemodelan & Simulasi\nJaringan Komputer\nFuture Internet Technology\nInternet of Things\nDelay Tolerant Network\nGoogle Scholar\nSinta Jurnal\nResearchgate\n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/bmy.png',
                    'ERISTYA MAYA SAFITRI, S.Kom, M.Kom.\n\n\n\nPENDIDIKAN\n\nS2 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nSoftware Engineering\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/banita.png',
                    'ANITA WULANSARI, S.Kom, M.Kom.\n\nPENDIDIKAN\n\nS2 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nBIDANG MINAT & PUBLIKASI\n\nSoftware Engineering\nTata Kelola\nGoogle Scholar\nSinta Jurnal\n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/pd.png',
                    'DHIAN SATRIA YUDHA KARTIKA, S.Kom, M.Kom\n\nPENDIDIKAN\n\nS2 Informatika Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Teknik Informatika Universitas Pembangunan Nasional (UPN) Veteran Jawa Timur\nD3 Sistem Informasi Universitas Airlangga (UNAIR)\n\nBIDANG MINAT & PUBLIKASI\n\nCitra Digital\nBasis Data\nData Mining\nSoftware Engineering\nGoogle Scholar\nSinta Jurnal  \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/bseftin.png',
                    'SEFTIN FITRI ANA WATI, S.Kom, M.Kom\n\nPENDIDIKAN\n\nS2 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Sistem Informasi Universitas Pembangunan Nasional (UPN) Veteran Jawa Timur\n\nBIDANG MINAT & PUBLIKASI\n\nSimulasi\nWeb Programming\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/banin.png',
                    'ANINDO SAKA FITRI, S.Kom, M.Kom.\n\nPENDIDIKAN\n\nS2 Sistem Informasi Institut Teknologi Sepuluh Nopember (ITS) Surabaya\nS1 Universitas Airlangga (UNAIR) Surabaya\n\nBIDANG MINAT & PUBLIKASI\n\nAnalysis and Design of Information System\nDecision Support System\nEnterprises System\nProcess Business Using Social Media\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/pefrat.png',
                    'ABDUL REZHA EFRAT NAJAF, S.Kom, M.Kom.\n\nPENDIDIKAN\n\nS2 Sistem Informasi Universitas Diponegoro (UNDIP) Semarang\nS1 Teknik Informatika Universitas Diponegoro (UNDIP) Semarang\nBIDANG MINAT & PUBLIKASI\n\nData Miningn\nSistem Pendukung Keputusan\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                  buildFacultyMember(
                    'assets/dosensifo/breisa.png',
                    'REISA PERMATASARI, S.T, M.Kom.\n\nPENDIDIKAN\n\nS2 Sistem Informasi – Institut Teknologi Sepuluh Nopember, Surabaya\nS2 System & Control – Gheorghe Asachi Technical University of Iasi, Romania\nS1 Teknik Informatika – Universitas Islam Negeri Sunan Gunung Djati Bandung\n\nBIDANG MINAT & PUBLIKASI\n\nSoftware Engineering\nGoogle Scholar\nSinta Jurnal \n',
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Laman Website Resmi',
              showOfficialWebsite,
              (value) {
                setState(() {
                  showOfficialWebsite = value;
                });
              },
              Column(
                children: [
                  ListTile(
                    title: Text(
                      'Websites: https://sisfo.upnjatim.ac.id',
                      style: TextStyle(
                        color: Colors.blue, // Set text color to blue
                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                    leading: Icon(Icons.link),
                    onTap: () {
                      _launchWebsite(
                          'https://sisfo.upnjatim.ac.id'); // Use _launchWebsite function
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Email: piasifo@upnjatim.ac.id',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    leading: Icon(Icons.link),
                    onTap: () {
                      _launchEmail('piasifo@upnjatim.ac.id');
                    },
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Mahasiswa Berprestasi',
              showFacultyMembers,
              (value) {
                setState(() {
                  showFacultyMembers = value;
                });
              },
              Column(
                children: [
                  buildFacultyMember(
                    'assets/sifopride/satu.png',
                    ' Congrats Rizka Fiddiyansyah, Moh. Azzam Priyanto, Rohmat Ubaidillah fahmi\nRunner-Up Social Good Pitch GARUDA HACKS 3.0 2022',
                  ),
                  buildFacultyMember(
                    'assets/sifopride/dua.png',
                    'SCongrats Sujatmiko Dwi Kuncoro\nJuara Finalis Lomba Baca Puisi Tingkat Nasional',
                  ),
                  buildFacultyMember(
                    'assets/sifopride/tiga.png',
                    'Conggrats Rendi Panca Wijanarko\nJuara 3 Speech Contest The Office Explorer 7.0 Universitas Negeri Jakarta',
                  ),
                  buildFacultyMember(
                    'assets/sifopride/empat.png',
                    'Congrats Ratih Aisyah IISMA CO-FUNDING 2023 Acceptance to Lancaster University',
                  ),
                ],
              ),
            ),
          ],
        );

//SADA
      case 'Sains Data':
        return Column(
          children: [
            buildMenuTile(
              'Profile',
              showProfileDescription,
              (value) {
                setState(() {
                  showProfileDescription = value;
                });
              },
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Sains Data merupakan ilmu terapan yang secara khusus mempelajari dan menganalisis data. Fungsi ilmu Sains Data dalam era digital dan big data saat ini cukup penting karena begitu melimpahnya data yang tersedia. Data menyediakan informasi yang dapat menentukan keputusan penting dalam berbagai sektor industri.\nSains Data adalah ilmu multidisipliner yang dapat diterapkan di berbagai bidang. Sains Data dapat diterapkan di bidang kesehatan, pemerintahan, bisnis, perbankan, keuangan, manufaktur, pemasaran, dan lain-lain.\nSeorang Data Scientist atau Ilmuwan Data biasanya tidak hanya memiliki ilmu Sains Data, tapi juga ilmu Teknik, Kesehatan, Jurnalistik, Hukum, Ekonomi, Sosiologi, Kimia, Farmasi, dan lain-lain. Dengan alasan yang sama bahwa Sains Data sebelumnya hanya dipelajari pada jenjang Magister atau S2, dengan latarbelakang pendidikan S1 yang beragam.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 8),
            buildMenuTile(
              'Visi & Misi',
              showVisionMission,
              (value) {
                setState(() {
                  showVisionMission = value;
                });
              },
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0), // Rata kiri dan kanan
                child: Text(
                  'Visi Keilmuan\nMenjadi program studi sains data yang unggul di bidang Kecerdasan Buatan dan Big data untuk industri 4.0 berkarakter Bela Negara.\n\n Misi Program Studi Sains Data\n1. Menyelenggarakan pendidikan terbaik di bidang kecerdasan buatan dan Big Data bagi para mahasiswa agar mampu menjadi lulusan yang handal, berkarakter Bela Negara, dan berwawasan global dan siap menghadapi tantangan di tengah revolusi industri 4.0.\n2. Menyelenggarakan penelitian dan pengembanagn ilmu pengetahuan di bisang kecerdasan buatan dan Big Data yang memberikan dampak pada kemajuan disiplin akademik dan profesional.\n3. Menyelenggarakan pengabdian kepada masyarakat dengan menerapkan ilmu-ilmu di bidang kecerdasan buatan dan Big Data.\n4. Melaksanakan tata kelola yang baik dan bersih dalam rangka mencapai pengelolaan anggaran yang akuntabel.\n5. Menggembangkan kualitas Sumber Daya Manusia yang memiliki karakter unggul, handal, cerdas, dan berjiwa kepemimpinan.\n6. Mengembangkan sistem pengelolaan sarana dan prasarana terintegrasi yang mendukung operasional.\n7. Menjalin kerjasama daengan masyarakat, intuisi, dan lembaga pemerintah maupun swasta untuk terus meningkatkan kualitas kegiatan dan hasil tridarma perguruan tinggi.',
                  textAlign: TextAlign.justify, // Atur rata kiri dan kanan
                ),
              ),
            ),
            buildMenuTile(
              'Akreditasi',
              showAccreditation,
              (value) {
                setState(() {
                  showAccreditation = value;
                });
              },
              Column(
                children: [
                  Image.asset(
                    '',
                    height: 200,
                  ),
                  const SizedBox(height: 8),
                  Text('Sains Data Terakreditasi Baik'),
                ],
              ),
            ),
            buildMenuTile(
              'Ketua Program Studi',
              showProgramHead,
              (value) {
                setState(() {
                  showProgramHead = value;
                });
              },
              Column(
                children: [
                  Image.asset(
                    'assets/dosensada/satu.png',
                    height: 200,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0), // Rata kiri dan kanan
                    child: Text(
                      'Dr.Eng.Ir.Dwi Arman Prasetya.,ST.,MT.,IPU., Asean. Eng\n\nPendidikan:\nS1 Teknik Elektro, Institut Teknologi Sepuluh Nopember\nS2 Teknik Elektro, Universitas Brawijaya Malang\nS3 Systems Innovation Engineering, The University of Tokushima Japan\n\nBidang Minat:\nSwarm robotics\nBiomedical engineering\nArtificial intelligence\nInternet of things',
                      textAlign: TextAlign.justify, // Atur rata kiri dan kanan
                    ),
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Dosen',
              showFacultyMembers,
              (value) {
                setState(() {
                  showFacultyMembers = value;
                });
              },
              Column(
                children: [
                  buildFacultyMember(
                    'assets/dosensada/satu.png',
                    'Dr.Eng.Ir.Dwi Arman Prasetya.,ST.,MT.,IPU., Asean. Eng\n\nPendidikan:\nS1 Teknik Elektro, Institut Teknologi Sepuluh Nopember\nS2 Teknik Elektro, Universitas Brawijaya Malang\nS3 Systems Innovation Engineering, The University of Tokushima Japan\n\nBidang Minat:\nSwarm robotics\nBiomedical engineering\nArtificial intelligence\nInternet of things',
                  ),
                  buildFacultyMember(
                    'assets/dosensada/dua.png',
                    'Mohammad Idhom, S.P., S.Kom., M.T.\n\nPendidikan:\nS1 , Universitas Pembangunan Nasional “Veteran” Jawa Timur\nS2 , Universitas Atma Jaya Yogyakarta\n\nBidang Minat:\nIT Service Management\nSoftware Engineering\nNetwork Security\nAudit IT',
                  ),
                  buildFacultyMember(
                    'assets/dosensada/tiga.png',
                    'Wahyu Syaifullah Jauharis Saputra, S.Kom., M.Kom\n\nPendidikan:\nS1 Teknik Informatika, Universitas Pembangunan Nasional “Veteran” Jawa Timur\nS2 informatika, Institut Teknologi Sepuluh Nopember\n\nBidang Minat:\nData Scientist\nData Analyst\nKecerdasan Buatan\nAlgoritma Pemrograman\n Visi Komputer',
                  ),
                  buildFacultyMember(
                    'assets/dosensada/empat.png',
                    'Kartika Maulida Hindrayani S.Kom, M.Kom\n\nPendidikan:\nS1 Sistem Informasi, Institut Teknologi Sepuluh Nopember\nS2 Sistem Informasi, Institut Teknologi Sepuluh Nopember\n\nBidang Minat:\nOptimization\nHyperheuristics\nBusiness Intelligence\nData Mining',
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Laman Website Resmi',
              showOfficialWebsite,
              (value) {
                setState(() {
                  showOfficialWebsite = value;
                });
              },
              Column(
                children: [
                  ListTile(
                    title: Text(
                      'Websites: https://sada.upnjatim.ac.id/',
                      style: TextStyle(
                        color: Colors.blue, // Set text color to blue
                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                    leading: Icon(Icons.link),
                    onTap: () {
                      _launchWebsite(
                          'https://sada.upnjatim.ac.id'); // Use _launchWebsite function
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Email: ds@upnjatim.ac.id',
                      style: TextStyle(
                        color: Colors.blue, // Set text color to blue
                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                    leading: Icon(Icons.link),
                    onTap: () {
                      _launchEmail(
                          'ds@upnjatim.ac.id'); // Use _launchEmail function
                    },
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Mahasiswa Berprestasi',
              showFacultyMembers,
              (value) {
                setState(() {
                  showFacultyMembers = value;
                });
              },
              Column(
                children: [
                  buildFacultyMember(
                    'assets/sadapride/satu.png',
                    'Congrats Muhammad Ghinan Navsih\nAwardee IISMA 2024\nKTH Royal Institute of Technology',
                  ),
                  buildFacultyMember(
                    'assets/sadapride/dua.png',
                    'Silver Medal (Engineering category) YISF 2024 (YOUTH INTERNATIONAL SCIENCE FAIR)',
                  ),
                  buildFacultyMember(
                    'assets/sadapride/tiga.png',
                    'Congrats Ach. Arif Setiawan\n Juara 1 GENBI Infographics Competition 2023',
                  ),
                ],
              ),
            ),
          ],
        );

//Bisnis Digital
      case 'Bisnis Digital':
        return Column(
          children: [
            buildMenuTile(
              'Profile',
              showProfileDescription,
              (value) {
                setState(() {
                  showProfileDescription = value;
                });
              },
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Teknologi Bisnis Digital merupakan ilmu terapan yang secara khusus mempelajari dan menganalisis bisnis melalui teknologi Informasi sebagai dasar dalam pengembangan dan menemukan bisnis secara digital. Fungsi ilmu Teknologi Bisnis Digital dalam era digital dan big data saat ini cukup penting karena begitu melimpahnya data yang tersedia. Data menyediakan informasi yang dapat menentukan keputusan penting dalam berbagai sektor industri.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 8),
            buildMenuTile(
              'Visi & Misi',
              showVisionMission,
              (value) {
                setState(() {
                  showVisionMission = value;
                });
              },
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0), // Rata kiri dan kanan
                child: Text(
                  'Visi\n“Menjadi Program Studi yang Unggul di Bidang Intelligent Business untuk Industri 4.0 dan Society 5.0 Berkarakter Bela Negara”.\n\nMisi\n1.Menyelenggarakan pendidikan terbaik di bidang Teknologi Bisnis Digital bagi para mahasiswa agar mereka mampu menjadi Sumber Daya Manusia handal, berdaya saing, unggul, dan berwawasan global dan siap menghadapi tantangan di tengah revolusi industri 4.0 dan society 5.0.\n2. Menyelenggarakan penelitian dan pengembangan ilmu pengetahuan di bidang Teknologi Bisnis Digital yang memberikan dampak pada kemajuan disiplin akademik dan profesional.\n3. Menyelenggarakan pengabdian kepada masyarakat dengan menerapkan ilmu-ilmu di bidang Teknologi Bisnis Digital.\n4. Menjalin kerjasama dengan masyarakat, institusi, dan lembaga pemerintah maupun swasta untuk terus meningkatkan kualitas kegiatan dan hasil tridarma perguruan tinggi.',
                  textAlign: TextAlign.justify, // Atur rata kiri dan kanan
                ),
              ),
            ),
            buildMenuTile(
              'Akreditasi',
              showAccreditation,
              (value) {
                setState(() {
                  showAccreditation = value;
                });
              },
              Column(
                children: [
                  Image.asset(
                    '',
                    height: 200,
                  ),
                  const SizedBox(height: 8),
                  Text('Bisnis Digital Terakreditasi Baik'),
                ],
              ),
            ),
            buildMenuTile(
              'Ketua Program Studi',
              showProgramHead,
              (value) {
                setState(() {
                  showProgramHead = value;
                });
              },
              Column(
                children: [
                  Image.asset(
                    'assets/koorbd.png',
                    height: 200,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0), // Rata kiri dan kanan
                    child: Text(
                      'Sugiarto, S.Kom., M.Kom',
                      textAlign: TextAlign.justify, // Atur rata kiri dan kanan
                    ),
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Dosen',
              showFacultyMembers,
              (value) {
                setState(() {
                  showFacultyMembers = value;
                });
              },
              Column(
                children: [
                  buildFacultyMember(
                    'assets/koorbd.png',
                    'Sugiarto, S.Kom., M.Kom',
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Laman Website Resmi',
              showOfficialWebsite,
              (value) {
                setState(() {
                  showOfficialWebsite = value;
                });
              },
              Column(
                children: [
                  ListTile(
                    title: Text(
                      'Websites: https://bisdi.upnjatim.ac.id',
                      style: TextStyle(
                        color: Colors.blue, // Set text color to blue
                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                    leading: Icon(Icons.link),
                    onTap: () {
                      _launchWebsite(
                          'https://bisdi.upnjatim.ac.id'); // Use _launchWebsite function
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Email: bisdi@upnjatim.ac.id',
                      style: TextStyle(
                        color: Colors.blue, // Set text color to blue
                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                    leading: Icon(Icons.link),
                    onTap: () {
                      _launchEmail(
                          'bisdi@upnjatim.ac.id'); // Use _launchEmail function
                    },
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Mahasiswa Berprestasi',
              showStudentAchievements,
              (value) {
                setState(() {
                  showProfileDescription = value;
                });
              },
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Belum Terdata',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        );

//S2
      case 'Magister Teknologi Informasi':
        return Column(
          children: [
            buildMenuTile(
              'Profile',
              showProfileDescription,
              (value) {
                setState(() {
                  showProfileDescription = value;
                });
              },
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Selamat Datang di Program STudi Magister Teknologi Informasi. Tujuan Program Studi Magister Teknologi Informasi adalah:\n1. Mendidik dan menghasilkan lulusan menjadi akademisi, ilmuwan dan ahli di bidang teknologi informasi, khususnya di bidang sistem cerdas, keamanan siber, manajemen jaringan dan manajemen infrastruktur TI.\n2. Melatih dan menghasilkan lulusan yang mampu berpikir kritis, berinovasi, dan mampu berkembang melalui proses pembelajaran sepanjang hayat.\n3. Mendidik dan menghasilkan lulusan yang berdaya saing dan mandiri untuk bersaing di tingkat nasional dan internasional di bidang Teknologi Informasi melalui kemampuan melakukan penelitian dan publikasi ilmiah.\n4. Mendidik dan menghasilkan lulusan yang mampu berkontribusi kepada masyarakat dengan penerapan ilmu pengetahuan dalam bidang teknologi informasi.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 8),
            buildMenuTile(
              'Visi & Misi',
              showVisionMission,
              (value) {
                setState(() {
                  showVisionMission = value;
                });
              },
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0), // Rata kiri dan kanan
                child: Text(
                  'Visi\n “Menjadi Program Studi yang Unggul di Bidang Teknologi Informasi berbasis Sistem Cerdas yang Berkarakter Bela Negara”\n\nMisi\n1. Menyelenggarakan pendidikan Magister Teknologi Informasi yang berkualitas dan berkarakter bela negara untuk menghasilkan lulusan yang bermutu dan berdaya saing di tingkat lokal, nasional, dan internasional.\n2. Menyelenggarakan penelitian yang berkualitas untuk menghasilkan publikasi tingkat nasional, internasional, serta hak kekayaan atas intelektual, buku ajar, kebijakan dan teknologi yang berhasil guna dan berdaya guna dalam bidang Teknologi Informasi.\n3. Menyelenggarakan pengabdian kepada masyarakat sebagai pengembangan dan penerapan teknologi informasi dengan mengedepankan sumber daya lokal melalui layanan implementasi, konsultasi, pendampingan, dan pelatihan.\n4. Menjalin kerjasama dengan berbagai lembaga, baik di dalam maupun diluar negeri',
                  textAlign: TextAlign.justify, // Atur rata kiri dan kanan
                ),
              ),
            ),
            buildMenuTile(
              'Akreditasi',
              showAccreditation,
              (value) {
                setState(() {
                  showAccreditation = value;
                });
              },
              Column(
                children: [
                  Image.asset(
                    '',
                    height: 200,
                  ),
                  const SizedBox(height: 8),
                  Text('Magister Teknologi Informasi Terakreditasi Baik'),
                ],
              ),
            ),
            buildMenuTile(
              'Ketua Program Studi',
              showProgramHead,
              (value) {
                setState(() {
                  showProgramHead = value;
                });
              },
              Column(
                children: [
                  Image.asset(
                    'assets/dosenmit/satu.png',
                    height: 200,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0), // Rata kiri dan kanan
                    child: Text(
                      'Dr. Basuki Rahmat, S.Si., MT\nEmail : basukirahmat.if@upnjatim.ac.id\nBidang Keahlian : Artificial Intelligence, Drones and Robotics, Hybrid Control System, Python-Matlab Programming\nPendidikan Asal Universitas : S1 Institut Teknologi Sepuluh Nopember, S2 Institut Teknologi Bandung, S3 Institut Teknologi Sepuluh Nopember.',
                      textAlign: TextAlign.justify, // Atur rata kiri dan kanan
                    ),
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Dosen',
              showFacultyMembers,
              (value) {
                setState(() {
                  showFacultyMembers = value;
                });
              },
              Column(
                children: [
                  buildFacultyMember(
                    'assets/dosenmit/satu.png',
                    'Dr. Basuki Rahmat, S.Si., MT\nEmail : basukirahmat.if@upnjatim.ac.id\nBidang Keahlian : Artificial Intelligence, Drones and Robotics, Hybrid Control System, Python-Matlab Programming\nPendidikan Asal Universitas : S1 Institut Teknologi Sepuluh Nopember, S2 Institut Teknologi Bandung, S3 Institut Teknologi Sepuluh Nopember.',
                  ),
                  buildFacultyMember(
                    'assets/dosenmit/dua.png',
                    'Dr. Gede Susrama Mas Diyasa, ST., MT., IPU\nEmail : igsusrama.if@upnjatim.ac.id\nBidang Keahlian : Image Processing, Biomedik, Computer Vision\nPendidikan Asal Universitas : S1 Institut Teknologi Adhi Tama Surabaya, S2 Institut Teknologi Sepuluh Nopember, S3 Institut Teknologi Sepuluh Nopember.',
                  ),
                  buildFacultyMember(
                    'assets/dosenmit/tiga.png',
                    'Dr. Eng. Agussalim, MT.\nEmail : agussalim.si@upnjatim.ac.id\nBidang Keahlian : Computer Networks, Store-Carry-Forward Networking, Multihop Wireless Networking, Delay Tolerant Networking, Software Defined Networking, Fog Computing\nPendidikan Asal Universitas : S1 Universitas Negeri Makassar, S2 Universitas Hasanuddin Makassar, S3 Kyushu Institute of Technology, Japan.',
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Laman Website Resmi',
              showOfficialWebsite,
              (value) {
                setState(() {
                  showOfficialWebsite = value;
                });
              },
              Column(
                children: [
                  ListTile(
                    title: Text(
                      'Websites: https://mti.upnjatim.ac.id',
                      style: TextStyle(
                        color: Colors.blue, // Set text color to blue
                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                    leading: Icon(Icons.link),
                    onTap: () {
                      _launchWebsite(
                          'https://mti.upnjatim.ac.id'); // Use _launchWebsite function
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Email: mti@upnjatim.ac.id',
                      style: TextStyle(
                        color: Colors.blue, // Set text color to blue
                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                    leading: Icon(Icons.link),
                    onTap: () {
                      _launchEmail(
                          'mti@upnjatim.ac.id'); // Use _launchEmail function
                    },
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Mahasiswa Berprestasi',
              showStudentAchievements,
              (value) {
                setState(() {
                  showProfileDescription = value;
                });
              },
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Belum Terdata',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        );

//El Profil
      case 'Profil: Deva Elmada Romadhana':
        return Column(
          children: [
            buildMenuTile(
              'Profile',
              showProfileDescription,
              (value) {
                setState(() {
                  showProfileDescription = value;
                });
              },
              Text(
                  'Nama Lengkap: Deva Elmada Romadhana\nNama Panggilan: Elmada'),
            ),
            const SizedBox(height: 8),
            buildMenuTile(
              'TTL',
              showVisionMission,
              (value) {
                setState(() {
                  showVisionMission = value;
                });
              },
              Text('Kediri, 23 November 2003'),
            ),
            buildMenuTile(
              'Alamat',
              showVisionMission,
              (value) {
                setState(() {
                  showVisionMission = value;
                });
              },
              Text(
                  'RT. 003, RW. 002, Dsn. Prambatan, Ds. Padangan, Kec. Kayen Kidul, Kab. Kediri, Prov. Jawa Timur'),
            ),
            buildMenuTile(
              'Laman',
              showOfficialWebsite,
              (value) {
                setState(() {
                  showOfficialWebsite = value;
                });
              },
              Column(
                children: [
                  ListTile(
                    title: Text('No. HP: +6289517750565'),
                    leading: Icon(Icons.link),
                    onTap: () {
                      _launchWebsite('https://wa.me/+6289517750565');
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Email: 22082010004@student.upnjatim.ac.id',
                      style: TextStyle(
                        color: Colors.blue, // Set text color to blue
                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                    leading: Icon(Icons.link),
                    onTap: () {
                      _launchEmail(
                          '22082010004@student.upnjatim.ac.id'); // Use _launchEmail function
                    },
                  ),
                  ListTile(
                    title: Text(
                      'URL Github: https://github.com/elmadaamada',
                      style: TextStyle(
                        color: Colors.blue, // Set text color to blue
                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                    leading: Icon(Icons.link),
                    onTap: () {
                      _launchWebsite('https://github.com/elmadaamada');
                    },
                  ),
                ],
              ),
            ),
            buildMenuTile(
              'Riwayat Pendidikan',
              showVisionMission,
              (value) {
                setState(() {
                  showVisionMission = value;
                });
              },
              Text(
                  'TK: RA. Kusuma Mulya\nSD: SDN Padangan II\nSMP: SMP Negeri I Plemahan\nSMA: SMA Negeri I Plemahan\n'),
            ),
          ],
        );
      default:
        return Container(); // Default case, can be replaced with specific handling
    }
  }

  Widget buildFacultyMember(String imagePath, String details) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Color.fromARGB(255, 255, 153, 0),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Color.fromARGB(255, 255, 153, 0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0), // Rata kiri dan kanan
            child: Text(
              details,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.prodi.label),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image(
                  image: AssetImage(widget.prodi.imageUrl),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.prodi.label,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              buildProdiDetail(),
            ],
          ),
        ),
      ),
    );
  }
}
