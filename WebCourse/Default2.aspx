<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/packages/angular.min.js"></script>
    <script src="js/packages/jquery-3.1.0.min.js"></script>

     <script>
         var myApp = angular.module("myApp1", []);
         myApp.controller("HttpPostController", function ($scope, $http, $log) {

             $scope.SendHttpPostData = function () {
                
                 $http.get('http://rest-service.guides.spring.io/greeting').
                     then(function (response) {
                         alert();
                     });
                /* $http({
                     url: '/WebService.asmx/GetGreeting',
                     dataType: 'json',
                     method: "POST",
                     data: '',
                     headers: {
                         "Content-Type": "application/json"
                     }
                 }).success(function (data) {
                     alert(data.d)
                 })
                     .error(function (error) {
                         alert(error);
                     });*/
             }
         });  
</script>
    </head>
<body ng-app="myApp1" ng-controller="HttpPostController">
    <div runat="server">
       
    <form runat="server">
        <p>First Name: <input type="text"  name="firstName" ng-model="firstName" required /></p>
                 <button runat="server" ng-click="SendHttpPostData()">Reset</button></div>
        <hr />
         {{ ServerResponse }}
    </form>
 
</div>
</body>
    </html>