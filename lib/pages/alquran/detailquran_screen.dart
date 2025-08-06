import 'package:dit_ya/models/alquran_model.dart';
import 'package:flutter/material.dart';

class QuranDetailPage extends StatelessWidget {
  final ModelAlQuran surat;

  const QuranDetailPage({Key? key, required this.surat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: Text(surat.nama ?? 'Detail Surat'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    surat.asma ?? '',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    surat.arti ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                Text("Jumlah Ayat: ${surat.ayat}"),
                Text("Tipe: ${surat.type}"),
                Text("Urutan Pewahyuan: ${surat.urut}"),
                Text("Nomor: ${surat.nomor}"),
                Text("Rukuk: ${surat.rukuk}"),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 8),
                Text(
                  surat.keterangan ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
