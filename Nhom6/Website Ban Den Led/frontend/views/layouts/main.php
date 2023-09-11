<!DOCTYPE HTML>
<html>
<head>
    <base href="<?php echo $_SERVER['SCRIPT_NAME'] ?>" />
    <title>ĐÈN LED ELV</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="assets/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="assets/css/icomoon.css">
    <!-- Ion Icon Fonts-->
    <link rel="stylesheet" href="assets/css/ionicons.min.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="assets/css/magnific-popup.css">

    <!-- Flexslider  -->
    <link rel="stylesheet" href="assets/css/flexslider.css">

    <!-- Owl Carousel -->
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">

    <!-- Date Picker -->
    <link rel="stylesheet" href="assets/css/bootstrap-datepicker.css">
    <!-- Flaticons  -->
    <link rel="stylesheet" href="assets/fonts/flaticon/font/flaticon.css">

    <!-- Theme style  -->
    <link rel="stylesheet" href="assets/css/style.css">

</head>
<body>

<div class="colorlib-loader"></div>

<div id="page">
    <nav class="colorlib-nav" role="navigation">
        <div class="top-menu">
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 col-md-9">
                        <div id="colorlib-logo"><a href="index.php">VINALIGHT</a></div>
                    </div>
                    <div class="col-sm-5 col-md-3">
                        <form action="#" class="search-wrap">
                            <div class="form-group">
                                <input type="search" class="form-control search" placeholder="Search">
                                <button class="btn btn-primary submit-search text-center" type="submit"><i class="icon-search"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 text-left menu-1">
                        <ul>
                            <li class="active"><a href="index.php">Trang chủ</a></li>
                            <li><a href="danh-sach-san-pham.html">Sản phẩm</a></li>
                            <li><a href="news.html">Tin tức</a></li>
                            <li><a href="gio-hang-cua-ban.html">Giỏ hàng</a></li>
                            <li><a href="contact.html">Liên hệ</a></li>
                            <li class="cart"><a href="gio-hang-cua-ban.html"><i class="icon-shopping-cart"></i>
                                    <?php
                                    $cart_total = 0;
                                    if (isset($_SESSION['cart'])) {
                                        foreach ($_SESSION['cart'] AS $cart) {
                                            $cart_total += $cart['quantity'];
                                        }
                                    }
                                    ?>
                                    Cart [<span class="cart-amount"><?php echo $cart_total; ?></span>]</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="colorlib-product">
        <div class="container">
            <?php if (isset($_SESSION['error'])): ?>
                <div class="alert alert-danger">
                    <?php
                    echo $_SESSION['error'];
                    unset($_SESSION['error']);
                    ?>
                </div>
            <?php endif; ?>

            <?php if (!empty($this->error)): ?>
                <div class="alert alert-danger">
                    <?php
                    echo $this->error;
                    ?>
                </div>
            <?php endif; ?>

            <?php if (isset($_SESSION['success'])): ?>
                <div class="alert alert-success">
                    <?php
                    echo $_SESSION['success'];
                    unset($_SESSION['success']);
                    ?>
                </div>
            <?php endif; ?>
        </div>
        <!--    hiển thị nội dung động -->
        <?php echo $this->content; ?>
    </div>

    <footer id="colorlib-footer" role="contentinfo">
        <div class="container">
            <div class="row row-pb-md">
                <div class="col footer-col colorlib-widget">
                    <h4>Thông Tin Liên Hệ</h4>
                    <p>
                        <i class="icon-home"></i> Trụ sở chính : Số 33 Hoàng Quốc Việt – Nghĩa Đô – Cầu Giấy – TP. Hà Nội. Hotline : 0904.6789.22.<br>
                        <i class="icon-location-outline"></i> Cơ sở TP.HCM : 50/1 Quang Trung, Phường 10, Quận Gò Vấp, TP.Hồ Chí Minh. Hotline : 0909.961.962.<br>
                        <i class="icon-phone-call"></i> Hotline: (0243)9352.999<br>
                        <i class="icon-envelope"></i> Email: vinalightgroup@gmail.com<br>
                        <i class="icon-globe"></i> Website: https://elvlighting.net<br>
                    </p>
                    <p>
                    <ul class="colorlib-social-icons">
                        <li><a href="https://www.facebook.com/tuananhherny"><i class="icon-twitter"></i></a></li>
                        <li><a href="https://www.facebook.com/tuananhherny"><i class="icon-facebook"></i></a></li>
                        <li><a href="https://www.facebook.com/tuananhherny"><i class="icon-linkedin"></i></a></li>
                        <li><a href="https://www.facebook.com/tuananhherny"><i class="icon-dribbble"></i></a></li>
                    </ul>
                    </p>
                </div>
                <div class="col footer-col colorlib-widget">
                    <h4>Thông tin</h4>
                    <p>
                        Công ty CP Thiết Bị Điện Và Chiếu Sáng Vinalight<br>
                        Tên viết tắt : Vinalight Group<br>
                        Địa chỉ giao dịch: Số 31 Hoàng Quốc Việt, Nghĩa Đô, Cầu Giấy, TP. Hà Nội<br>
                        Điện thoại: 0936.515.888 – 0989.487.999<br>
                        Email: vinalightgroup@gmail.com<br>
                        Chi Nhánh Hồ Chí Minh: 50/1 Quang Trung, Phường 10, Quận Gò Vấp, TP. Hồ Chí Minh.<br>
                        Điện thoại: 0909.961.962.- 0964.611.699.<br>
                        ĐKKD: 0107595448<br>
                        Người Đại Diện: Nguyễn Vĩnh Toán<br>
                        Ngày ĐK: Đăng ký lần đầu ngày 12 tháng 10 năm 2016<br>
                    </p>
                </div>
                <div class="col footer-col colorlib-widget">
                    <h4>THÔNG TIN</h4>
                    <p>
                    <ul class="colorlib-footer-links">
                        <li><a href="warrantypolicy.html">Chính Sách Bảo Hành</a></li>
                        <li><a href="returnpolicy.html">Chính sách đổi trả hàng</a></li>
                        <li><a href="payments.html">Hình thức thanh toán</a></li>
                        <li><a href="shoppingguide.html">Hướng dẫn mua hàng</a></li>
                        <li><a href="contact.html">Liên Hệ</a></li>
                    </ul>
                    </p>
                </div>
            </div>
        </div>

    </footer>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
</div>

<!-- jQuery -->
<script src="assets/js/jquery.min.js"></script>
<!-- popper -->
<script src="assets/js/popper.min.js"></script>
<!-- bootstrap 4.1 -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- jQuery easing -->
<script src="assets/js/jquery.easing.1.3.js"></script>
<!-- Waypoints -->
<script src="assets/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="assets/js/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="assets/js/owl.carousel.min.js"></script>
<!-- Magnific Popup -->
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script src="assets/js/magnific-popup-options.js"></script>
<!-- Date Picker -->
<script src="assets/js/bootstrap-datepicker.js"></script>
<!-- Stellar Parallax -->
<script src="assets/js/jquery.stellar.min.js"></script>
<!-- Main -->
<script src="assets/js/main.js"></script>

<script src="assets/js/script.js"></script>

</body>
</html>

