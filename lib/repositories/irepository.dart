import 'package:onbills/models/imodel.dart';

abstract class IRepository {
  List<IModel> getAll();

  IModel get();

  //bool insert(IModel model);
  Future<void> insert(IModel bill);

  bool update(IModel model);

  bool delete(IModel model);

}