<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Regist.aspx.cs" Inherits="Regist"EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>New User</title>
     <script src="js/packages/angular.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.9/angular.min.js"></script>
    <script src="js/packages/angular-sanitize.min.js"></script>
    <script src="js/packages/jquery-3.1.0.min.js"></script>
    <script src="js/packages/bootstrap.min.js"></script>
    <script src="js/packages/linq.min.js"></script>
    <script src="js/controllers/userMang.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body data-ng-app='myApp'  ng-controller="MyController" >
    <form id="form1" runat="server">
    <div>
    <div>
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                        <a class="navbar-brand" href="Default.aspx"><span>
                            <img alt="Logo" src="images/logo.png" height="40px" /></span>Courses site</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="Default.aspx">Home</a></li>
                            <li><a href="#">My Courses</a></li>
                            <li><a href="#">teachers</a></li>
                            <li id="btnSignin" runat="server"><a href="SignIn.aspx">Sign In</a></li>
                            <li>
                                <asp:Button ID="btnSignOut" runat="server" Class="btn btn-default navbar-btn" Text="Sign out" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="center-page">

            <label class="col-xs-11">UserId</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbUserId" runat="server" Class="form-control" placeholder="UserId" ng-model="userID"></asp:TextBox>
            </div>
            <label class="col-xs-11">Email</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbEmail" runat="server" Class="form-control" ng-model="Email" placeholder="Email"></asp:TextBox>
            </div>
            <label class="col-xs-11">Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbPass" runat="server" Class="form-control" placeholder="Password" ng-model="Password"  TextMode="Password"></asp:TextBox>
            </div>

            <label class="col-xs-11">Confirm Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbCPass" runat="server" Class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
            </div>

            <label class="col-xs-11">FirstName</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbFirstName" runat="server" Class="form-control" ng-model="Firstname" placeholder="FirstName"></asp:TextBox>
            </div>

            <label class="col-xs-11">LastName</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbLastName" runat="server" Class="form-control" ng-model="Lastname" placeholder="LastName"></asp:TextBox>
            </div>
                                <label class="col-xs-11">Role</label>
            <div class="col-xs-11">
                <asp:DropDownList ID="drRole" runat="server" AppendDataBoundItems="True" ng-model="seletedRole" class="form-control"  placeholder="Role" ToolTip="Role">
                        <asp:ListItem Text="Admin" Value="Admin" />
                         <asp:ListItem Text="Student" Value="Student" />
                     <asp:ListItem Text="Teacher" Value="Teacher" />
                </asp:DropDownList>
        </div>
            <div class="col-xs-11 space-vert">
                <asp:Button ID="btRegist" runat="server" Class="btn btn-success" Text="Regist" ng-click="Regist()" />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>


        </div>

    </div>
      <!--- Footer  -->

      


        <footer class="footer-pos">
           <div class="container" >
               <p class="pull-right"> <a href="#">Back to Top</a></p>
               <p>&copy; 2017 Courses.com &middot;<a href ="Default.aspx">Home</a> &middot;<a href="#">About</a>
                   &middot;<a href="#">Contact</a>
               </p>
           </div>   
        </footer>

        <!--- Footer -->


    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
