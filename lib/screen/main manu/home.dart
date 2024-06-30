import 'package:clickaeventsp/deshbord/deshbord.dart';
import 'package:clickaeventsp/screen/Setting/settings.dart';
import 'package:clickaeventsp/screen/main%20manu/searchPage.dart';
import 'package:clickaeventsp/screen/main%20manu/sub%20manu/navbar.dart';
import 'package:clickaeventsp/screen/profile/ProfilePage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _homeState();
}
  int currentTab = 0;
  final List<Widget> screens = [
     Deshbord(),
     SearchPage(),
     ProfilePage(),
     Settings()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Deshbord();


class _homeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
            notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                     minWidth: 40,
                      onPressed: (){
                       setState(() {
                         currentScreen = Deshbord();
                         currentTab = 0;
                       });
                      },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab ==  0? Colors.red : Colors.grey
                        ),
                        Text('Deshbord',
                          style: TextStyle(color: currentTab == 0 ? Colors.black : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = SearchPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            Icons.search,
                            color: currentTab ==  1? Colors.red : Colors.grey
                        ),
                        Text('Search',
                          style: TextStyle(color: currentTab == 1 ? Colors.black : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = ProfilePage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            Icons.person,
                            color: currentTab ==  3? Colors.red : Colors.grey
                        ),
                        Text('Profile',
                          style: TextStyle(color: currentTab == 3 ? Colors.black : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = Settings();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            Icons.settings,
                            color: currentTab ==  4? Colors.red : Colors.grey
                        ),
                        Text('Setting',
                          style: TextStyle(color: currentTab == 4 ? Colors.black : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



