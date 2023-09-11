<?php
require_once 'controllers/Controller.php';
require_once 'models/Product.php';

class HomeController extends Controller {
  public function index() {
    $product_model = new Product();
    $products = $product_model->getProductInHomePage();

    $this->content = $this->render('views/homes/index.php', [
      'products' => $products
    ]);
    require_once 'views/layouts/main.php';
  }
  public function news(){
      $this->content = $this->render('views/news/news.php', []);
      require_once 'views/layouts/main.php';
  }
  public function warrantypolicy(){
      $this->content = $this->render('views/news/warrantypolicy.php', []);
      require_once 'views/layouts/main.php';
  }
  public function returnpolicy(){
      $this->content = $this->render('views/news/returnpolicy.php', []);
      require_once 'views/layouts/main.php';
  }
  public function payments(){
      $this->content = $this->render('views/news/payments.php', []);
      require_once 'views/layouts/main.php';
  }

  public function shoppingguide(){
      $this->content = $this->render('views/news/shoppingguide.php', []);
      require_once 'views/layouts/main.php';
  }
  public function contact(){
      $this->content = $this->render('views/news/contact.php', []);
      require_once 'views/layouts/main.php';
  }

}