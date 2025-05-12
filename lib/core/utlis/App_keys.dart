import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AppKeys {
  static const String _urlSupabase = 'https://jjosilpphvsvvdlkqzti.supabase.co';
  static const String _anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impqb3NpbHBwaHZzdnZkbGtxenRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY5MDY5ODMsImV4cCI6MjA2MjQ4Mjk4M30.nJQqY7JP1uMdIy56-OkhYN0H9FU4x1STo_is_bsijHU';
  static Future<void> initializeSupabase() async {
    await Supabase.initialize(url: _urlSupabase, anonKey: _anonKey);
  }
}
