import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          BookCard('book00001', 'elman nayeem', '4.5', Icons.shopping_cart),
          SizedBox(height: 16.0),
          BookCard('book 0000002', 'writer', '3.8', Icons.shopping_cart),
        ],
      ),
    );
  }
}
class BookCard extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String bookRating;
  final IconData icon;

  BookCard(this.bookName, this.authorName, this.bookRating, this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.book),
            ),
            title: Text(bookName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(authorName),
                Text('Rating: $bookRating'),
              ],
            ),
          ),
          ButtonBar(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuyNowPage(bookName),
                    ),
                  );
                },
                icon: Icon(icon),
                label: Text('Buy Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class BuyNowPage extends StatelessWidget {
  final String bookName;

  BuyNowPage(this.bookName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Now'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Book Name: $bookName'),
            SizedBox(height: 16.0),
            Image.network('book_cover_image_url_here'), // Replace with actual image URL
            SizedBox(height: 16.0),
            Text('Author: Author Name'),
            Text('Description: Short description goes here'),
            Text('Price: \$19.99'),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              items: <String>['Option 1', 'Option 2', 'Option 3'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle dropdown value change
              },
              hint: Text('Select an option'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the first page
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}