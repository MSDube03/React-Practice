@{
    ViewBag.Title = "Home";
}
<!-- ===================== HERO CAROUSEL ===================== -->
<div id="heroCarousel" class="carousel slide eg-hero-carousel" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#heroCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#heroCarousel" data-slide-to="1"></li>
        <li data-target="#heroCarousel" data-slide-to="2"></li>
        <li data-target="#heroCarousel" data-slide-to="3"></li>
        <li data-target="#heroCarousel" data-slide-to="4"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="~/Content/Images/Banners/banner-fruits.jpg" alt="Fresh Fruits" />
            <div class="carousel-caption"><h2>Fresh Fruits, Delivered Daily</h2></div>
        </div>
        <div class="item">
            <img src="~/Content/Images/Banners/banner-vegetables.jpg" alt="Fresh Vegetables" />
            <div class="carousel-caption"><h2>Farm Fresh Vegetables</h2></div>
        </div>
        <div class="item">
            <img src="~/Content/Images/Banners/banner-organic.jpg" alt="Organic Products" />
            <div class="carousel-caption"><h2>100% Organic Products</h2></div>
        </div>
        <div class="item">
            <img src="~/Content/Images/Banners/banner-dairy.jpg" alt="Dairy Products" />
            <div class="carousel-caption"><h2>Farm Fresh Dairy</h2></div>
        </div>
        <div class="item">
            <img src="~/Content/Images/Banners/banner-essentials.jpg" alt="Daily Essentials" />
            <div class="carousel-caption"><h2>All Your Daily Essentials</h2></div>
        </div>
    </div>
    <a class="left carousel-control" href="#heroCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#heroCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>

<div class="container-fluid eg-section">

    <!-- ===================== CATEGORIES ===================== -->
    <h3 class="eg-section-title">Shop by Category</h3>
    <div class="row">
        @foreach (var category in ViewBag.Categories)
        {
            <div class="col-sm-6 col-md-3 col-lg-2">
                <a href="@Url.Action("List", "Product", new { categoryId = category.CategoryId })" class="eg-category-card-link">
                    <div class="eg-category-card">
                        <img src="~/Content/Images/Categories/@category.ImagePath" alt="@category.CategoryName" class="eg-category-img" />
                        <h5>@category.CategoryName</h5>
                    </div>
                </a>
            </div>
        }
    </div>

    <!-- ===================== FEATURED PRODUCTS ===================== -->
    <h3 class="eg-section-title">Featured Products</h3>
    <div class="row">
        @foreach (var product in ViewBag.FeaturedProducts)
        {
            @Html.Partial("~/Views/Shared/_ProductCard.cshtml",(EGroceryStore.Models.Product)product)
        }
    </div>
    <!-- ===================== RECENTLY ADDED ===================== -->
    <h3 class="eg-section-title">Recently Added</h3>
    <div class="row">
        @foreach (var product in ViewBag.RecentProducts)
        {
            @Html.Partial("~/Views/Shared/_ProductCard.cshtml",(EGroceryStore.Models.Product) product)
        }
    </div>
    <!-- ===================== BEST SELLING ===================== -->
    <h3 class="eg-section-title">Best Selling</h3>
    <div class="row">
        @foreach (var product in ViewBag.BestSellingProducts)
        {
            @Html.Partial("~/Views/Shared/_ProductCard.cshtml", (EGroceryStore.Models.Product)product)
        }
    </div>
    <!-- ===================== SPECIAL OFFERS ===================== -->
    @if (ViewBag.ActiveCoupons != null && ViewBag.ActiveCoupons.Count > 0)
    {
        <div class="eg-offer-banner">
            <h3>Special Offers</h3>
            <ul>
                @foreach (var coupon in ViewBag.ActiveCoupons)
                {
                    <li>
                        Use code <strong>@coupon.CouponCode</strong> to get
                        @(coupon.DiscountType == "Percentage" ? coupon.DiscountValue + "% off" : "Rs. " + coupon.DiscountValue + " off")
                    </li>
                }
            </ul>
        </div>
    }
</div>


