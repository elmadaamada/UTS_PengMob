import 'package:flutter/material.dart';
import 'prodi_detail.dart';
import 'prodi.dart';

void main() {
  runApp(const ProdiApp());
}

class ProdiApp extends StatelessWidget {
  const ProdiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fakultas Ilmu Komputer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProdiScreen(),
    );
  }
}

class ProdiScreen extends StatelessWidget {
  const ProdiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/logoweb.png',
              height: 180,
              width: 180,
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/calonheader.jpg'),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Text(
                          'Selamat Datang',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: Text(
                      'Fakultas Ilmu Komputer UPNVJT telah berperan aktif dalam mencerdaskan kehidupan bangsa, mengembangkan ilmu pengetahuan dan teknologi bidang teknologi informasi secara luas untuk membantu mengatasi berbagai persoalan bangsa dan mendukung peningkatan kesejahteraan masyarakat. Kegiatan Tri Dharma Perguruan Tinggi telah diimplementasikan dengan baik terbukti banyaknya skim hibah penelitian dan pengabdian masyarakat dari DRPM yang diterima dan dikerjakan oleh dosen-dosen FIK UPNVJT. Fakultas Ilmu Komputer telah banyak melakukan kerjasama dengan berbagai institusi dalam upaya mewujudkan visi dan misi yang diembannya.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: Prodi.samples.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProdiDetail(prodi: Prodi.samples[index]);
                        },
                      ),
                    );
                  },
                  child: buildRecipeCard(Prodi.samples[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecipeCard(Prodi prodi) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Color.fromARGB(255, 255, 123, 29),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Menggunakan CrossAxisAlignment.center
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                prodi.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                prodi.label,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
