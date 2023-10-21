import 'package:flutter/material.dart';
import 'package:album_list/models/photo_album.dart';
import 'package:album_list/services/photo_album_service.dart';

class PhotoAlbumScreen extends StatefulWidget {
  const PhotoAlbumScreen({super.key});

  @override
  State<PhotoAlbumScreen> createState() => _PhotoAlbumScreenState();
}

class _PhotoAlbumScreenState extends State<PhotoAlbumScreen> {
  final PhotoAlbumService _photoAlbumService = PhotoAlbumService();
  List<PhotoAlbum> _albums = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final albums = await _photoAlbumService.getPhotoAlbums();
    setState(() {
      _albums = albums;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Albums'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _albums.length,
        itemBuilder: (context, index) {
          final album = _albums[index];
          return Card(
            margin: const EdgeInsets.all(4.0),
            child: ListTile(
              title: Text(album.title),
              subtitle: Container(
                padding: const EdgeInsets.all(3.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF792B1), // สีพื้นหลังสีชมพูอ่อน
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Album ID: ',
                          ),
                          Text(
                            album.id.toString(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8.0,),// ระยะห่างระหว่าง Album ID และ User ID
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFFAEE4FF), // สีพื้นหลังสีฟ้าอ่อน
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'User ID: ',
                          ),
                          Text(
                            album.userId.toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
