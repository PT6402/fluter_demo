import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_bloc.dart';
import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_event.dart';
import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_state.dart';
import 'package:demo_product_clear_architech/presentation/widgets/bottom_navigation_bar_cus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainWrapper extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainWrapper({super.key, required this.navigationShell});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;
  void _goToBrach(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  _onTapNav(index, context) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
      _goToBrach(_selectedIndex);
    } else {
      BlocProvider.of<AuthRemoteBloc>(context).add(const LogoutUser());
    }
  }

  _buildBody() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: widget.navigationShell,
    );
  }

  _buildAppBar() {
    return AppBar(
      title: BlocBuilder<AuthRemoteBloc, AuthRemoteState>(
        builder: (context, state) {
          if (state is LoggedInUserStateRemote) {
            return Text(state.user!.fullname!);
          } else {
            return const Text("fail");
          }
        },
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: MultiBlocListener(
        listeners: [
          BlocListener<AuthRemoteBloc, AuthRemoteState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                _selectedIndex = 1;
                context.goNamed("login");
              }

              if (state is RegisterGGSuccess) {
                _selectedIndex = 0;
                context.goNamed("home");
              }
            },
          )
        ],
        child: BottomNavigationBarCus(
          selectedIndex: _selectedIndex,
          onTap: (index) => _onTapNav(index, context),
        ),
      ),
    );
  }
}
