import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hdt_flutter/models/restaurante_model.dart';
import 'package:hdt_flutter/providers/carrito_provider.dart';
import 'package:hdt_flutter/providers/menu_providers.dart';
import 'package:hdt_flutter/utils/const.dart';
import 'package:hdt_flutter/view/buscar_view.dart';
import 'package:hdt_flutter/view/carrito_view.dart';
import 'package:hdt_flutter/view/delivery_view.dart';
import 'package:hdt_flutter/view/detalle_restaurante_view.dart';
import 'package:hdt_flutter/view/favoritos_view.dart';
import 'package:hdt_flutter/view/home_view.dart';
import 'package:hdt_flutter/view/idioma_view.dart';
import 'package:hdt_flutter/view/login_view.dart';
import 'package:hdt_flutter/view/register_view.dart';
import 'package:hdt_flutter/view/menu_view.dart';
import 'package:hdt_flutter/view/mesas_view.dart';
import 'package:hdt_flutter/view/perfil_view.dart';
import 'package:hdt_flutter/view/platos_recomendados_view.dart';
import 'package:hdt_flutter/view/restaurante_view.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static GoRouter config() {
    return GoRouter(
      initialLocation: "/register",
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            final data = Provider.of<MenuProviders>(context);
            final carrito = Provider.of<CarritoProviders>(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                systemOverlayStyle: SystemUiOverlayStyle.light,
                iconTheme: const IconThemeData(color: Colors.black),
                centerTitle: true,
                elevation: 0,
                toolbarHeight: 80,
                title: Stack(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        state.location == "/"
                            ? Container(
                                height: 50,
                              )
                            : Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: InkWell(
                                  onTap: () {
                                    context.goNamed("perfil");
                                    data.setselect(0);
                                  },
                                  child: const ClipRRect(
                                    // borderRadius: BorderRadius.all(Radius.circular(100)),
                                    child: CircleAvatar(
                                      radius: 25,
                                      // backgroundColor: Colors.red[800]!, // Color de fondo en caso de error
                                      child: Text('A'),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    const Positioned(
                      left: -10,
                      top: -2,
                      child: Image(
                        image: AssetImage("assets/logo.png"),
                        width: 100,
                      ),
                    )
                  ],
                ),
              ),
              bottomNavigationBar: state.location == "/"
                  ? null
                  : BottomNavigationBar(
                      unselectedItemColor: secundario.withOpacity(0.6),
                      selectedIconTheme: IconThemeData(
                        color: secundario,
                      ),
                      iconSize: 40,
                      currentIndex: data.itemselect,
                      onTap: (value) {
                        data.setselect(value);
                        switch (value) {
                          case 0:
                            context.go("/home");
                            break;
                          case 1:
                            context.go("/buscar");
                            break;
                          case 2:
                            context.go("/carrito");
                            // context.goNamed("carrito");
                            break;
                          case 3:
                            context.go("/favoritos");
                            break;
                          case 4:
                            context.go("/delivery");
                            break;
                          default:
                        }
                      },
                      items: [
                        const BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined),
                          label: "",
                        ),
                        const BottomNavigationBarItem(
                          icon: Icon(Icons.search_outlined),
                          label: "",
                        ),
                        BottomNavigationBarItem(
                          icon: carrito.todoCarrito.isEmpty
                              ? const Icon(Icons.notifications_outlined)
                              : Stack(
                                  children: [
                                    const Icon(Icons.notifications),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          "${carrito.todoCarrito.length}",
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          // icon: Icon(Icons.shopping_cart_outlined),
                          label: "",
                        ),
                        const BottomNavigationBarItem(
                          icon: Icon(Icons.bookmark_outline),
                          label: "",
                        ),
                        const BottomNavigationBarItem(
                          icon: Icon(
                            Icons.moped_outlined,
                          ),
                          label: "",
                        ),
                      ],
                    ),
              body: child,
            );
          },
          routes: [
            GoRoute(
              path: '/',
              name: '/',
              pageBuilder: (context, state) {
                return NoTransitionPage<void>(
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                  child: const IdiomaView(),
                );
              },
            ),
            GoRoute(
              path: '/login',
              name: '/login',
              pageBuilder: (context, state) {
                return NoTransitionPage<void>(
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                  child: const LoginView(),
                );
              },
            ),
            GoRoute(
              path: '/register',
              name: '/register',
              pageBuilder: (context, state) {
                return NoTransitionPage<void>(
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                  child: const RegisterView(),
                );
              },
            ),
            GoRoute(
              path: '/home',
              name: '/home',
              pageBuilder: (context, state) {
                return NoTransitionPage<void>(
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                  child: const HomeView(),
                );
              },
              routes: [
                GoRoute(
                  path: 'restaurante',
                  name: 'restaurante',
                  pageBuilder: (context, state) {
                    return NoTransitionPage<void>(
                      key: state.pageKey,
                      restorationId: state.pageKey.value,
                      child: const RestaurantesView(),
                    );
                  },
                ),
                GoRoute(
                  path: 'perfil',
                  name: 'perfil',
                  pageBuilder: (context, state) {
                    return NoTransitionPage<void>(
                      key: state.pageKey,
                      restorationId: state.pageKey.value,
                      child: const PerfilView(),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/platosRecomendados',
              name: '/platosRecomendados',
              pageBuilder: (context, state) {
                RestauranteModels da = state.extra as RestauranteModels;
                return NoTransitionPage<void>(
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                  child: PlatosRecomendadosView(data: da),
                );
              },
            ),
            GoRoute(
              path: '/Menu',
              name: '/Menu',
              pageBuilder: (context, state) {
                RestauranteModels da = state.extra as RestauranteModels;
                // final RestauranteModels da = RestauranteModels(
                //   id: "id",
                //   nombre: "Restaurante ",
                //   descripcion: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur felis ante, placerat id blandit vitae, dapibus id mi. Nam lacus magna, aliquam ut mattis ut, porttitor sed quam. Vivamus erat.",
                //   estado: true,
                //   imagen: 'https://via.placeholder.com/640x480.png/a59090/000000?Text=640x480',
                //   mesas: List.generate(
                //     2,
                //     (index) => MesasModels(
                //       id: "id$index",
                //       nombre: "Mesa $index",
                //       descripcion: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur felis ante, placerat id blandit vitae, dapibus id mi. Nam lacus magna, aliquam ut mattis ut, porttitor sed quam. Vivamus erat.",
                //       estado: true,
                //       imagen: 'https://via.placeholder.com/640x480.png/a59090/000000?Text=640x480',
                //       canti: 4,
                //     ),
                //   ),
                //   menu: List.generate(
                //     5,
                //     (indexm) => MenuModels(
                //       id: "id$indexm",
                //       nombre: "Caldo de gallina criolla $indexm",
                //       descripcion: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur felis ante, placerat id blandit vitae, dapibus id mi. Nam lacus magna, aliquam ut mattis ut, porttitor sed quam. Vivamus erat.",
                //       estado: true,
                //       imagen: 'https://via.placeholder.com/640x480.png/a59090/000000?Text=640x480',
                //       recomendado: true,
                //       categoria: "categoria ${indexm ~/ 2}",
                //       ingredientes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur felis ante, placerat id blandit vitae, dapibus id mi. Nam lacus magna, aliquam ut mattis ut, porttitor sed quam. Vivamus erat.",
                //       precio: "precio",
                //     ),
                //   ),
                // );

                return NoTransitionPage<void>(
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                  child: MenuView(data: da),
                );
              },
            ),
            GoRoute(
              path: '/Mesas',
              name: '/Mesas',
              pageBuilder: (context, state) {
                RestauranteModels da = state.extra as RestauranteModels;
                return NoTransitionPage<void>(
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                  child: MesasView(data: da),
                );
              },
            ),
            GoRoute(
              path: '/detalleRestaurante',
              name: '/detalleRestaurante',
              pageBuilder: (context, state) {
                RestauranteModels da = state.extra as RestauranteModels;
                return NoTransitionPage<void>(
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                  child: DetalleRestauranteView(data: da),
                );
              },
            ),
            GoRoute(
              path: '/buscar',
              name: '/buscar',
              pageBuilder: (context, state) {
                return NoTransitionPage<void>(
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                  child: const BuscarView(),
                );
              },
            ),
            GoRoute(
              path: '/carrito',
              name: '/carrito',
              pageBuilder: (context, state) {
                return NoTransitionPage<void>(
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                  child: const CarritoView(),
                );
              },
            ),
            GoRoute(
              path: '/favoritos',
              name: '/favoritos',
              pageBuilder: (context, state) {
                return NoTransitionPage<void>(
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                  child: const FavoritosView(),
                );
              },
            ),
            GoRoute(
              path: '/delivery',
              name: '/delivery',
              pageBuilder: (context, state) {
                return NoTransitionPage<void>(
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                  child: const DeliveryView(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
