import 'package:test/test.dart';
import 'package:task1/models/menu_model.dart';
import 'package:task1/services/menu_api.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'menu_api_test.mocks.dart';

@GenerateMocks([MenuApi])
void main() {
  group('MenuApi', () {
    MenuApi menuApi = MockMenuApi();
    test(
      'get all menu returns data',
      () async {
        when(menuApi.getMenu()).thenAnswer(
          (_) async => <MenuModel>[
            MenuModel(id: 1, name: 'naget'
            ),
          ]);
        var menus = await MenuApi().getMenu();
        expect(menus?.isNotEmpty, true);
      },
    );
  });
}
