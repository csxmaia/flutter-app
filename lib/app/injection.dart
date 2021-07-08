import 'package:appidea/app/database/sqlite/dao/secao_dao_impl.dart';
import 'package:appidea/app/database/sqlite/dao/tarefa_dao_impl.dart';
import 'package:appidea/app/domain/interfaces/secao_dao.dart';
import 'package:appidea/app/domain/interfaces/tarefa_dao.dart';
import 'package:appidea/app/domain/services/secao_service.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<SecaoDAO>(SecaoDAOImpl());
  getIt.registerSingleton<SecaoService>(SecaoService());
  getIt.registerSingleton<TarefaDAO>(TarefaDAOImpl());
}