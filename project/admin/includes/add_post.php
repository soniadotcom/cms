<?php

if(isset($_POST['create_post'])) {
    $author = $_POST['author'];
    $title = $_POST['title'];
    $category_id = $_POST['category_id'];
    $status = $_POST['status'];

    $image = $_FILES['image']['name'];
    $image_temp = $_FILES['image']['tmp_name'];

    $tags = $_POST['tags'];
    $content = $_POST['content'];
    $date = date('d-m-y');

    move_uploaded_file($image_temp, "../images/$image");


    $query = "INSERT INTO posts(post_category_id, post_title, post_author, post_date, 
    post_image, post_content, post_tags, post_status) ";
    $query .= "VALUES({$category_id}, '{$title}', '{$author}', now(), 
    '{$image}', '{$content}', '{$tags}', '{$status}')";

    $create_post_query = mysqli_query($connection, $query);

    confirmQuery($create_post_query);

    $last_inserted_post_id = mysqli_insert_id($connection);

    echo "<p class='alert alert-success'><b>Post Created.</b> <a href='../post.php?p_id={$last_inserted_post_id}'>View Post</a>
    or <a href='posts.php'>Edit More Posts</a></p>";
}




?>



<form action="" method="post" enctype="multipart/form-data">

    <div class="form-group">
        <label for="title">Post Title</label>
        <input type="text" class="form-control" name="title">
    </div>

    <!--
    <div class="form-group">
        <label for="category_id">Post Category Id</label>
        <input type="text" class="form-control" name="category_id">
    </div>
    -->
    <div class="form-group">
        <label for="category_id" style="width: 100%;">Post Category</label>
        <select name="category_id" id="" class="selectpicker">
            <?php
                $query = "SELECT * FROM categories";
                $select_categories_query = mysqli_query($connection, $query);

                confirmQuery($select_categories_query);

                while($row = mysqli_fetch_assoc($select_categories_query)) {
                    $cat_id = $row['cat_id'];
                    $cat_title = $row['cat_title'];
                    echo "<option value='{$cat_id}'>{$cat_title}</option>";
                }
            ?>
        </select>
    </div>
    
    <div class="form-group">
        <label for="author">Post Author</label>
        <input type="text" class="form-control" name="author">
    </div>
    
    <div class="form-group">
        <label for="status" style="width: 100%;">Post Status</label>
        <select name="status" id="" class="selectpicker">
            <option value="draft">Select Options</option>
            <option value="published">Published</option>
            <option value="draft">Draft</option>
        </select>
    </div>
    
    <div class="form-group">
        <label for="image">Post Image</label>
        <input type="file" name="image">
    </div>
    
    <div class="form-group">
        <label for="tags">Post Tags</label>
        <input type="text" class="form-control" name="tags">
    </div>
    
    <div class="form-group">
        <label for="summernote">Post Content</label>
        <textarea class="form-control" name="content" id="summernote" cols="30" rows="10"></textarea>
    </div>
    
    <div class="form-group">
        <input class="btn btn-primary" type="submit" name="create_post" value="Publish Post">
    </div>
</form>