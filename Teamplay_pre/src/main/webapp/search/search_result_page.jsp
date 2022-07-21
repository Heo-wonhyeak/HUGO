<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>Filter search result page - Bootdey.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
<div class="row">
  <!-- BEGIN SEARCH RESULT -->
  <div class="col-md-12">
    <div class="grid search">
      <div class="grid-body">
        <div class="row">
          <!-- BEGIN FILTERS -->
          <div class="col-md-3">
            <h2 class="grid-title"><i class="fa fa-filter"></i> Filters</h2>
            <hr>
            
            <!-- BEGIN FILTER BY CATEGORY -->
            <h4>카테고리:</h4>
            <div class="checkbox">
              <label><input type="checkbox" class="icheck"> 맛집</label>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" class="icheck"> 명소</label>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" class="icheck"> 축제</label>
            </div>
            
            <!-- END FILTER BY CATEGORY -->
            
            <!-- BEGIN FILTER BY CATEGORY -->
            <h4>지역:</h4>
            <div class="checkbox">
              <label><input type="checkbox" class="icheck"> 서울</label>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" class="icheck"> 경기</label>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" class="icheck"> 인천</label>
            </div>
            
            <!-- BEGIN FILTER BY CATEGORY -->
            <h4>별점:</h4>
            <div class="checkbox">
              <label><input type="checkbox" class="icheck"> 4개 이상</label>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" class="icheck"> 3개 이상</label>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" class="icheck"> 2개 이상</label>
            </div>
            
            <!-- END FILTER BY CATEGORY -->
            
           
          </div>
          <!-- END FILTERS -->
          
          <!-- BEGIN RESULT -->
          <div class="col-md-9">
            <h2><i class="fa fa-file-o"></i> 결과</h2>
            <hr>
            <!-- BEGIN SEARCH INPUT -->
            <div class="input-group">
              <input type="text" class="form-control" value="">
              <span class="input-group-btn">
                <button class="btn btn-primary" type="button"><i class="fa fa-search"></i></button>
              </span>
            </div>
            <!-- END SEARCH INPUT -->
            <p>검색조건</p>
            
            <div class="padding"></div>
            
            <div class="row">
              <!-- BEGIN ORDER RESULT -->
              <div class="col-sm-6">
                <div class="btn-group">
                  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    Order by <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">별점순</a></li>
                    <li><a href="#">거리순</a></li>
                    <li><a href="#">인기순</a></li>
                  </ul>
                </div>
              </div>
              <!-- END ORDER RESULT -->
              
              <div class="col-md-6 text-right">
                <div class="btn-group">
                  <button type="button" class="btn btn-default active"><i class="fa fa-list"></i></button>
                  <button type="button" class="btn btn-default"><i class="fa fa-th"></i></button>
                </div>
              </div>
            </div>
            
            <!-- BEGIN TABLE RESULT -->
            <div class="table-responsive">
              <table class="table table-hover">
                <tbody><tr>
                  <td class="number text-center">1</td>
                  <td class="image"><img src="" alt=""></td>
                  <td class="product"><strong>결과 1</strong><br></td>
                  <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-o"></i></span></td>
                  <td class="price text-right"></td>
                </tr>
                <tr>
                  <td class="number text-center">2</td>
                  <td class="image"><img src="" alt=""></td>
                  <td class="product"><strong>결과 2</strong><br></td>
                  <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i></span></td>
                  <td class="price text-right"></td>
                </tr>
                <tr>
                  <td class="number text-center">3</td>
                  <td class="image"><img src="" alt=""></td>
                  <td class="product"><strong>결과 3</strong><br></td>
                  <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-o"></i><i class="fa fa-star-o"></i></span></td>
                  <td class="price text-right"></td>
                </tr>
                <tr>
                  <td class="number text-center">4</td>
                  <td class="image"><img src="" alt=""></td>
                  <td class="product"><strong>결과 4</strong><br></td>
                  <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i></span></td>
                  <td class="price text-right"></td>
                </tr>
                <tr>
                  <td class="number text-center">5</td>
                  <td class="image"><img src="" alt=""></td>
                  <td class="product"><strong>결과 5</strong><br></td>
                  <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span></td>
                  <td class="price text-right"></td>
                </tr>
                <tr>
                  <td class="number text-center">6</td>
                  <td class="image"><img src="" alt=""></td>
                  <td class="product"><strong>결과 6</strong><br></td>
                  <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-o"></i></span></td>
                  <td class="price text-right"></td>
                </tr>
                <tr>
                  <td class="number text-center">7</td>
                  <td class="image"><img src="" alt=""></td>
                  <td class="product"><strong>결과 7</strong><br></td>
                  <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i></span></td>
                  <td class="price text-right"></td>
                </tr>
                <tr>
                  <td class="number text-center">8</td>
                  <td class="image"><img src="" alt=""></td>
                  <td class="product"><strong>결과 8</strong><br></td>
                  <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-o"></i></span></td>
                  <td class="price text-right"></td>
                </tr>
              </tbody></table>
            </div>
            <!-- END TABLE RESULT -->
            
            <!-- BEGIN PAGINATION -->
            <ul class="pagination">
              <li class="disabled"><a href="#">«</a></li>
              <li class="active"><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#">»</a></li>
            </ul>
            <!-- END PAGINATION -->
          </div>
          <!-- END RESULT -->
        </div>
      </div>
    </div>
  </div>
  <!-- END SEARCH RESULT -->
</div>
</div>

<style type="text/css">
body{margin-top:20px;
background:#eee;
}

.btn {
    margin-bottom: 5px;
}

.grid {
    position: relative;
    width: 100%;
    background: #fff;
    color: #666666;
    border-radius: 2px;
    margin-bottom: 25px;
    box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.1);
}

.grid .grid-body {
    padding: 15px 20px 15px 20px;
    font-size: 0.9em;
    line-height: 1.9em;
}

.search table tr td.rate {
    color: #f39c12;
    line-height: 50px;
}

.search table tr:hover {
    cursor: pointer;
}

.search table tr td.image {
	width: 50px;
}

.search table tr td img {
	width: 50px;
	height: 50px;
}

.search table tr td.rate {
	color: #f39c12;
	line-height: 50px;
}

.search table tr td.price {
	font-size: 1.5em;
	line-height: 50px;
}

.search #price1,
.search #price2 {
	display: inline;
	font-weight: 600;
}
</style>

<script type="text/javascript">

</script>
</body>
</html>