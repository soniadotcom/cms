<?php

if(isset($_GET['edit_user'])) {
    $edit_user_id = $_GET['edit_user'];

    $query = "SELECT * FROM users WHERE user_id = $edit_user_id";
    $select_users = mysqli_query($connection, $query);

    while($row = mysqli_fetch_assoc($select_users)) {
        $user_id = $row['user_id'];
        $username = $row['username'];
        $user_password = $row['user_password'];
        $user_firstname = $row['user_firstname'];
        $user_lastname = $row['user_lastname'];
        $user_email = $row['user_email'];
        $user_image = $row['user_image'];
    }


    if(isset($_POST['edit_user'])) {

        $user_firstname = $_POST['user_firstname'];
        $user_lastname = $_POST['user_lastname'];

        // $image = $_FILES['image']['name'];
        // $image_temp = $_FILES['image']['tmp_name'];

        $username = $_POST['username'];
        $user_email = $_POST['user_email'];

        if(!empty($_POST['user_password'])) {
            $user_password = $_POST['user_password'];
            $user_password = password_hash($user_password, PASSWORD_BCRYPT, array('cost' => 10));
        }
        //$date = date('d-m-y');

        // move_uploaded_file($image_temp, "../images/$image");


        $query = "UPDATE users SET ";
        $query .= "user_firstname = '{$user_firstname}', ";
        $query .= "user_lastname = '{$user_lastname}', ";
        $query .= "username = '{$username}', ";
        $query .= "user_email = '{$user_email}', ";
        $query .= "user_password = '{$user_password}' ";
        $query .= "WHERE user_id = {$edit_user_id}";

        $update_user_query = mysqli_query($connection, $query);

        confirmQuery($update_user_query);

        echo "<p class='alert alert-success'><b>Profile Updated.</b> <a href='users.php'>Edit More Users</a></p>";
    }
} else {
    header("Location: index.php");
}

?>



<form action="" method="post" enctype="multipart/form-data">

    <div class="form-group">
        <label for="title">Firstname</label>
        <input type="text" value="<?php echo $user_firstname ?>" class="form-control" name="user_firstname">
    </div>
    
    <div class="form-group">
        <label for="author">Lastname</label>
        <input type="text" value="<?php echo $user_lastname ?>" class="form-control" name="user_lastname">
    </div>

    <!--
    <div class="form-group">
        <label for="category_id">Post Category Id</label>
        <input type="text" class="form-control" name="category_id">
    </div>
    -->

    <!--
    <div class="form-group">
        <label for="user_role" style="width: 100%;">User Role</label>
        <select name="user_role" id="" class="selectpicker">
            <option value="<?php //echo $user_role ?>"><?php //echo $user_role ?></option>

            <?php
            /*
            if($user_role == 'admin') {
                echo "<option value='subscriber'>subscriber</option>";
            } else {
                echo "<option value='admin'>admin</option>";
            }
            */
            ?>
            
        </select>
    </div>
    -->

    
    <!-- <div class="form-group">
        <label for="image">Post Image</label>
        <input type="file" name="image">
    </div> -->
    
    <div class="form-group">
        <label for="tags">Username</label>
        <input type="text" value="<?php echo $username ?>" class="form-control" name="username">
    </div>
    
    <div class="form-group">
        <label for="tags">Email</label>
        <input type="email" value="<?php echo $user_email ?>" class="form-control" name="user_email">
    </div>
    
    <div class="form-group">
        <label for="tags">New Password</label>
        <input autocomplete="off" type="password" value="" class="form-control" name="user_password">
    </div>
    
    
    <div class="form-group">
        <input class="btn btn-primary" type="submit" name="edit_user" value="Edit user">
    </div>
</form>