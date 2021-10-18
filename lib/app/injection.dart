import 'package:appidea/app/database/firestore/secao_dao_firestore.dart';
import 'package:appidea/app/database/firestore/tarefa_dao_firestore.dart';
import 'package:appidea/app/database/mysql/secao_dao_mysql.dart';
import 'package:appidea/app/database/mysql/tarefa_dao_mysql.dart';
import 'package:appidea/app/database/sqlite/dao/secao_dao_impl.dart';
import 'package:appidea/app/database/sqlite/dao/tarefa_dao_impl.dart';
import 'package:appidea/app/domain/interfaces/secao_dao.dart';
import 'package:appidea/app/domain/interfaces/tarefa_dao.dart';
import 'package:appidea/app/domain/services/secao_service.dart';
import 'package:appidea/app/domain/services/tarefa_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  getIt.registerSingleton<SecaoDAO>(SecaoDAOMySQL());
  getIt.registerSingleton<TarefaDAO>(TarefaDAOMySQL());
  // getIt.registerSingleton<SecaoDAO>(SecaoDAOImpl());
  // getIt.registerSingleton<SecaoDAO>(SecaoDAOFirestore());
  // getIt.registerSingleton<SecaoService>(SecaoService());
  // getIt.registerSingleton<TarefaDAO>(TarefaDAOImpl());
  // getIt.registerSingleton<TarefaDAO>(TarefaDAOFirestore());
  // getIt.registerSingleton<TarefaService>(TarefaService());
}