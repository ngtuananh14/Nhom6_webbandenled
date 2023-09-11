<?php
require_once 'helpers/Helper.php';
?>

<h2>Chi tiết user</h2>
<table class="table table-bordered">
    <tr>
        <th>ID</th>
        <td><?php echo $user['id'] ?></td>
    </tr>
    <tr>
        <th>username</th>
        <td><?php echo $user['username'] ?></td>
    </tr>
    <tr>
        <th>full_name</th>
        <td><?php echo $user['full_name'] ?></td>
    </tr>
    <tr>
        <th>phone</th>
        <td><?php echo $user['phone'] ?></td>
    </tr>
    <tr>
        <th>address</th>
        <td><?php echo $user['address'] ?></td>
    </tr>
    <tr>
        <th>email</th>
        <td><?php echo $user['email'] ?></td>
    </tr>
    <tr>
        <th>avatar</th>
        <td>
            <?php if (!empty($user['avatar'])): ?>
                <img height="80" src="assets/uploads/<?php echo $user['avatar'] ?>"/>
            <?php endif; ?>
        </td>
    </tr>
    <tr>
        <th>last_login</th>
        <td><?php echo !empty($user['last_login']) ? date('d-m-Y H:i:s', strtotime($user['last_login'])) : '' ?></td>
    </tr>
    <tr>
        <th>status</th>
        <td><?php echo Helper::getStatusText($user['status']); ?></td>
    </tr>
    <tr>
        <th>created_at</th>
        <td><?php echo date('d-m-Y H:i:s', strtotime($user['created_at'])) ?></td>
    </tr>
    <tr>
        <th>updated_at</th>
        <td><?php echo date('d-m-Y H:i:s', strtotime($user['updated_at'])) ?></td>
    </tr>
</table>
<?php
$url_update = "index.php?controller=user&action=update&id=" . $user['id'];
?>
<a href="<?php echo $url_update ?>" class="btn btn-primary">Sửa</a>
<a href="index.php?controller=user&action=index" class="btn btn-default">Back</a>