
var app = angular.module("myTest", [])
    .controller("MyController", function ($scope, $http,$log) {
        $http({
            method: 'GET',
            url: '/WebService.asmx/GetAllTheUsers'
        })
            .then(function (response) {
                $scope.users = response.data;
                $log.info(response);
            });
    });
    //    $http.get('/WebService.asmx/GetAllTheUsers')

    //        .then(function (response) {
    //            $scope.users = response.data;
    //        });
    //});