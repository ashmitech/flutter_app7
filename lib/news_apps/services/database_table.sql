--users table
CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(50) NOT NULL
);

--posts table
CREATE TABLE posts(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARChAR(255) NOT NULL
);

--bookmarks table
CREATE TABLE bookmarks(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    post_id INT,
    FOREIGN KEY(user_id) REFERENCE users(id),
    FOREIGN KEY(post_id) REFERENCE posts(id),
);
