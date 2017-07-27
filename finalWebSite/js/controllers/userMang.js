angular.module('myApp',[])
    .controller('MyController', function ($scope, $http, $log, $rootScope) {
        $scope.Regist = function () {
             $scope.data1 = {
                userID: $scope.userID,
                Firstname: $scope.Firstname,
                Lastname: $scope.Lastname,
                Email: $scope.Email,
                Password: $scope.Password,
                Role: $scope.seletedRole
            }
            
        }
    })