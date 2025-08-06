import 'package:dit_ya/models/alquran_model.dart';
import 'package:dit_ya/pages/alquran/detailquran_screen.dart';
import 'package:dit_ya/service/alquran_servic.dart';
import 'package:flutter/material.dart';



class QuranListPage extends StatefulWidget {
  const QuranListPage({Key? key}) : super(key: key);

  @override
  _QuranListPageState createState() => _QuranListPageState();
}

class _QuranListPageState extends State<QuranListPage> {
  late Future<List<ModelAlQuran>> _futureSurat;

  @override
  void initState() {
    super.initState();
    _futureSurat = QuranService().fetchSuratList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text('Daftar Surat Al-Qur\'an'),
        backgroundColor: Colors.green[700],
      ),
      body: FutureBuilder<List<ModelAlQuran>>(
        future: _futureSurat,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data'));
          }

          final suratList = snapshot.data!;

          return ListView.builder(
            itemCount: suratList.length,
            itemBuilder: (context, index) {
              final surat = suratList[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.green[100],
                    child: Text(surat.nomor ?? "-"),
                  ),
                  title: Text(
                    surat.nama ?? "-",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "${surat.arti ?? '-'} • ${surat.ayat ?? 0} ayat",
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuranDetailPage(surat: surat),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}