<?php

if(isset($_POST['create_user'])) {

    $user_firstname = $_POST['user_firstname'];
    $user_lastname = $_POST['user_lastname'];
    $user_role = $_POST['user_role'];

    // $image = $_FILES['image']['name'];
    // $image_temp = $_FILES['image']['tmp_name'];

    $username = $_POST['username'];
    $user_email = $_POST['user_email'];
    $user_password = $_POST['user_password'];
    //$date = date('d-m-y');

    // move_uploaded_file($image_temp, "../images/$image");

    $user_password = password_hash($user_password, PASSWORD_BCRYPT, array('cost' => 10));

    $query = "INSERT INTO users(user_firstname, user_lastname, 
    user_role, username, user_email, user_password) ";
    $query .= "VALUES('{$user_firstname}', '{$user_lastname}',
    '{$user_role}', '{$username}', '{$user_email}', '{$user_password}')";

    $create_user_query = mysqli_query($connection, $query);

    confirmQuery($create_user_query);

    echo "<h4 class='alert alert-info'>User created: " . " " . "<a href='users.php'>View Users</a></h4>";
}




?>



<form action="" method="post" enctype="multipart/form-data">

    <div class="form-group">
        <label for="title">Firstname</label>
        <input type="text" class="form-control" name="user_firstname">
    </div>
    
    <div class="form-group">
        <label for="author">Lastname</label>
        <input type="text" class="form-control" name="user_lastname">
    </div>

    <!--
    <div class="form-group">
        <label for="category_id">Post Category Id</label>
        <input type="text" class="form-control" name="category_id">
    </div>
    -->
    <div class="form-group">
        <label for="user_role" style="width: 100%;">User Role</label>
        <select name="user_role" id="" class="selectpicker">
            <option value="subscriber">Select Role</option>
            <option value="admin">Admin</option>
            <option value="subscriber">Subscriber</option>
        </select>
    </div>

    
    <!-- <div class="form-group">
        <label for="image">Post Image</label>
        <input type="file" name="image">
    </div> -->
    
    <div class="form-group">
        <label for="tags">Username</label>
        <input type="text" class="form-control" name="username">
    </div>
    
    <div class="form-group">
        <label for="tags">Email</label>
        <input type="email" class="form-control" name="user_email">
    </div>
    
    <div class="form-group">
        <label for="tags">Password</label>
        <input type="password" class="form-control" name="user_password">
    </div>
    
    
    <div class="form-group">
        <input class="btn btn-primary" type="submit" name="create_user" value="Add user">
    </div>
</form>