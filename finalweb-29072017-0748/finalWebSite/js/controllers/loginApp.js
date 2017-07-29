var app = angular.module('myAPP', ['ngRoute']);
  app.config(function ($routeProvider) {


        $routeProvider
            .when('/', {
                templateUrl: 'home.html'
            })
            .when('/about', {
                templateUrl: 'about.html'
            });


    })
      .controller('MyController', function ($scope, $http, $log, $rootScope) {
          $scope.login = function () {
              var datajson = "{ \"id\":\"" + $scope.userID + "\",\"pass\":\"" + $scope.userPass + "\"}";
              alert(datajson);
              var post = $http({
                  method: "POST",
                  url: "/WebService.asmx/validateUser",
                  dataType: 'json',
                  data: datajson,
                  headers: { "Content-Type": "application/json" }
              });
              post.success(function (data, status) {
                  alert(data.d);
                  $scope.status = data.d;
                  if (data.d==true)
                      location.href = "default.aspx"
              });
              post.error(function (data, status) {
                  $window.alert(data.Message);
              });
          }
      })

            .controller('MyController1', function ($scope, $http, $log, $rootScope, $http, $window) {
                $scope.login = function () {
            var post = $http({
                method: "POST",
                url: "/WebService.asmx/PostDataResponse",
                dataType: 'json',
                data: JSON.stringify({ name: JSON.stringify( $scope.students)}),
                headers: { "Content-Type": "application/json" }
            });

            post.success(function (data, status) {
                $window.alert(data.d);
            });

            post.error(function (data, status) {
                $window.alert(data.Message);
            });
        }
        $scope.reset = function () {
            $scope.students = angular.copy($scope.UseresBack);
            $("tbody td").css("color", "black");
        }

        $scope.$watch('students', function (newVal, oldVal) {
            $(event.target).parent().css("color", "red");
        }, true);
    })

    .controller('MyController2', function ($scope, $http, $log, $rootScope) {
        $http({
            method: 'GET',
            url: '/WebService.asmx/GetAllTheUsers'
        })
            .then(function (response) {
                $rootScope.Users = response.data;
                $log.info(response);
            })
        alert("pppp");
    });