l<%@ Page Title="Log in" Language="C#"  AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<head>
    <script src="js/packages/angular.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/login.css" rel="stylesheet" />
    <script src="js/controllers/loginApp.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.3/angular-route.min.js"></script>

</head>
<body ng-app="myAPP" ng-controller="MyController">
    {{1+1}}
  <div class="wrapper">
    <form class="form-signin" name="loginForm">       
      <div class="form-heading">
    <h2>Log in</h2>
  </div>
  <div class="form-group" ng-class="{'has-error': loginForm.email.$invalid && loginForm.email.$dirty, 'has-success': loginForm.email.$valid }">
    <input type="text" pattern="[0-9]{9}"class="form-control" placeholder="ID" name="email" ng-model="userID" ng-minLength="9" required/>
    <p class="alert alert-danger" ng-if="loginForm.email.$invalid && loginForm.email.$dirty">enter 9 numbers</p>
  </div>
  <div class="form-group" ng-class="{'has-error': loginForm.password.$invalid && loginForm.password.$dirty, 'has-success': loginForm.password.$valid}">
    <input type="password" class="form-control" placeholder="Password" name="password" ng-model="userPass" ng-minLength="4" required/>
    <div class="alert alert-danger" ng-if="loginForm.password.$invalid && loginForm.password.$dirty">Please Enter at least 4 characters</div>
    <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> Remember me
           <div class="alert alert-danger" style="padding-top:5px;" ng-if="status==false"> invalid password andrs</div>

  </div>
  <button class="btn btn-lg btn-primary btn-block" ng-disabled="loginForm.emails.$invalid || loginForm.password.$invalid" ng-click="login()" type="submit">Login</button>   

 </form>

  </div>


  
</body>
