import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'user_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/list');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/settings');
    }
  }

  final List<Map<String, String>> hadithData = [
    {
      "title": "Kesempurnaan Iman",
      "source": "HR. BUKHARI MUSLIM",
      "snippet": "Barang siapa beriman kepada Allah dan hari akhir hendaklah berkata baik atau...",
      "arabic": "مَنْ كَانَ يُؤْمِنُ بِاللَّهِ وَالْيَوْمِ الْآخِرِ فَلْيَقُلْ خَيْرًا أَوْ لِيَصْمُتْ",
      "translation": "Barang siapa beriman kepada Allah dan hari akhir hendaklah berkata baik atau diam."
    },
    {
      "title": "Niat",
      "source": "HR. BUKHARI MUSLIM",
      "snippet": "Sesungguhnya setiap amal tergantung pada niatnya.",
      "arabic": "إِنَّمَا الأَعْمَالُ بِالنِّيَّاتِ",
      "translation": "Sesungguhnya setiap amal tergantung pada niatnya."
    },
    {
      "title": "Kebersihan",
      "source": "HR. MUSLIM",
      "snippet": "Kebersihan adalah sebagian dari iman.",
      "arabic": "الطُّهُورُ شَطْرُ الإِيمَانِ",
      "translation": "Kebersihan adalah sebagian dari iman."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildContentBody(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.blue[900],
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 24),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder<String>(
            valueListenable: UserService.userName,
            builder: (context, name, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Assalamu'alaikum", style: TextStyle(color: Colors.white70, fontSize: 16.0)),
                  Text(name, style: const TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold)),
                ],
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white, size: 28),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContentBody() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: hadithData.length,
        itemBuilder: (context, index) {
          final hadith = hadithData[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: _buildHadithCard(
              title: hadith["title"]!,
              source: hadith["source"]!,
              snippet: hadith["snippet"]!,
              arabicText: hadith["arabic"]!,
              translation: hadith["translation"]!,
            ),
          );
        },
      ),
    );
  }

  Widget _buildHadithCard({
    required String title,
    required String source,
    required String snippet,
    required String arabicText,
    required String translation,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              title: title,
              source: source,
              arabicText: arabicText,
              translation: translation,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              source,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12.0,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              snippet,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Text(
              "Lihat detail",
              style: TextStyle(
                color: Colors.lightBlue[200],
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
