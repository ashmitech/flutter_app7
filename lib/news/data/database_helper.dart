// class DatabaseHelper {
//   Future<Database> get database async {
//     final dbPath = await getDatabasesPath();
//     return openDatabase(
//       join(dbPath, 'news.db'),
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE articles (
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             title TEXT,
//             description TEXT,
//             url TEXT,
//             urlToImage TEXT,
//             content TEXT
//           )
//         ''');
//       },
//     );
//   }

//   // Insert article into DB
//   Future<void> insertArticle(Article article) async {
//     final db = await database;
//     await db.insert(
//       'articles',
//       article.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   // Clear all articles
//   Future<void> clearArticles() async {
//     final db = await database;
//     await db.delete('articles');
//   }
// }
