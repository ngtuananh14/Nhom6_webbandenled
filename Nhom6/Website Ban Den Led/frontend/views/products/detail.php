<?php

?>
<div class="container">
    <div class="row row-pb-lg product-detail-wrap">
        <div class="col-sm-8">
            <div class="">
                <div class="owl-stage-outer">
                    <div class="product-entry border">
                        <img src="../backend/assets/uploads/<?php echo $product['avatar'] ?>" class="img-fluid" alt="Free html5 bootstrap 4 template" width="100%">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="product-desc">
                <h3><?php echo $product['title']; ?></h3>
                <p class="price">
                    <span><?php echo number_format($product['price'], 0, '.', ','); ?>₫</span>
                    <span class="rate">
									<i class="icon-star-full"></i>
									<i class="icon-star-full"></i>
									<i class="icon-star-full"></i>
									<i class="icon-star-full"></i>
									<i class="icon-star-half"></i>
									(74 Rating)
								</span>
                </p>
                <p></p>
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <span data-id="<?php echo $product['id']; ?>" class="add-to-cart">
                            <a href="#" class="btn btn-primary btn-addtocart">
                                <i class="icon-shopping-cart"></i> Thêm vào giỏ
                            </a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="row">
                <div class="col-md-12 pills">
                    <div class="bd-example bd-example-tabs">
                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

                            <li class="nav-item">
                                <a class="nav-link active show" id="pills-description-tab" data-toggle="pill" href="#pills-description" role="tab" aria-controls="pills-description" aria-expanded="true" aria-selected="true">Tóm tắt sản phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="pills-manufacturer-tab" data-toggle="pill" href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer" aria-expanded="true" aria-selected="false">Chi tiết sản phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-expanded="true">Đánh giá</a>
                            </li>
                        </ul>

                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane border fade active show" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab">
                                <strong><?php echo $product['summary']; ?></strong>
                            </div>

                            <div class="tab-pane border fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-manufacturer-tab">
                                <?php echo $product['content']; ?>
                            </div>

                            <div class="tab-pane border fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
                                <div class="row">
                                    <h2 class="link-category-item">Bình luận</h2>
                                    <div class="fb-comments" data-href="https://sukien.net" data-width="100%"
                                         data-numposts="5">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>