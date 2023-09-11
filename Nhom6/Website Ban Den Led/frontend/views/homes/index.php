<?php
require_once 'helpers/Helper.php';
?>
<div class="container">
    <?php if (!empty($products)): ?>
        <div class="row">
            <div class="col-sm-8 offset-sm-2 text-center colorlib-heading">
                <h2>Sản phẩm mới nhất</h2>
            </div>
        </div>
        <div class="row row-pb-md">
            <?php foreach ($products AS $product):
                $slug = Helper::getSlug($product['title']);
                $product_link = "san-pham/$slug/" . $product['id'] . ".html";
                $product_cart_add = "them-vao-gio-hang/" . $product['id'] . ".html";
                ?>
                <div class="col-lg-3 mb-4 text-center">
                    <div class="product-entry border">
                        <a href="<?php echo $product_link; ?>" class="prod-img">
                            <img class="img-fluid" title="<?php echo $product['title'] ?>"
                                 src="../backend/assets/uploads/<?php echo $product['avatar'] ?>"
                                 alt="<?php echo $product['title'] ?>" />
                        </a>

                        <div class="desc">
                            <h2><a href="<?php echo $product_link; ?>"><?php echo $product['title'] ?></a></h2>

                            <span class="price"><?php echo number_format($product['price'], 0, '.', ','); ?>₫</span>
                            <span data-id="<?php echo $product['id'] ?>" class="add-to-cart">
                                <a href="#" style="color: orange">Thêm vào giỏ</a>
                            </span>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
</div>



