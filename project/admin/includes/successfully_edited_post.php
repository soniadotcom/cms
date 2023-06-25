<?php

if(isset($_GET['p_id'])) {
    $post_id = $_GET['p_id'];

    echo "<h4 class='alert alert-success'><b>Post Updated.</b> <a href='../post.php?p_id={$post_id}'>View Post</a>
     or <a href='posts.php'>Edit More Posts</a></h4>";
}

?>
