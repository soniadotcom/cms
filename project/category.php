<?php include "includes/db.php"; ?>
<?php include "includes/header.php"; ?>

<!-- Navigation -->
<?php include "includes/navigation.php" ?>

    
<!-- Page Content -->
<div class="container">

    <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">

<?php

if(isset($_GET['category'])) {
    $post_category_id = $_GET['category'];
}

$query = "SELECT * FROM posts WHERE post_category_id = $post_category_id";
$select_all_posts_query = mysqli_query($connection, $query);

$no_post = true;

while($row = mysqli_fetch_assoc($select_all_posts_query)) {
    $post_id = $row['post_id'];
    $post_title = $row['post_title'];
    $post_author = $row['post_author'];
    $post_date = $row['post_date'];
    $post_image = $row['post_image'];
    $post_status = $row['post_status'];
    //$post_content = substr($row['post_content'], 0, 200);
    $post_content = $row['post_content'];

    if($post_status == 'published'){
        $no_post = false;
    ?>

            <h1 class="page-header">
                Page Heading
                <small>Secondary Text</small>
            </h1>

            <!-- First Blog Post -->
            <h2>
                <a href="post.php?p_id=<?php echo $post_id ?> "><?php echo $post_title ?></a>
            </h2>
            <p class="lead">
                by <a href="index.php"><?php echo $post_author ?></a>
            </p>
            <p><span class="glyphicon glyphicon-time"></span><?php echo $post_date ?></p>
            <hr>
            <a href="post.php?p_id=<?php echo $post_id ?> ">
                <img class="img-responsive" src="images/<?php echo $post_image ?>" alt="">
            </a>
            <hr>
            <p><?php echo $post_content ?></p>
            <a class="btn btn-primary" href="post.php?p_id=<?php echo $post_id ?> ">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>

            <hr>

    <?php
    }
}

if ($no_post) {
    echo "<h3 class='alert alert-info'>Unfortunately, there are no publications on the page yet.</h3>";
}

?>

        </div>

        <!-- Blog Sidebar Widgets Column -->

        <?php include "includes/sidebar.php" ?>

    </div>
    <!-- /.row -->

    <hr>

<?php include "includes/footer.php" ?>
