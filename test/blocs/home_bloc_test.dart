import 'package:CoffeShopApp/models/item.dart';
import 'package:CoffeShopApp/pages/home/bloc/home_bloc.dart';
import 'package:CoffeShopApp/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockedRepository extends Mock implements Repository {}

void main() {
  MockedRepository mockRepository;
  HomeBloc homeBloc;
  final items = [
    Item.fromJson(
      {
        "name": "Classic Latte",
        "type": "coffee",
        "image": "lib/assets/drawable-hdpi/coffe_cup.png",
        "size": "Small",
        "topping": "Wipped Cream",
        "flavor": "Caramel",
        "favorite": "true",
        "price": "2.50"
      },
     
    ),
    Item.fromJson(
       {
        "name": "Hot Tea",
        "image": "lib/assets/drawable-hdpi/tea_cup.png",
        "type":"tea",
        "size": "Large",
        "topping": "Aloe Vera",
        "flavor": "Chamomile",
        "favorite": "false",
        "price": "4.50"
    },
    ),
  ];
  setUp(() {
    mockRepository = MockedRepository();
    homeBloc = HomeBloc(mockRepository);
    when(mockRepository.getallItens()).thenAnswer((_) => Future.value(items));
  });
  tearDown(() {
    homeBloc.close();
  });

  test('Bloc should emit a Item List without any filter', () {
    expect(
        homeBloc,
        emitsInOrder([
          HomeInitial(),
          HomeLoading(),
          FilteredItems(HomeTabs.recentOrders.index, items),
        ]));
  });

  test('Bloc should emit a Item List with the tea filter', () async {
    //Delay to avoid the override of events
    Future.delayed(Duration(milliseconds: 500)).then((value) => homeBloc.changeFilter(HomeTabs.tea.index));
    await expectLater(
        homeBloc,
        emitsInOrder([
          HomeInitial(),
          HomeLoading(),
          FilteredItems(HomeTabs.recentOrders.index, items),
          HomeLoading(),
          FilteredItems(HomeTabs.tea.index, homeBloc.getTeaList(items)),
        ]));
  });

  test('Bloc should emit a liked state', () async {
    //Delay to avoid the override of events
    Future.delayed(Duration(milliseconds: 500)).then((value) => homeBloc.add(LikeItem(true)));
    await expectLater(
        homeBloc,
        emitsInOrder([
          HomeInitial(),
          HomeLoading(),
          FilteredItems(HomeTabs.recentOrders.index, items),
          ItemLiked(true),
        ]));
  });
}
