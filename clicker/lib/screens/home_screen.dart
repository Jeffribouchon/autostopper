import 'package:clicker/components/add_hashtag_component.dart';
import 'package:clicker/views/home_view.dart';
import 'package:clicker/views/list_hashtag_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
        children: const <Widget>[
          HomeView(),
          ListHashtagView(),
        ],
      ),
      floatingActionButton: const AddHashtagComponent(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          _pageController.jumpToPage(_currentIndex);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Hashtag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Sync.',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: const Color(0xff764abc)),
              accountName: Text(
                "Jean-François RIBOUCHON",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "jeff.ribouchon@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Partir'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.train),
              title: const Text('Voyager'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            AboutListTile(
              icon: Icon(Icons.info),
              child: Text('A propos'),
              applicationIcon: Icon(Icons.local_play),
              applicationName: 'My AutoStopper App',
              applicationVersion: '1.0.25',
              applicationLegalese: '© 2022 Company',
              aboutBoxChildren: [
                ///Content goes here...
              ],
            ),
          ],
        ),
      ),
    );
  }
}
