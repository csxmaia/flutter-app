import 'package:appidea/app/domain/entities/secao.dart';

abstract class SecaoDAO {
  save(Secao secao);

  remove(int id);

  Future<List<Secao>> find();
}