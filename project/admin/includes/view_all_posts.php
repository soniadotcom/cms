<?php

if(isset($_POST['checkBoxArray'])) {
    foreach($_POST['checkBoxArray'] as $postValueId) {
        $bulk_options = $_POST['bulk_options'];
        switch($bulk_options) {

            case 'published':
                $query = "UPDATE posts SET post_status = '{$bulk_options}' WHERE post_id = {$postValueId}";
                $update_to_published_status = mysqli_query($connection, $query);
                if ($update_to_published_status) {
                    echo "<h4 class='alert alert-info'>You have successfully published post.</h4>";
                } else {
                    echo "<h4 class='alert alert-danger'>Error publishing record. </h4>" . mysqli_error($connection);
                }
                break;

            case 'draft':
                $query = "UPDATE posts SET post_status = '{$bulk_options}' WHERE post_id = {$postValueId}";
                $update_to_draft_status = mysqli_query($connection, $query);
                if ($update_to_draft_status) {
                    echo "<h4 class='alert alert-info'>You have successfully drafted post.</h4>";
                } else {
                    echo "<h4 class='alert alert-danger'>Error drafting record. </h4>" . mysqli_error($connection);
                }
                break;

            case 'delete':
                $query = "DELETE FROM posts WHERE post_id = {$postValueId}";
                $delete_post = mysqli_query($connection, $query);
                if ($delete_post) {
                    echo "<h4 class='alert alert-info'>You have successfully deleted post.</h4>";
                } else {
                    echo "<h4 class='alert alert-danger'>Error deleting record. </h4>" . mysqli_error($connection);
                }
                break;

            case 'clone':
                $query = "SELECT * FROM posts WHERE post_id = '$postValueId'";
                $select_post_query = mysqli_query($connection, $query);
                confirmQuery($select_post_query);
                while ($row = mysqli_fetch_array($select_post_query)) {

                    // Prepare the SQL statement with a parameterized query
                    $stmt = mysqli_prepare($connection, "INSERT INTO posts(post_category_id, post_title, post_author, post_date, 
                    post_image, post_content, post_tags, post_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

                    // Bind parameters to the statement
                    mysqli_stmt_bind_param($stmt, "isssssss", $post_category_id, $post_title, $post_author, $post_date, $post_image, $post_content, $post_tags, $post_status);

                    $post_category_id = $row['post_category_id'];
                    $post_title = $row['post_title'];
                    $post_author = $row['post_author'];
                    $post_date = date('Y-m-d H:i:s');
                    $post_image = $row['post_image'];
                    $post_content = $row['post_content'];
                    $post_tags = $row['post_tags'];
                    $post_status = 'draft';

                    if (mysqli_stmt_execute($stmt)) {
                        echo "<h4 class='alert alert-info'>You have successfully cloned post \"<b>$post_title</b>\"</h4>";
                    } else {
                        echo "<h4 class='alert alert-danger'>Error clonning record: " . mysqli_stmt_error($stmt) . "</h4>";
                    }
                }


                break;

        }

    }
}

?>

<form action="" method="post">
    <div style="overflow-x: auto; max-width: 100%;">
        <table class="table table-bordered table-hover">

        <div class="row">
        <div id="bulkOptionsContainer" class="col-xs-3">
                <select class="form-control" name="bulk_options" id="">
                    <option value="">Select Options</option>
                    <option value="published">Publish</option>
                    <option value="draft">Draft</option>
                    <option value="delete">Delete</option>
                    <option value="clone">Clone</option>
                </select>
            </div>

            <div class="col-xs-5">
                <input type="submit" name="submit" class="btn btn-success" value="Apply">
                <a class="btn btn-primary" href="posts.php?source=add_post">Add New</a>
            </div>
        </div>

            <thead>
                <tr>
                    <th><input id="selectAllBoxes" type="checkbox"></th>
                    <th>Id</th>
                    <th>Author</th>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Status</th>
                    <th>Image</th>
                    <th>Tags</th>
                    <th>Comments</th>
                    <th>Date</th>
                    <th>Preview</th>
                    <th>Edit</th>
                    <th>Dalete</th>
                    <th>Views</th>
                </tr>
            </thead>
            <tbody>
                
                <?php
                    $query = "SELECT * FROM posts ORDER BY post_id DESC";
                    $select_posts = mysqli_query($connection, $query);
                
                    while($row = mysqli_fetch_assoc($select_posts)) {
                        $post_id = $row['post_id'];
                        $post_author = $row['post_author'];
                        $post_title = $row['post_title'];
                        $post_category_id = $row['post_category_id'];
                        $post_status = $row['post_status'];
                        $post_image = $row['post_image'];
                        $post_tags = $row['post_tags'];
                        $post_comment_count = $row['post_comment_count'];
                        $post_date = $row['post_date'];
                        $post_views_count = $row['post_views_count'];

                        echo "<tr>";
                        
                        ?>
                        
                        <td><input class="checkBoxes" type="checkbox" name="checkBoxArray[]" value="<?php echo $post_id ?>"></td>

                        <?php
                        
                        echo "<td>$post_id</td>";
                        echo "<td>$post_author</td>";
                        echo "<td>$post_title</td>";


                        $query = "SELECT * FROM categories WHERE cat_id = $post_category_id";
                        $edit_query = mysqli_query($connection, $query);

                        while($row = mysqli_fetch_assoc($edit_query)) {
                            $cat_id = $row['cat_id'];
                            $cat_title = $row['cat_title'];
                        }


                        echo "<td>{$cat_title}</td>";
                        echo "<td>$post_status</td>";
                        echo "<td style='width:200px'><img class='img-responsive' src='../images/$post_image' alt='#'></td>";
                        echo "<td>$post_tags</td>";

                        $query = "SELECT * FROM comments WHERE comment_post_id = $post_id";
                        $post_comments_query = mysqli_query($connection, $query);
                        $count_post_comments = mysqli_num_rows($post_comments_query);

                        echo "<td><a href='post_comments.php?id=$post_id'>$count_post_comments</a></td>";


                        echo "<td>$post_date</td>";
                        echo "<td><a href='../post.php?p_id={$post_id}'>Preview</a></td>";
                        echo "<td><a href='posts.php?source=edit_post&p_id={$post_id}'>Edit</a></td>";
                        echo "<td><a onClick=\"javascript: return confirm('Are you sure you want to delete?'); \" href='posts.php?delete={$post_id}'>Delete</a></td>";
                        echo "<td class='align:justify'><a onClick=\"javascript: return confirm('Are you sure you want to reset views?'); \" href='posts.php?reset_views={$post_id}'>{$post_views_count}</a></td>";
                        echo "</tr>";
                    }
                ?>
            </tbody>
        </table>
    </div>
</form>

<?php

    if(isset($_GET['delete'])) {
        $delete_post_id = $_GET['delete'];
        $query = "DELETE FROM posts WHERE post_id = {$delete_post_id}";
        $delete_query = mysqli_query($connection, $query);
        header("Location: posts.php");
    }

    if(isset($_GET['reset_views'])) {
        $reset_post_id = $_GET['reset_views'];
        $query = "UPDATE posts SET post_views_count = 0 WHERE post_id = {$reset_post_id}";
        $reset_views_query = mysqli_query($connection, $query);
        header("Location: posts.php");
    }

?>

<style>
    
</style>