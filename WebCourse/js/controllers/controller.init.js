app.expandControllerInit = function ($scope, $http, $timeout, $filter, $window, $sce) {
    
    // load data 
	angular.element(document).ready(function () {
	    $http.get("Tasks.aspx?tp=getInitData", null)
            .then(
                function (d) {
                    if (d.data != "error") {
                        $scope.data = d.data;
                        $scope.prepareData();
                        console.log($scope.data);                       
                    } else {
                        console.log(d.data);
                    }
                    //$scope.safeApply();
                },
                function (er) {
                    console.log(er);
                });
	});

	$scope.getItem = function (tp, id) {
	    if ($scope.data == undefined) return null;
	    return Enumerable.From($scope.data[tp])
            .Where(function (i) { return i.Id == id }).FirstOrDefault();
	}

	$scope.prepareData = function () {
        //$.each()
	}

	$scope.selectedUser = null;
	$scope.saveUser = function () {
	    $http.post("Tasks.aspx?tp=saveUser",$scope.selectedUser, null)
           .then(
               function (d) {
                   if (d.data != "error") {
                      // tbd
                   } else {
                       console.log(d.data);
                   }
                   //$scope.safeApply();
               },
               function (er) {
                   console.log(er);
               });
	}

};