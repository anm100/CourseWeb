angular.module('userApp', [])
    .controller('MyController', function ($scope, $http, $log, $rootScope) {
        alert("aaa")
        $scope.regist = function () {

            var data1 = $.param({
                "userID=":$scope.userID,
                "Firstname=": $scope.Firstname,
                "Lastname=": $scope.Lastname,
               "Email=": $scope.Email,
                "Password=": $scope.Password,
                //Role: $scop.Role,
            });
            var data=JSON.stringify(data1);

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
    })