<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="customer_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
            </ul>

            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../admin/productimg/carouselimage.jpg" class="w-100" style="height: 30rem;" alt="Los Angeles">
                </div>
                <div class="carousel-item">
                    <img src="../admin/productimg/carouselimage2.jpg" class="w-100" style="height: 30rem;" alt="Chicago">
                </div>

            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>

        </div>



        <!-----Cateogries----->

            <h2 div class="row border pt-5 ml-5">CATEGORIES</h2>
            </div>
          
         <div class="container  w-100">
  <div class="row border pt-5">
    <div class="col mb-4">
      <div class="circle-image text-center bg-lights pt-2 pb-2 rounded-circle">
        <a href="../admin/productsimg/acer_aspire.jpg">
          <img class="w-75" src="../admin/productimg/tilesimg1.jpg" alt="Category 1">
        </a>
      </div>
      <p class="text-center mt-2">PREMIUM WASHROOM TILES</p>
    </div>



    <div class="col mb-4">
      <div class="circle-image text-center bg-lights pt-2 pb-2 rounded-circle">
        <a href="../admin/productsimg/asus.jpg">
          <img class="w-75" src="../admin/productimg/tilesimg2.jpg" alt="Category 2">
        </a>
      </div>
      <p class="text-center mt-2">PREMIUM LIVINGROOM TILES</p>
    </div>



    <div class="col mb-4">
      <div class="circle-image text-center bg-lights pt-2 pb-2 rounded-circle">
        <a href="../admin/productsimg/dell.jpg">
          <img class="w-75" src="../admin/productimg/tilesimg3.jpg" alt="Category 3">
        </a>
      </div>
      <p class="text-center mt-2">AESTHETIC LIVINGROOM TILES</p>
    </div>



    <div class="col mb-4">
      <div class="circle-image text-center bg-lights pt-2 pb-2 rounded-circle">
        <a href="../admin/productsimg/samsung.jpg">
          <img class="w-75" src="../admin/productimg/tilesimg9.jpg" alt="Category 4">
        </a>
      </div>
      <p class="text-center mt-2">AESTHETIC KITCHEN TILES</p>
    </div>



    <div class="col mb-4">
      <div class="circle-image text-center bg-lights pt-2 pb-2 rounded-circle">
        <a href="../admin/productsimg/mac.jpg">
          <img class="w-75" src="../admin/productimg/tilesimg6.jpg" alt="Category 5">
        </a>
      </div>
      <p class="text-center mt-2">LUXURY WASHROOM TILES</p>
    </div>



    <div class="col mb-4">
      <div class="circle-image text-center bg-lights pt-2 pb-2 rounded-circle">
        <a href="../admin/productsimg/hp.jpg">
          <img class="w-75" src="../admin/productimg/tilesimg8.jpg" alt="Category 6">
        </a>
      </div>
      <p class="text-center mt-2">VINTAGE MULTI DESIGN TILES</p>
    </div>
  </div>
</div>


        
        <div class="text-center bg-dark mt-2" style="color:aliceblue"><h1>contact or email us for bulk orders at the best rate. </h1>
        <h4> Contact no.:- +91 7845963210 \ Email-id:- rangecasa@gmail.com</h4></div>
          <div class="title1 mt-3 mb-3 text-center">


        <!--product start-->
        <br />

        <div class="card-body">
            <h2 class="text-center">Product Items
            </h2>
        </div>

        <div class="row">


            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <div class="col-md-4">

                        <div class="card mb-3 shadow w-75 mx-sm-5" style="border-radius: 0.5rem;">

                            <div class="card-body">
                                <div class="card-body">
                                    <div class="card-img">
                                        <img class="img-fluid" style="height: 20rem; width: 100%; border-radius: 0.5rem" src="../admin/productimg/<%# Eval("image_url") %>" alt="">
                                    </div>
                                </div>

                                <div class="row p-2">
                                    <div class="flex flex-col">
                                        <span style="font-size: 18px; font-weight: bold"><%# Eval("product_name")%></span>
                                        <%--<span style="font-size: 18px; font-weight: bold"><%# Eval("image_url") %></span>--%>
                                    </div>

                                    <span class="ml-auto badge badge-info" style="font-size: 18px; font-weight: bold; background-color: #3B71CA">₹<%# Eval("sale_price")%></span></div>
                                <div class="card-body text-right">

                                    <asp:HyperLink ID="HyperLink1" Style="color: #6bb757" NavigateUrl="~/customer/View_product.aspx" runat="server">More details</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>




                </ItemTemplate>

            </asp:Repeater>
        </div>

        <!--product end-->


    </div>
    <br />
    <br />
</asp:Content>

