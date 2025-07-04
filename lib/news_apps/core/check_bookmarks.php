<?php
    require '../data/db.php';
    function toggleBookmark($userId, $postId){
        global $conn;
        // check if already bookmarked
        $check = $conn -> prepare("SELECT id FROM bookmarks WHERE user_id =? AND post_id=?");
        $check=bind_param("ii",$userId,$postId);
        $check=execute();
        $result=$check->get_result();

        if($result -> num_rows>0){
        // unbookmark the content
        $delete = $conn -> prepare("DELETE FROM bookmarks WHERE user_id=? AND post_id=?");
        $delete ->bind_param("ii", $userId, $postId);
        $delete -> execute();
        $delete-> close(); $check-> close(); $conn-> close();
        return "Bookmark removed";
        }else{
        // add the bookmark
        $insert = $conn -> prepare("INSERT INTO bookmarks(user_id, post_id) VALUES(?,?)");
        $insert -> bind_param("ii", $userId, $postId);
        $insert -> execute();
        $insert->close(); $check->close(); $conn->close();
        return "Bookmark added";
        }
    }
    // example call for the user id and post id 101
    echo toggleBookmark(1,101);
?>