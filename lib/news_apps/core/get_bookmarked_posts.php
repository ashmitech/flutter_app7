<?php
require "../data/db.php";
function getBookmarkedPosts($userId){
    global $conn;
    $stmt = $conn->prepare("
            SELECT posts.id, posts.title FROM bookmarks JOIN posts ON bookmarks.post_id = posts.id WHERE bookmarks.user_id=?
        ");
    $stmt-> bind_param("i",$userId);
    $stmt-> execute();
    $result =$stmt -> get_result();
    //initially bookmarked post defined as null
    $bookmarkedPost=[];    
    while ($row=$result->fetch_assoc()){
        $bookmarkedPost[]=$row; // Each $row is an associate array
    }
    $stmt-> close();$result-> close(); $row-> close(); $conn-> close();
    return $bookmarkedPost;        
    }

    // Example usuage 
    $posts = getBookmarkedPosts(1);
    foreach ($posts as $post){
        echo "Post ID: ".$post['id']."-Title:".$post['title']."<br>";
    }

?>