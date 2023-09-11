<div class="container">
    <h2>Giỏ hàng của bạn</h2>
    <?php if (isset($_SESSION['cart'])) : ?>
    <form action="" method="post">
    <div class="row row-pb-lg">
        <div class="col-md-10 offset-md-1">
            <div class="process-wrap">
                <div class="process text-center active">
                    <p><span _msttexthash="9464" _msthash="32">01</span></p>
                    <h3 _msttexthash="1020279" _msthash="33">Giỏ hàng</h3>
                </div>
                <div class="process text-center">
                    <p><span _msttexthash="9568" _msthash="34">02</span></p>
                    <h3 _msttexthash="115102" _msthash="35">Hình thức thanh toán</h3>
                </div>
                <div class="process text-center">
                    <p><span _msttexthash="9672" _msthash="36">03</span></p>
                    <h3 _msttexthash="1601847" _msthash="37">Hoàn tất đơn hàng</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row row-pb-lg">
        <div class="col-md-12">
            <div class="product-name d-flex">
                <div class="one-forth text-left px-4">
                    <span _msttexthash="4896099" _msthash="38">Chi tiết sản phẩm</span>
                </div>
                <div class="one-eight text-center">
                    <span _msttexthash="43706" _msthash="39">Giá</span>
                </div>
                <div class="one-eight text-center">
                    <span _msttexthash="2062073" _msthash="40">Số lượng</span>
                </div>
                <div class="one-eight text-center">
                    <span _msttexthash="1971515" _msthash="41">Thành tiền</span>
                </div>
                <div class="one-eight text-center px-4">
                    <span _msttexthash="1072643" _msthash="42">Xóa</span>
                </div>
            </div>

            <?php
            $total_price = 0;
            foreach ($_SESSION['cart'] AS $product_id => $product):
            ?>
            <div class="product-cart d-flex">
                <div class="one-forth">
                    <div class="product-img" style="background-image: url(../backend/assets/uploads/<?php echo $product['avatar'] ?>);">
                    </div>
                    <div class="display-tc">
                        <h3 _msttexthash="2789592" _msthash="43"> <?php echo $product['name'] ?> </a></h3>
                    </div>
                </div>
                <div class="one-eight text-center">
                    <div class="display-tc">
                        <span class="price" _msttexthash="35776" _msthash="44"><?php echo number_format($product['price']); ?></span>
                    </div>
                </div>
                <div class="one-eight text-center">
                    <div class="display-tc">
                        <input type="text" id="quantity" name="<?php echo $product_id?>" class="form-control input-number text-center" value="<?php echo $product['quantity'] ?>" min="1" max="100">
                    </div>
                </div>
                <div class="one-eight text-center">
                    <div class="display-tc">
                        <span class="price" _msttexthash="42640" _msthash="45">
                            <?php
                            $product_price = $product['price'] * $product['quantity'];
                            $total_price += $product_price;
                            echo number_format($product_price);
                            ?>
                        </span>
                    </div>
                </div>
                <div class="one-eight text-center">
                    <div class="display-tc">
                        <a href="xoa-san-pham/<?php echo $product_id ?>.html" class="closed"></a>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
    <div class="row row-pb-lg">
        <div class="col-md-12">
            <div class="total-wrap">
                <div class="row">

                    <div class="col-sm-4 text-center">
                        <div class="total">
                            <div class="grand-total">
                                <p><span><strong _msttexthash="1980563" _msthash="60">Tổng giá:</strong></span> <span _msttexthash="43303" _msthash="61"><?php echo number_format($total_price); ?> vnđ</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <form action="#">
                            <div class="row form-group">
                                <div class="col-sm-3" class="product-payment">
                                    <input type="submit" name="submit" value="Cập nhật lại giá" class="btn btn-primary">
                                    <a href="thanh-toan.html" class="btn btn-success">Đến trang thanh toán</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    <?php else: ?>
        <h3>Giỏ hàng trống</h3>
    <?php endif; ?>
</div>