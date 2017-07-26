angular.module("myApp1", [])
                        .controller("HttpPostController", function ($scope, $http) {

    $scope.SendHttpPostData = function () {

        var data = $.param({
            firstName: $scope.firstName,
            lastName: $scope.lastName,
            age: $scope.age
        });

        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post('/WebService.asmx/PostDataResponse', data, config)
            .success(function (data, status, headers, config) {
                $scope.ServerResponse = data;
            })
            .error(function (data, status, header, config) {
                $scope.ServerResponse = "Data: " + data +
                    "<hr />status: " + status +
                    "<hr />headers: " + header +
                    "<hr />config: " + config;
            });
    };

});