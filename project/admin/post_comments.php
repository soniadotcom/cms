<?php include "includes/admin_header.php" ?>
<div id="wrapper">


<?php include "includes/admin_navigation.php" ?>

<?php

    $post_title = "";
    $no_comments = true;

    
    if (isset($_GET['id'])) {
        $post_id = $_GET['id'];
    
        $query = "SELECT post_title FROM posts WHERE post_id = ?";
        $stmt = mysqli_prepare($connection, $query);
        mysqli_stmt_bind_param($stmt, "i", $post_id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
    
        if ($result) {
            $row = mysqli_fetch_assoc($result);
            if ($row !== null) {
                $post_title = $row['post_title'];
            } else {
                echo "<h4 class='alert alert-danger'>Error: invalid value for the id parameter. <br>Please go back to the <a href='posts.php'>previous page</a> or the <a href='../index.php'>main page</a> and try again. " . mysqli_stmt_error($stmt) . "</h4>";
            }
        } else {
            echo "Error: " . mysqli_error($connection);
        }
    }

?>

    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Welcome to Comments page
                        <small><a href="../post.php?p_id=<?php echo $post_id ?>"><?php echo $post_title ?></a></small>
                    </h1>

<div style="overflow-x: auto; max-width: 100%;">
<table class="table table-bordered table-hover" style="<?php if($no_comments) echo "display: none !important"; ?>">
    <thead>
        <tr>
            <th>Id</th>
            <th>Author</th>
            <th>Comment</th>
            <th>Email</th>
            <th>Status</th>
            <th>In Response to</th>
            <th>Date</th>
            <th>Approve</th>
            <th>Unapprove</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>
        
        <?php

            $stmt = mysqli_prepare($connection, "SELECT * FROM comments WHERE comment_post_id = ?");
            mysqli_stmt_bind_param($stmt, "i", $_GET['id']);
            mysqli_stmt_execute($stmt);

            if (!mysqli_stmt_execute($stmt)) {
                echo "<h4 class='alert alert-danger'>Error: invalid value for the id parameter. <br>Please go back to the <a href='posts.php'>previous page</a> or the <a href='../index.php'>main page</a> and try again. " . mysqli_stmt_error($stmt) . "</h4>";
            } else {
                $stmt_result = mysqli_stmt_get_result($stmt);
            
                if (mysqli_num_rows($stmt_result) > 0) {
                    while($row = mysqli_fetch_assoc($stmt_result)) {
                        $comment_id = $row['comment_id'];
                        $comment_post_id = $row['comment_post_id'];
                        $comment_author = $row['comment_author'];
                        $comment_content = $row['comment_content'];
                        $comment_email = $row['comment_email'];
                        $comment_status = $row['comment_status'];
                        $comment_date = $row['comment_date'];

                        echo "<tr>";
                        echo "<td>$comment_id</td>";
                        echo "<td>$comment_author</td>";
                        echo "<td>$comment_content</td>";
                        echo "<td>$comment_email</td>";
                        echo "<td>$comment_status</td>";


                        $query = "SELECT * FROM posts WHERE post_id = $comment_post_id";

                        $select_post_id_query = mysqli_query($connection, $query);

                        while($row = mysqli_fetch_assoc($select_post_id_query)){
                            $post_id = $row['post_id'];
                            $post_title = $row['post_title'];

                            echo "<td><a href='../post.php?p_id=$post_id'>$post_title</a></td>";
                        }




                        echo "<td>$comment_date</td>";
                        echo "<td><a href='post_comments.php?id={$post_id}&approve={$comment_id}'>Approve</a></td>";
                        echo "<td><a href='post_comments.php?id={$post_id}&unapprove={$comment_id}'>Unapprove</a></td>";
                        echo "<td><a onClick=\"javascript: return confirm('Are you sure you want to delete?'); \" href='post_comments.php?id={$post_id}&delete={$comment_id}'>Delete</a></td>";
                        echo "</tr>";
                    }
                } else {
                    $no_comments = true;
                    echo "<h4 class='alert alert-info'>The post \"$post_title\" currently has no comments. <br>Please go back to the <a href='posts.php'>previous page</a> or the <a href='../index.php'>main page</a> and try again.</h4>";
                }
            }
            
        ?>
    </tbody>
</table>
</div>


<?php

if(isset($_GET['approve'])) {
    $approve_comment_id = $_GET['approve'];
    $query = "UPDATE comments SET comment_status = 'approved' WHERE comment_id = $approve_comment_id";
    $approve_comment_query = mysqli_query($connection, $query);
    header("Location: post_comments.php?id=$post_id");
}

if(isset($_GET['unapprove'])) {
    $unapprove_comment_id = $_GET['unapprove'];
    $query = "UPDATE comments SET comment_status = 'unapproved' WHERE comment_id = $unapprove_comment_id";
    $unapprove_comment_query = mysqli_query($connection, $query);
    header("Location: post_comments.php?id=$post_id");
}

if(isset($_GET['delete'])) {
    $delete_comment_id = $_GET['delete'];
    $query = "DELETE FROM comments WHERE comment_id = {$delete_comment_id}";
    $delete_comment_query = mysqli_query($connection, $query);
    header("Location: post_comments.php?id=$post_id");
}

?>

</div>
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<?php include "includes/admin_footer.php" ?>