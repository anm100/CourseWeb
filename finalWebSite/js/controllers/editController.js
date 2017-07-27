angular.module('myAPP', [])

    //.controller('MyController', [function () {
    //    angular.element(document).ready(function () {
    //        alert("ready");
    //    });
    //}])
    .controller('MyController', function ($scope, $http, $log, $rootScope) {
     
        $http({
            method: 'GET',
            url: '/WebService.asmx/GetAssigmnetUsersCourse'
        })
            .then(function (data) {
                var response = angular.fromJson(data);
                $rootScope.students = JSON.parse(response.data);
                alert(response.data);
            })
    })

    .controller('MyController1', function ($scope, $http, $log, $rootScope, $http, $window) {
        $scope.sortType = 'name'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $scope.searchFish = '';     // set the default search/filter 
        // backup for $scope.sushi
        //$scope.Users = $rootScope.Users
        //$log.info($rootScope.Users);
        // $scope.UseresBack = angular.copy($scope.Users);
        $log.info($scope.Users);
        $log.info($rootScope.Users);
        $scope.save = function () {
            $scope.UseresBack = angular.copy($scope.Users);
            $log.info($scope.Users);
            $("tbody td").css("color", "black");
            var post = $http({
                method: "POST",
                url: "/WebService.asmx/PostDataResponse",
                dataType: 'json',
                data: { users: $scope.Users },
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
            $scope.Users = angular.copy($scope.UseresBack);
            $("tbody td").css("color", "black");
        }

        $scope.$watch('Users', function (newVal, oldVal) {
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