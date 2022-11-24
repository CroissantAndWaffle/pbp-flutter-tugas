import 'package:counter_7/model/mywatchlist_model.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';

class MywatchlistDetailPage extends StatelessWidget {
  // In the constructor, require a Todo.
  const MywatchlistDetailPage({super.key, required this.mywatchlistData});

  // Declare a field that holds the Todo.
  final MyWatchlist mywatchlistData;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: mainDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              mywatchlistData.fields.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Row(
              children: <Widget>[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Realese Date: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(mywatchlistData.fields.releaseDate),
                ),
              ],
            ),
            Row(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Watched: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(mywatchlistData.fields.watched),
              ],
            ),
            Row(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Rating: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(mywatchlistData.fields.rating),
              ],
            ),
            Row(
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Review: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(mywatchlistData.fields.review),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ListTile(
            title: const Text(
              'Back',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Route kembali ke halaman sebelumnya
              Navigator.pop(context);
            },
            tileColor: Colors.blue,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
