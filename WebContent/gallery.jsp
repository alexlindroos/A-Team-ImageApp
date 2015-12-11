<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>A-team Image Browser</title>
        <link rel="stylesheet" href="main.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <script src="jquery-2.1.4.min.js"></script>
        <script src="script112.js"></script>
    </head>
    <body>
      

        <header class="navbar-inverse" role="banner">
            <nav role="navigation">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"><img id="logo" alt="Brand" src="images/ateam.png"></a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="index.html">Main page</a></li>
                            <li><a data-toggle="modal" data-target="#myModalUpload">Upload</a></li>
                            <li><a href="gallery.jsp">Gallery</a>
                        </ul>
                        <form class="navbar-form navbar-left" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search">
                            </div>
                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>
                        <ul class="nav navbar-nav navbar-right">
                           

                            <!--					  	<li><a href="#">Welcome, Boris!</a></li>
                                  <li class="dropdown">
                                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My profile<span class="caret"></span></a>
                                  <ul class="dropdown-menu">
                                    <li><a href="#">My profile</a></li>
                                    <li><a href="#">My album</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Logout</a></li>
                                  </ul>
                                </li>-->

                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </header>

                    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
                    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                                        <sql:setDataSource var="webappDataSource"
                                       driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/ImageDB"
                                       user="test" password="bionicman" />

                    <sql:query dataSource="${webappDataSource}"
                               sql="select IID,TS from IMAGE" var="result" />

<div class="row">
	<c:forEach var="row" items="${result.rows}">
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<img class="img-rounded" data-toggle="modal" data-target="#${row.IID}" src="${pageContext.servletContext.contextPath }/showGallery?IID=${row.IID}" alt="...">
				<div class="caption box">
					<h4>${row.IID}</h4>
					<h4>${row.TS}</h4>
					<a class="leftfloat bet_time like"><i class="fa fa-thumbs-o-up"></i>
						Like <input class="qty1" name="qty1" readonly="readonly" type="text" value="0" />
					</a>
				</div>
			</div>
		</div>
		<!-- Modal for image, used to enlarge images in same window -->
		<div id=${row.IID} class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content modal-lg">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">${row.IID}</h4>
					</div>
					<div class="modal-body">
						<div class="thumbnail">
							<img class="img-rounded" src="${pageContext.servletContext.contextPath }/showGallery?IID=${row.IID}" alt="...">
						</div>
						<a href="#" class="btn btn-primary leftfloat bet_time" role="button">Like</a>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>



                    <!-- Modal content-->

            <!-- Modal Upload-->
            <div id="myModalUpload" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content modal-lg">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Choose the image to upload</h4>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="fileUpload"
                                  enctype="multipart/form-data">
                                <table>
                                    <tr>
                                        <td>Choose Image:</td>
                                        <td><input type="file" name="photo"
                                                   required="required" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="submit" value="Submit"></td>
                                        <td><input type="reset" value="Clear" /></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Modal Login-->
            <div id="myModalLogin" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content modal-lg">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Login</h4>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="validate.jsp">
                                <center>
                                    <table border="1" cellpadding="5" cellspacing="2">
                                        <thead>
                                            <tr>
                                                <th colspan="2">Login Here</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Username</td>
                                                <td><input type="text" name="username" required/></td>
                                            </tr>
                                            <tr>
                                                <td>Password</td>
                                                <td><input type="password" name="password" required/></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center"><input type="submit" value="Login" />
                                                    &nbsp;&nbsp;
                                                    <input type="reset" value="Reset" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </center>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Modal Register-->
            <div id="myModalRegister" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content modal-lg">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Register</h4>
                        </div>
                        <div class="modal-body">
                            <form action ="reg" method="post">
                                <table>
                                    <tr>
                                        <th> ID </th>
                                        <td><input type="text" name="user_id" /></td>
                                    </tr>
                                    <tr>
                                        <th> First Name </th>
                                        <td><input type="text" name="first_name" /></td>
                                    </tr>
                                    <tr>
                                        <th> Last Name </th>
                                        <td><input type="text" name="last_name" /></td>
                                    </tr>
                                    <tr>
                                        <th> Email </th>
                                        <td><input type="text" name="user_email" /></td>
                                    </tr>
                                    <tr>
                                        <th> Username </th>
                                        <td><input type="text" name="user_name" /></td>
                                    </tr>
                                    <tr>
                                        <th> Password </th>
                                        <td><input type="text" name="user_password" /></td>
                                    </tr>
                                    <th></th>
                                    <td><input type ="submit" value="Register"/></td>
                                </table>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

            <!--Test-->
            <!--<script src="//rawgithub.com/ashleydw/lightbox/master/dist/ekko-lightbox.js"></script>
    
        <div class="container mt40">
            <section class="row">
                <article class="col-xs-12 col-sm-6 col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <a href="http://lorempixel.com/350/350/nature/4" title="Nature Portfolio" class="zoom" data-title="Amazing Nature" data-footer="The beauty of nature" data-type="image" data-toggle="lightbox">
                                <img src="images/IMG_20150830_014147.jpg" alt="Nature Portfolio" />
                                <span class="overlay"><i class="glyphicon glyphicon-fullscreen"></i></span>
                            </a>
                        </div>
                        <div class="panel-footer">
                            <h4><a href="#" title="Nature Portfolio">Nature</a></h4>
                            <span class="pull-right">
                                <i id="like1" class="glyphicon glyphicon-thumbs-up"></i> <div id="like1-bs3"></div>
                                <i id="dislike1" class="glyphicon glyphicon-thumbs-down"></i> <div id="dislike1-bs3"></div>
                            </span>
                        </div>
                    </div>
                </article>
    
                <article class="col-xs-12 col-sm-6 col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <a href="http://lorempixel.com/350/350/food/2" title="Food Portfolio" class="zoom" data-title="Delicious Food" data-footer="Whatever your desire" data-type="image" data-toggle="lightbox">
                                <img src="http://lorempixel.com/350/350/food/2" alt="Food Portfolio" />
                                <span class="overlay"><i class="glyphicon glyphicon-fullscreen"></i></span>
                            </a>
                        </div>
                        <div class="panel-footer">
                            <h4><a href="#" title="Food Portfolio">Food</a></h4>
                            <span class="pull-right">
                                <i id="like2" class="glyphicon glyphicon-thumbs-up"></i> <div id="like2-bs3"></div>
                                <i id="dislike2" class="glyphicon glyphicon-thumbs-down"></i> <div id="dislike2-bs3"></div>
                            </span>
                        </div>
                    </div>
                </article>
    
                <article class="col-xs-12 col-sm-6 col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <a href="http://lorempixel.com/350/350/sports/3" title="Sports Portfolio" class="zoom" data-title="Radical Sports" data-footer="This are the best moments" data-type="image" data-toggle="lightbox">
                                <img src="http://lorempixel.com/350/350/sports/3" alt="Sports Portfolio" />
                                <span class="overlay"><i class="glyphicon glyphicon-fullscreen"></i></span>
                            </a>
                        </div>
                        <div class="panel-footer">
                            <h4><a href="#" title="Sports Portfolio" title="Sports">Sports</a></h4>
                            <span class="pull-right">
                                <i id="like3" class="glyphicon glyphicon-thumbs-up"></i> <div id="like3-bs3"></div>
                                <i id="dislike3" class="glyphicon glyphicon-thumbs-down"></i> <div id="dislike3-bs3"></div>
                            </span>
                        </div>
                    </div>
                </article>
    
                <article class="col-xs-12 col-sm-6 col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <a href="http://lorempixel.com/350/350/people/1" title="People Portfolio" class="zoom" data-title="Beautiful People" data-footer="We create relationships" data-type="image" data-toggle="lightbox">
                                <img src="http://lorempixel.com/350/350/people/1" alt="People Portfolio" />
                                <span class="overlay"><i class="glyphicon glyphicon-fullscreen"></i></span>
                            </a>
                        </div>
                        <div class="panel-footer">
                            <h4><a href="#" title="People Portfolio">People</a></h4>
                            <span class="pull-right">
                                <i id="like4" class="glyphicon glyphicon-thumbs-up"></i> <div id="like4-bs3"></div>
                                <i id="dislike4" class="glyphicon glyphicon-thumbs-down"></i> <div id="dislike4-bs3"></div>
                            </span>
                        </div>
                    </div>
                </article>
    
            </section>
        </div>-->

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="main.js"></script>
    </body>
</html>


