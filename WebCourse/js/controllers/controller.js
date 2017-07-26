// main controller
var app = angular.module('myApp', ['ngSanitize'])
        .controller('myController', function ($scope, $http, $timeout, $filter, $window, $sce) {

            app.expandControllerInit($scope, $http, $timeout, $filter, $window, $sce);


            // utils
            $scope.safeApply = function (fn) {
                var phase = this.$root.$$phase;
                if (phase == '$apply' || phase == '$digest') {
                    if (fn && (typeof (fn) === 'function')) {
                        fn();
                    }
                } else {
                    this.$apply(fn);
                }
            };

            $scope.fitString = function (s, n) {
                if (typeof (s) == 'undefined' || s == null) {
                    return "";
                }
                s = s.replace("'", "").replace("\"", "");
                return s.length > n ? (s.substring(0, n - 3) + "...") : s;
            }
            //$scope.formatDate = function (date) {
            //    var d = moment(date, 'DD-MM-YYYY').format('DD-MM-YYYY'); // new Date(date);
            //    //console.log(d);
            //    if (d == "Invalid date")
            //        return "";
            //    else
            //        return d;
            //};

    });
