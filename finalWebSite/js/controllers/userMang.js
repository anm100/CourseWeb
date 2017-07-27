angular.module('myApp',[])
    .controller('MyController', function ($scope, $http, $log, $rootScope) {
        alert("userMang1");
        $scope.Regist = function () {
             $scope.data1 = {
                userID: $scope.userID,
                Firstname: $scope.Firstname,
                Lastname: $scope.Lastname,
                Email: $scope.Email,
                Password: $scope.Password,
                Role: $scope.seletedRole
            }
             alert($scope.data1.userID);
            var post = $http({
                method: "POST",
                url: "/WebService.asmx/AddUser",
                dataType: 'json',
                data: { newUser:$scope.data1 },
                headers: { "Content-Type": "application/json" }
            });
            post.success(function (data, status) {
                $window.alert(data.d);
            });

            post.error(function (data, status) {
                $window.alert(data.Message);
            });
        }
    })