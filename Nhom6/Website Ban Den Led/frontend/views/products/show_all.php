<?php
require_once 'helpers/Helper.php';
?>
<div class="colorlib-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-xl-3">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="side border mb-1">
                            <h3>Danh Mục Sản Phẩm</h3>
                            <form action="" method="POST">
                            <?php if (!empty($categories)): ?>
                                <div class="form-group">
                                    <b>Danh mục</b> <br/>
                                    <?php foreach ($categories AS $category):
                                        //đổ lại dữ liệu đã check category
                                        $category_checked = '';
                                        if (isset($_POST['category'])) {
                                            if (in_array($category['id'], $_POST['category'])) {
                                                $category_checked = 'checked';
                                            }
                                        }
                                        ?>
                                        <input type="checkbox" name="category[]"
                                               value="<?php echo $category['id']; ?>" <?php echo $category_checked; ?> />
                                        <?php echo $category['name']; ?>
                                        <br/>
                                    <?php endforeach; ?>

                                </div>
                            <?php endif; ?>
                            <div class="form-group">
                                <input type="submit" name="filter" value="Filter" class="btn btn-primary"/>
                                <a href="danh-sach-san-pham.html" class="btn btn-default">Xóa filter</a>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-xl-9">
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
                                            <span class="price"><?php echo number_format($product['price']) ?></span>

                                            <span data-id="<?php echo $product['id'] ?>" class="add-to-cart">
                                <a href="#" style="color: orange" >Thêm vào giỏ</a>
                            </span>
                                        </div>
                                    </div>
                                </div>
                            <?php endforeach; ?>


                        </div>
<!--                        --><?php //echo $pagination; ?>
                    <?php endif; ?>
            </div>
        </div>
    </div>
</div>