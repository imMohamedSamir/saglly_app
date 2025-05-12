import 'dart:developer';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  final SupabaseClient _client = Supabase.instance.client;

  /// GET all rows or filtered
  Future<List<Map<String, dynamic>>> get({
    required String table,
    Map<String, dynamic>? filters,
    String? foreignTables, // NEW PARAM
  }) async {
    // Apply select with foreignTables if provided
    var query =
        foreignTables != null
            ? _client.from(table).select('*,$foreignTables')
            : _client.from(table).select();

    // Apply filters
    filters?.forEach((field, value) {
      if (value is String && value.contains('%')) {
        query = query.ilike(field, value);
      } else {
        query = query.eq(field, value);
      }
    });

    final response = await query;
    return List<Map<String, dynamic>>.from(response);
  }

  /// INSERT a new record
  Future<dynamic> insert({
    required String table,
    required dynamic values,
    bool isItems = false,
  }) async {
    if (isItems) {
      await _client.from(table).insert(values);
    } else {
      final response =
          await _client.from(table).insert(values).select().single();
      return response;
    }
  }

  /// UPDATE existing record by [id]
  Future<Map<String, dynamic>?> update({
    required String table,
    required String id,
    required Map<String, dynamic> values,
    String idField = 'id',
  }) async {
    final response =
        await _client
            .from(table)
            .update(values)
            .eq(idField, id)
            .select()
            .single();

    return response;
  }

  /// DELETE record by [id]
  Future<void> delete({
    required String table,
    required String id,
    String idField = 'id',
  }) async {
    await _client.from(table).delete().eq(idField, id);
  }

  /// GET with custom filter operators
  Future<List<Map<String, dynamic>>> getWithFilter({
    required String table,
    required String column,
    required dynamic value,
    String operator = 'eq',
  }) async {
    var query = _client.from(table).select();

    switch (operator) {
      case 'eq':
        query = query.eq(column, value);
        break;
      case 'neq':
        query = query.neq(column, value);
        break;
      case 'like':
        query = query.like(column, value);
        break;
      case 'ilike':
        query = query.ilike(column, value);
        break;
      case 'contains':
        query = query.contains(column, value);
        break;

      case 'gte':
        query = query.gte(column, value);
        break;
      case 'lte':
        query = query.lte(column, value);
        break;
      default:
        throw ArgumentError('Unsupported operator: $operator');
    }

    final response = await query;
    return List<Map<String, dynamic>>.from(response);
  }

  Future<String> signupWithEmail({
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signUp(
      password: password,
      email: email,
    );
    return response.user!.id;
  }

  Future<String> signinWithEmail({
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signInWithPassword(
      password: password,
      email: email,
    );
    return response.user!.id;
  }

  Future<void> uplodFile({
    required File file,
    required String id,
    required String path,
  }) async {
    final response = await _client.storage.from(id).upload(path, file);

    log(response);
  }

  Future<void> deleteFile({required String path}) async {
    await _client.storage.from("places").remove(["museums/$path"]);
  }

  String getFileUrl({required String path}) {
    final response = _client.storage
        .from("places")
        .getPublicUrl("museums/$path");
    return response;
  }

  void realTimeData({
    required String table,
    required void Function(List<Map<String, dynamic>>)? onData,
  }) async {
    _client.from(table).stream(primaryKey: ['id']).listen(onData);
  }
}
