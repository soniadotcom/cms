<form action="" method="post">
    <div class="form-group">
        <label for="cat_title">Update Category</label>

        <?php
            if(isset($_GET['edit'])){
                $cat_id = $_GET['edit'];
                $query = "SELECT * FROM categories WHERE cat_id = $cat_id";
                $edit_query = mysqli_query($connection, $query);

                while($row = mysqli_fetch_assoc($edit_query)) {
                    $cat_id = $row['cat_id'];
                    $cat_title = $row['cat_title'];
                ?>

                    <input value="<?php if(isset($cat_title)){echo $cat_title;} ?>" type="text" class="form-control" name="cat_title">
                
                <?php
                }
            }
        ?>

        <?php // UPDATE CATEGORY QUERY
            if(isset($_POST['update_category'])) {
                $edit_cat_title = $_POST['cat_title'];
                $query = "UPDATE categories SET cat_title = '{$edit_cat_title}' WHERE cat_id ={$cat_id}";
                $update_query = mysqli_query($connection, $query);
                header("Location: categories.php");
                if(!$update_query){
                    die("QUERY FAILED" . mysqli_error($connection));
                }
            }
        ?>

    </div>
    <div class="form-group">
        <input class="btn btn-primary" type="submit" name="update_category" value="Update Category">
    </div>
</form>