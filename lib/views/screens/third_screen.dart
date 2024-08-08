import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_intern/constant/theme.dart';
import 'package:suitmedia_intern/core/provider/user_provider.dart';

class ThirdScreen extends StatefulWidget {
  static const String routeName = '/third-screen';

  const ThirdScreen({super.key});
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final GlobalKey<RefreshIndicatorState> _onRefreshKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    onRefresh();
  }

  Future onRefresh() async {
    await context.read<UserProvider>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Third Screen',
          style: blackTextStyle.copyWith(
            fontWeight: semibold,
            fontSize: 16,
          ),
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return RefreshIndicator(
            key: _onRefreshKey,
            onRefresh: onRefresh,
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              controller: userProvider.onScrollEvent(),
              itemCount:
                  userProvider.users.length + (userProvider.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= userProvider.users.length) {
                  return Center(
                    child: CircularProgressIndicator(color: primaryColor),
                  );
                }
                return SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          userProvider.users[index].avatar,
                        ),
                      ),
                      title: Text(
                        '${userProvider.users[index].firstName} ${userProvider.users[index].lastName}',
                        style: blackTextStyle.copyWith(
                          fontWeight: semibold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        userProvider.users[index].email,
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        userProvider.setSelectedUserName(
                            '${userProvider.users[index].firstName} ${userProvider.users[index].lastName}');
                        Navigator.pushNamed(context, '/second-screen');
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
