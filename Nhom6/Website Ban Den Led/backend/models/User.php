<?php
require_once 'models/Model.php';

class User extends Model
{
    public $id;
    public $username;
    public $password;
    public $full_name;
    public $phone;
    public $address;
    public $email;
    public $avatar;
    public $last_login;
    public $facebook;
    public $status;
    public $created_at;
    public $updated_at;

  public $str_search;

  public function __construct()
  {
    parent::__construct();
    if (isset($_GET['username']) && !empty($_GET['username'])) {
      $username = addslashes($_GET['username']);
      $this->str_search .= " AND users.username LIKE '%$username%'";
    }
  }

  public function getAll()
  {
    $obj_select = $this->connection
      ->prepare("SELECT * FROM users ORDER BY updated_at DESC, created_at DESC");
    $obj_select->execute();
    $users = $obj_select->fetchAll(PDO::FETCH_ASSOC);

    return $users;
  }

  public function register() {
    // + Viết truy vấn
    $sql_insert = "
  INSERT INTO users(username, password) 
  VALUES(:username, :password)";
    // + Cbi obj truy vấn
    $obj_insert = $this->connection
      ->prepare($sql_insert);
    // + Tạo mảng
    $inserts = [
      ':username' => $this->username,
      ':password' => $this->password,
    ];
    // + Thực thi
    $is_insert = $obj_insert->execute($inserts);
    return $is_insert;
  }

  public function getUser($username)
  {
    $sql_select_one =
      "SELECT * FROM users WHERE username = :username";
    $obj_select_one = $this->connection
      ->prepare($sql_select_one);
    $selects = [
      ':username' => $username
    ];
    $obj_select_one->execute($selects);
    $user = $obj_select_one
      ->fetch(PDO::FETCH_ASSOC);
    return $user;
  }

  public function getAllPagination($params = [])
  {
    $limit = $params['limit'];
    $page = $params['page'];
    $start = ($page - 1) * $limit;
    $obj_select = $this->connection
      ->prepare("SELECT * FROM users WHERE TRUE $this->str_search
              ORDER BY created_at DESC
              LIMIT $start, $limit");

    $obj_select->execute();
    $users = $obj_select->fetchAll(PDO::FETCH_ASSOC);

    return $users;
  }

  public function getTotal()
  {
    $obj_select = $this->connection
      ->prepare("SELECT COUNT(id) FROM users WHERE TRUE $this->str_search");
    $obj_select->execute();
    return $obj_select->fetchColumn();
  }

  public function getById($id)
  {
    $obj_select = $this->connection
      ->prepare("SELECT * FROM users WHERE id = $id");
    $obj_select->execute();
    return $obj_select->fetch(PDO::FETCH_ASSOC);
  }

  public function getUserByUsername($username)
  {
    $obj_select = $this->connection
      ->prepare("SELECT COUNT(id) FROM users WHERE username='$username'");
    $obj_select->execute();
    return $obj_select->fetchColumn();
  }

  public function insert()
  {
    $obj_insert = $this->connection
      ->prepare("INSERT INTO users(username, password, full_name, phone, address, email, avatar, facebook, status)
VALUES(:username, :password, :full_name, :phone, :address, :email, :avatar, :facebook, :status)");
    $arr_insert = [
      ':username' => $this->username,
      ':password' => $this->password,
      ':full_name' => $this->full_name,
      ':phone' => $this->phone,
      ':address' => $this->address,
      ':email' => $this->email,
      ':avatar' => $this->avatar,
      ':facebook' => $this->facebook,
      ':status' => $this->status,
    ];
    return $obj_insert->execute($arr_insert);
  }

  public function update($id)
  {
    $obj_update = $this->connection
      ->prepare("UPDATE users SET full_name=:full_name, phone=:phone, 
            address=:address, email=:email, avatar=:avatar, facebook=:facebook, status=:status, updated_at=:updated_at
             WHERE id = $id");
    $arr_update = [
      ':full_name' => $this->full_name,
      ':phone' => $this->phone,
      ':address' => $this->address,
      ':email' => $this->email,
      ':avatar' => $this->avatar,
      ':facebook' => $this->facebook,
      ':status' => $this->status,
      ':updated_at' => $this->updated_at,
    ];
    $obj_update->execute($arr_update);

    return $obj_update->execute($arr_update);
  }

  public function delete($id)
  {
    $obj_delete = $this->connection
      ->prepare("DELETE FROM users WHERE id = $id");
    return $obj_delete->execute();
  }

  public function getUserByUsernameAndPassword($username, $password)
  {
    $obj_select = $this->connection
      ->prepare("SELECT * FROM users WHERE username=:username AND password=:password LIMIT 1");
    $arr_select = [
      ':username' => $username,
      ':password' => $password,
    ];
    $obj_select->execute($arr_select);

    $user = $obj_select->fetch(PDO::FETCH_ASSOC);

    return $user;
  }

  public function insertRegister()
  {
    $obj_insert = $this->connection
      ->prepare("INSERT INTO users(username, password, status)
VALUES(:username, :password, :status)");
    $arr_insert = [
      ':username' => $this->username,
      ':password' => $this->password,
      ':status' => $this->status,
    ];
    return $obj_insert->execute($arr_insert);
  }

}