<?php

if(isset($_GET['p_id'])) {
    $post_id = $_GET['p_id'];

    $query = "SELECT * FROM posts WHERE post_id = {$post_id}";
    $select_post_by_id = mysqli_query($connection, $query);


    while($row = mysqli_fetch_assoc($select_post_by_id)) {
        $post_author = $row['post_author'];
        $post_title = $row['post_title'];
        $post_category_id = $row['post_category_id'];
        $post_status = $row['post_status'];
        $post_image = $row['post_image'];
        $post_tags = $row['post_tags'];
        $post_comment_count = $row['post_comment_count'];
        $post_content = $row['post_content'];
        $post_date = $row['post_date'];
    }

    // Getting Post Ctegory Title
    $query = "SELECT * FROM categories WHERE cat_id = {$post_category_id}";
    $select_category_query = mysqli_query($connection, $query);
    
    confirmQuery($select_category_query);

    $row = mysqli_fetch_assoc($select_category_query);
    $category_title = $row['cat_title'];

}


if(isset($_POST['update_post'])){
    $post_author = $_POST['post_author'];
    $post_title = $_POST['post_title'];
    $post_category_id = $_POST['post_category_id'];
    $post_status = $_POST['post_status'];
    $post_image = $_FILES['post_image']['name'];
    $post_image_temp = $_FILES['post_image']['tmp_name'];
    $post_tags = $_POST['post_tags'];
    $post_content = $_POST['post_content'];

    move_uploaded_file($post_image_temp, "../images/$post_image");

    if(empty($post_image)) {
        $query = "SELECT * FROM posts WHERE post_id = $post_id";
        $select_image = mysqli_query($connection, $query);
        
        while($row = mysqli_fetch_array($select_image)) {
            $post_image = $row['post_image'];
        }
    }

    $query = "UPDATE posts SET ";
    $query .= "post_category_id = '{$post_category_id}', ";
    $query .= "post_title = '{$post_title}', ";
    $query .= "post_author = '{$post_author}', ";
    $query .= "post_date = now(), ";
    $query .= "post_image = '{$post_image}', ";
    $query .= "post_content = '{$post_content}', ";
    $query .= "post_tags = '{$post_tags}', ";
    //$query .= "post_comment_count = '{$post_comment_count}', ";
    $query .= "post_status = '{$post_status}' ";
    $query .= "WHERE post_id = {$post_id}";

    $update_post_query = mysqli_query($connection, $query);

    confirmQuery($update_post_query);

    header("Location: posts.php?source=successfully_edited_post&p_id={$post_id}");
}




?>


<form action="" method="post" enctype="multipart/form-data">

    <div class="form-group">
        <label for="post_title">Post Title</label>
        <input value="<?php echo $post_title ?>" type="text" class="form-control" name="post_title">
    </div>

    <div class="form-group">
        <label for="post_category_id" style="width: 100%;">Post Category</label>
        <select name="post_category_id" id="" class="selectpicker">
            <?php
                $query = "SELECT * FROM categories";
                $select_categories_query = mysqli_query($connection, $query);

                confirmQuery($select_categories_query); 
            ?>
            <option value="<?php echo $post_category_id ?>"><?php echo $category_title ?></option>
            <?php
                $query = "SELECT * FROM categories";
                $select_categories_query = mysqli_query($connection, $query);

                confirmQuery($select_categories_query);

                while($row = mysqli_fetch_assoc($select_categories_query)) {
                    $cat_id = $row['cat_id'];
                    if($cat_id == $post_category_id) continue;
                    $cat_title = $row['cat_title'];
                    echo "<option value='{$cat_id}'>{$cat_title}</option>";
                }
            ?>
        </select>
    </div>
    
    <div class="form-group">
        <label for="post_author">Post Author</label>
        <input value="<?php echo $post_author ?>" type="text" class="form-control" name="post_author">
    </div>

    <div class="form-group">
        <label for="post_status" style="width: 100%;">Post Status</label>
        <select name="post_status" id="" class="selectpicker">
            <option value="<?php echo $post_status ?>"><?php echo $post_status ?></option>

            <?php
                if($post_status == 'published') {
                    echo "<option value='draft'>draft</option>";
                } else {
                    echo "<option value='published'>published</option>";
                }
            ?>
        </select>
    </div>
    
    <!-- <div class="form-group">
        <label for="post_status">Post Status</label>
        <input value="<?php echo $post_status ?>" type="text" class="form-control" name="post_status">
    </div> -->
    
    <div class="form-group">
        <label for="post_image">Post Image</label>
        <input value="<?php echo $post_image ?>" type="file" name="post_image">
        <img width="200" src="../images/<?php echo $post_image ?>" alt="">
    </div>
    
    <div class="form-group">
        <label for="post_tags">Post Tags</label>
        <input value="<?php echo $post_tags ?>" type="text" class="form-control" name="post_tags">
    </div>
    
    <div class="form-group">
        <label for="post_content">Post Content</label>
        <textarea class="form-control" name="post_content" id="summernote" cols="30" rows="10"><?php echo $post_content ?>
        </textarea>
    </div>
    
    <div class="form-group">
        <input class="btn btn-primary" type="submit" name="update_post" value="Update Post">
    </div>
</form>