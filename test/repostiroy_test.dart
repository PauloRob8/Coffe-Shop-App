
import 'package:CoffeShopApp/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  TestWidgetsFlutterBinding.ensureInitialized();
  test('When read json file, should return a list of the Item class ', () async {
    final repository = Repository();
    final items = await repository.getallItens();
    expect(items.first.name,'Classic Latte');
    expect(items.last.name,'Iced Tea');
    expect(items.length, 6);
  });
}