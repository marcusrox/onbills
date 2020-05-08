import 'package:onbills/models/imodel.dart';

abstract class IRepository {
  List<IModel> getAll();

  IModel get();

  bool insert(IModel model);

  bool update(IModel model);

  bool delete(IModel model);

}