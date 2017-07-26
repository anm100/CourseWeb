<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CS.aspx.cs" Inherits="CS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.9/angular.min.js"></script>
        <script type="text/javascript">
            var app = angular.module('MyApp', [])
            app.controller('MyController', function ($scope, $http, $window) {
                $scope.ButtonClick = function () {
                    var post = $http({
                        method: "POST",
                        url: "ServiceCS.asmx/GetCurrentTime",
                        dataType: 'json',
                        data: { name: $scope.Name },
                        headers: { "Content-Type": "application/json" }
                    });

                    post.success(function (data, status) {
                        $window.alert(data.d);
                    });

                    post.error(function (data, status) {
                        $window.alert(data.Message);
                    });
                }
            });
        </script>
        <div ng-app="MyApp" ng-controller="MyController">
            Name:
            <input type="text" ng-model="Name" />
            <br />
            <br />
            <input type="button" value="Submit" ng-click="ButtonClick()" />
        </div>
    </form>
</body>
</html>
