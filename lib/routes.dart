import 'package:go_router/go_router.dart';
import 'package:hassen_heavyfreight_flutter_test/authentification/screen/login.dart';
import 'package:hassen_heavyfreight_flutter_test/order/screens/form.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: Login.route,
        routes: <RouteBase>[
          GoRoute(
            path: FormPackage.route,
            builder: (context, state) => const FormPackage(),
          ),
          GoRoute(
            path: Login.route,
            builder: (context, state) => Login(),
          )
        ],
      
  );
}
