// lib/services/quran_service.dart
import 'dart:convert';
import 'package:dit_ya/models/alquran_model.dart';
import 'package:http/http.dart' as http;


class QuranService {
  final String apiUrl = "https://api.npoint.io/99c279bb173a6e28359c/data";

  Future<List<ModelAlQuran>> fetchSuratList() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((item) => ModelAlQuran.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat data surat');
    }
  }
}