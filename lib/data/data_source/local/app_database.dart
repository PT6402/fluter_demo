import 'dart:async';

import 'package:demo_product_clear_architech/data/data_source/local/dao/user_dao.dart';
import 'package:demo_product_clear_architech/data/model/user_model.dart';
import 'package:demo_product_clear_architech/domain/entities/type_login.dart';
import 'package:demo_product_clear_architech/domain/entities/type_role.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part "app_database.g.dart";

@Database(version: 1, entities: [UserModel])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
