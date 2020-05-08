import 'package:onbills/models/bill.model.dart';
import 'package:onbills/models/imodel.dart';
import 'irepository.dart';

class BillsRepository implements IRepository {
  @override
  List<BillModel> getAll() {
    var bills = new List<BillModel>();

    List list = []; // obter do banco de dados SQL
    for (dynamic item in list) {
      BillModel bill = new BillModel(title: item["title"]);
      bills.add(bill);
    }

    return bills;
  }

  @override
  BillModel get() {
    return null;
  }

  @override
  bool insert(IModel bill) {
    print('insert');
    return true;
  }

  //@override
  bool update(IModel bill) {
    print('update');
    return true;
  }

  //@override
  bool delete(IModel bill) {
    print('delete');
    return true;
  }
}
