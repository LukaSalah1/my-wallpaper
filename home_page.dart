import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:westtips/drawer_page.dart';
import 'package:image_downloader/image_downloader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of Halloween image URLs
  List<String> imageUrls = [
    'https://media.gettyimages.com/id/1339690330/vector/cute-halloween-poster-with-pumpkin-ghost-and-spider.jpg?b=1&s=1024x1024&w=gi&k=20&c=CN9GhCvdE5xMalAzsyTE_--v7YH_JTfPCGMr7o_ceuU=',
    'https://assets.meillakotona.fi/w7lrg8grgqb7/yejK5WCCKOoEKmWKmUKOe/2f64c8c05224443d600f26814b7b493c/TT_Kurpitsat__20__1rgFa.jpg?w=3840&q=75',
    'https://itis.fi/wp-content/uploads/halloween-tapahtuma-scaled.jpg',
    'https://i.pinimg.com/564x/a3/17/16/a3171613d41d2f996ed51fd9ffc5b1fa.jpg',
    'https://i.pinimg.com/736x/76/5d/36/765d36cce442a2d07ae813edb62289fb.jpg',
    'https://wallpapers.com/images/hd/boo-bitch-cute-halloween-iphone-zetuxhliu1cf7yg9.jpg',
    'https://media1.popsugar-assets.com/files/thumbor/x7vKQCx6W2B1z2IhxhfvZbkHGCY/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2021/08/17/058/n/46902964/ec2558c3f3d8996b_GettyImages-1280225510/i/Halloween-Themed-Cookies-iPhone-Wallpaper.jpg',
    'https://retropoppaper.com/cdn/shop/files/October_1.png?v=1696722020',
    'https://m.media-amazon.com/images/I/81VYH9BzSgL.png',

    // Add more Halloween-themed image URLs here
  ];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // You don't need to load images from Supabase in this case.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(right: 64),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.ghost, size: 20, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'WestTips',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        iconTheme: IconThemeData(color: Colors.orange),
      ),
      drawer: DrawerPage(),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : imageUrls.isEmpty
              ? Center(child: Text('No wallpapers available at the moment.'))
              : GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: imageUrls.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  FullImagePage(imageUrl: imageUrls[index]),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width:
                            MediaQuery.of(context).size.width /
                            2, // Half of the screen width
                        height:
                            MediaQuery.of(context).size.height /
                            3, // You can adjust height here
                        child: Image.network(
                          imageUrls[index],
                          fit:
                              BoxFit
                                  .cover, // Ensures the image covers the space
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}

class FullImagePage extends StatelessWidget {
  final String imageUrl;

  const FullImagePage({required this.imageUrl});

  Future<void> _downloadImage(String imageUrl) async {
    try {
      await ImageDownloader.downloadImage(imageUrl);
    } catch (e) {
      print("Download error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Or transparent if you want
      body: Stack(
        children: [
          // Full screen image
          Positioned.fill(
            child: InteractiveViewer(
              child: Image.network(imageUrl, fit: BoxFit.contain),
            ),
          ),
          // Positioned Save Button at bottom center
          Positioned(
            bottom: 45,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () => _downloadImage(imageUrl),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          // Back button (optional)
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
