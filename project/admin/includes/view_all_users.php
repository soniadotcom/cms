<div style="overflow-x: auto; max-width: 100%;">
<table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th>Id</th>
            <th>Username</th>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Email</th>
            <th>Role</th>
        </tr>
    </thead>
    <tbody>
        
        <?php
            $query = "SELECT * FROM users";
            $select_users = mysqli_query($connection, $query);
        
            while($row = mysqli_fetch_assoc($select_users)) {
                $user_id = $row['user_id'];
                $username = $row['username'];
                $user_password = $row['user_password'];
                $user_firstname = $row['user_firstname'];
                $user_lastname = $row['user_lastname'];
                $user_email = $row['user_email'];
                $user_image = $row['user_image'];
                $user_role = $row['user_role'];

                echo "<tr>";
                echo "<td>$user_id</td>";
                echo "<td>$username</td>";
                echo "<td>$user_firstname</td>";
                echo "<td>$user_lastname</td>";
                echo "<td>$user_email</td>";
                echo "<td>$user_role</td>";


                // $query = "SELECT * FROM posts WHERE post_id = $user_post_id";

                // $select_post_id_query = mysqli_query($connection, $query);

                // while($row = mysqli_fetch_assoc($select_post_id_query)){
                //     $post_id = $row['post_id'];
                //     $post_title = $row['post_title'];

                //     echo "<td><a href='../post.php?p_id=$post_id'>$post_title</a></td>";
                // }


                echo "<td><a href='users.php?make_admin={$user_id}'>Admin</a></td>";
                echo "<td><a href='users.php?make_sub={$user_id}'>Subscriber</a></td>";
                echo "<td><a href='users.php?source=edit_user&edit_user={$user_id}'>Edit</a></td>";
                echo "<td><a onClick=\"javascript: return confirm('Are you sure you want to delete?'); \" href='users.php?delete={$user_id}'>Delete</a></td>";
                echo "</tr>";
            }
        ?>
    </tbody>
</table>
</div>


<?php

if(isset($_GET['make_admin'])) {
    $make_admin_user_id = $_GET['make_admin'];
    $query = "UPDATE users SET user_role = ? WHERE user_id = ?";
    $make_admin_stmt = mysqli_prepare($connection, $query);
    mysqli_stmt_bind_param($make_admin_stmt, "si", $role, $id);

    $role = 'admin';
    
    $id = $make_admin_user_id;
    mysqli_stmt_execute($make_admin_stmt);
    header("Location: users.php");
}

if (isset($_GET['make_sub'])) {
    $make_sub_user_id = $_GET['make_sub'];
    $query = "UPDATE users SET user_role = ? WHERE user_id = ?";
    $stmt = mysqli_prepare($connection, $query);
    mysqli_stmt_bind_param($stmt, "si", $role, $make_sub_user_id);
    
    $role = 'subscriber';
    
    mysqli_stmt_execute($stmt);
    header("Location: users.php");
}


if (isset($_GET['delete'])) {
    if (isset($_SESSION['user_role']) && $_SESSION['user_role'] == 'admin') {
        $delete_user_id = $_GET['delete'];
        $query = "DELETE FROM users WHERE user_id = ?";
        $stmt = mysqli_prepare($connection, $query);
        mysqli_stmt_bind_param($stmt, "i", $delete_user_id);
        $delete_user_query = mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
        header("Location: users.php");
    }
}

?>