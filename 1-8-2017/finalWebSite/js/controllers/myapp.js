var app = angular.module('myAPP', ['ngRoute']);

app.config(function ($routeProvider) {

    $routeProvider
        .when('/', {
            templateUrl: 'mycourses.aspx'
        })
        .when('/logout', {
            templateUrl: 'Logout.aspx'        
        })
        .when('/Courses', {
            templateUrl: 'mycourses.aspx',
            controller: 'courseController'      
        }).when('/Assignment', {
            templateUrl: 'showAssignment.aspx',
            controller: 'AssignmentController'
        }).when('/Grade', {
            templateUrl: 'myGrade.aspx',
            controller: 'myGradeController'
        }).when('/GradesLab', {
            templateUrl: 'gradesLab.aspx',
            controller: 'EditGradeController'
        }).when('/adduser', {
            templateUrl: 'Regist.aspx',
            controller: 'userController'
        }).when('/EditUser', {
            templateUrl: 'EditUser1.aspx',
            controller:'getUsers'
        }).when('/AddAssignment', {
            templateUrl: 'addNewAssignment.aspx',
            controller: 'addAssignmentController'
            
        }).when('/DeleteAssignment', {
            templateUrl: 'Regist.aspx'
        }).when('/AddCourse', {
            templateUrl: 'AddNewCourse.aspx',
            controller: 'addCourseController'
        }).when('/DeleteCourse', {
            templateUrl: 'Regist.aspx'
        }).when('/AddStudentToCourse', {
            templateUrl: 'Regist.aspx',
            controller:'courseController'

        });


}).controller('userController', function ($scope, $http, $log, $rootScope) {
    $scope.products = [{
        value: '1',
        label: 'admin'
    }, {
        value: '2',
        label: 'teacher'
        }, {
            value: '3',
            label: 'student'
    }];

    $scope.Regist = function () {
        $scope.data1 = {
            userID: $scope.userID,
            Firstname: $scope.Firstname,
            Lastname: $scope.Lastname,
            Email: $scope.Email,
            Password: $scope.Password,
            Role: $scope.seletedRole.value
        }
        alert($scope.data1.userID);
        alert($scope.data1.Role);

        var post = $http({
            method: "POST",
            url: "/WebService.asmx/AddUser",
            dataType: 'json',
            data: { newUser: $scope.data1 },
            headers: { "Content-Type": "application/json" }
        });
        post.success(function (data, status) {
            $window.alert(data.d);
        });

        post.error(function (data, status) {
            $window.alert(data.Message);
        });
    }
    $scope.deleteUser = function () {
        alert($scope.userid);
        var post = $http({
            method: "POST",
            url: "/WebService.asmx/DeleteUsere",
            dataType: 'json',
            data: { userId: $scope.userid },
            headers: { "Content-Type": "application/json" }
        });
        post.success(function (data, status) {
            $window.alert(data.Message);
        });

        post.error(function (data, status) {
            $window.alert(data.Message);
        });
    }
    }).controller('getUsers', function ($scope, $http, $log, $rootScope) {

        $http({
            method: 'GET',
            url: '/WebService.asmx/GetAllTheUsers'
        })
            .then(function (data) {
                var response = angular.fromJson(data);
                $rootScope.students = JSON.parse(response.data);
                alert(response.data);
            })
    })


    .controller('showUsers', function ($scope, $http, $log, $rootScope, $window) {
        $scope.search = {};
        $scope.selectedIndex = null;

        $scope.selectedPerson = null;
        $scope.selectPerson = function (roll, index) {
            $rootScope.selectedPerson = roll;
            $scope.selectedIndex = index;

        };

        $scope.sortType = 'name'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $scope.searchFish = '';     // set the default search/filter 

        // backup for $scope.sushi
        //$scope.Users = $rootScope.Users
        //$log.info($rootScope.Users);
        // $scope.UseresBack = angular.copy($scope.Users);
        $log.info($scope.students);
        $log.info($rootScope.students);

    })
    .controller('editUsers', function ($scope, $rootScope, $http) {
        alert("editUsersController");
        $scope.save = function () {
            $scope.data1 = {
                UserId: $scope.selectedPerson.UserId,
                Firstname: $scope.selectedPerson.Firstname,
                Lastname: $scope.selectedPerson.Lastname,
                Email: $scope.selectedPerson.Email,
                Password: $scope.selectedPerson.Password,
                Role: $scope.selectedPerson.seletedRole
            }
            alert($scope.data1.userId);
            var post = $http({
                method: "POST",
                url: "/WebService.asmx/EditUser",
                dataType: 'json',
                data: { newUser: $scope.data1 },
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
    .controller('courseController', function ($scope, $http, $log, $rootScope) {

    $http({
        method: 'GET',
        url: '/WebService.asmx/GetCourses'
    })
        .then(function (data) {
            var response = angular.fromJson(data);
            $rootScope.courses = JSON.parse(response.data);
            alert(response.data);
        })
    })
    .controller('addCourseController', function ($scope, $http, $log, $rootScope, $window) {
        $scope.AddCourse = function () {
            $scope.data1 = {
                courseID: $scope.courseID,
                courseName: $scope.courseName,

            }
            var post = $http({
                method: "POST",
                url: "/WebService.asmx/AddCourse",
                dataType: 'json',
                data: { newCourse: $scope.data1 },
                headers: { "Content-Type": "application/json" }
            });
            post.success(function (data, status) {
                $window.alert(data.Message);
            });

            post.error(function (data, status) {
                $window.alert(data.Message);
            });
        }
    })
    .controller('addAssignmentController', function ($location,$scope, $http, $log, $rootScope, $window) {
        $scope.products = [{
            value: '1',
            label: 'Homework'
        }, {
            value: '2',
            label: 'Lab'
       
        }];
        $scope.AddAssign = function () {
            alert($scope.selectedtype.value);
            $scope.data = {
                CourseId: $rootScope.courseid,
                AssignmentName: $scope.courseNameAssig,
                SubDate: $scope.assignmentdate,
                Type: $scope.selectedtype.value
            }
            var post = $http({
                method: "POST",
                url: "/WebService.asmx/addAssignment",
                dataType: 'json',
                data: { newAssign: $scope.data },
                headers: { "Content-Type": "application/json" }
            });
            post.success(function (data, status) {
                $window.alert(data.d);
                location.href = "#Assignment?id=" + $rootScope.courseid;
            });

            post.error(function (data, status) {
                $window.alert(data.Message);
            });
        }
    }).controller('addstudentController', function ($location, $scope, $http, $log, $rootScope, $window) {
        $scope.products = $rootScope.courses;
        $scope.AddAssign = function () {
            alert($scope.selectedtype.value);
            $scope.data = {
                CourseId: $rootScope.courseid,
                AssignmentName: $scope.courseNameAssig,
                SubDate: $scope.assignmentdate,
                Type: $scope.selectedtype.value
            }
            var post = $http({
                method: "POST",
                url: "/WebService.asmx/addAssignment",
                dataType: 'json',
                data: { newAssign: $scope.data },
                headers: { "Content-Type": "application/json" }
            });
            post.success(function (data, status) {
                $window.alert(data.d);
                location.href = "#Assignment?id=" + $rootScope.courseid;
            });

            post.error(function (data, status) {
                $window.alert(data.Message);
            });
        }
    })
    .controller('AssignmentController', function ($scope, $location, $http, $log, $rootScope, $window) {
        $scope.sidCourse = $location.search().id;
        $scope.courseName = $location.search().course;


        var post = $http({
            method: "POST",
            url: "/WebService.asmx/Getassignment",
            dataType: 'json',
            data: JSON.stringify({ CourseID: $location.search().id }),
            headers: { "Content-Type": "application/json" }
        });
        $rootScope.courseid = ($location.search().id);
        
        post.success(function (data, status) {
            $scope.assign = data.d;
            $scope.assign = JSON.parse(JSON.parse(data.d));
        });

        post.error(function (data, status) {
            $window.alert(data.Message);
        });

    }).controller('myGradeController', function ($scope, $location, $http, $log, $rootScope, $window) {
        alert($location.search().name);
        alert($rootScope.courseid);
        alert("aaaa")
        var post = $http({
            method: "POST",
            url: "/WebService.asmx/getStudenAssignment",
            dataType: 'json',
            data: "{ \"courseID\":\"" + $rootScope.courseid + "\",\"assignmentId\":\"" + ($location.search().name) + "\"}",
            headers: { "Content-Type": "application/json" }
        });
        $rootScope.courseid = ($location.search().id);
        post.success(function (data, status) {
            $window.alert(data.d);
            $scope.grade = data.d;
            $window.alert($scope.grade);
            $scope.grade = JSON.parse(JSON.parse(data.d));
            $window.alert($scope.grade.json);

        });

        post.error(function (data, status) {
            $window.alert(data.Message);
        });

    })

    //.controller('myGradeController', function ($scope, $location, $http, $rootScope, $window) {
    //    alert($rootScope.courseid);
    //    alert(($location.search().name));
    //    var datajson = "{ \"courseID\":\"" + $rootScope.courseid + "\",\"name\":\"" + ($location.search().name) + "\"}";
    //    var post = $http({
    //        method: "POST",
    //        url: "/WebService.asmx/getStudenAssignment",
    //        dataType: 'json',
    //        data: datajson,
    //        headers: { "Content-Type": "application/json" }
    //    });
    //    $rootScope.courseid = ($location.search().id);
    //    post.success(function (data, status) {
    //        $scope.assign = data.d;
    //        $window.alert($scope.assign);
    //        $scope.assign = JSON.parse(JSON.parse(data.d));
    //        $window.alert($scope.assign.json);

    //    });

    //    post.error(function (data, status) {
    //        $window.alert(data.Message);
    //    });

    //})

    .controller('EditGradeController', function ($scope, $http, $log, $rootScope, $location, $window) {

        //$http({
        //    method: 'GET',
        //    url: '/WebService.asmx/GetAssigmnetUsersCourse'
        //})
        //    .then(function (data) {
        //        var response = angular.fromJson(data);
        //        $rootScope.students = JSON.parse(response.data);
        //        alert(response.data);
        //    })
        alert($location.search().name);
        alert($rootScope.courseid);
        $rootScope.assignmentId = $location.search().name;
        alert("aaaa")
        var post = $http({
            method: "POST",
            url: "/WebService.asmx/GetAssigmnetUsersCourse",
            dataType: 'json',
            data: "{ \"sid\":\"" + $rootScope.courseid + "\",\"assignmentID\":\"" + ($location.search().name) + "\"}",
            headers: { "Content-Type": "application/json" }
        });
        $rootScope.courseid = ($location.search().id);
        post.success(function (data, status) {
            $window.alert(data.d);
            $scope.grade = data.d;
            $window.alert($scope.grade);
            $scope.grade = JSON.parse(JSON.parse(data.d));
            $window.alert($scope.grade.json);

        });

        post.error(function (data, status) {
            $window.alert(data.Message);
        });
    })
    .controller('MyController1', function ($scope, $http, $log, $rootScope, $http, $window) {
        $scope.sortType = 'name'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $scope.searchFish = '';     // set the default search/filter 
        // backup for $scope.sushi
        //$scope.Users = $rootScope.Users
        //$log.info($rootScope.Users);
        // $scope.UseresBack = angular.copy($scope.Users);
        $log.info($scope.grade);
        $log.info($rootScope.grade);
        $scope.save = function () {
            $scope.UseresBack = angular.copy($scope.grade);
            $log.info($scope.grade);
            $("tbody td").css("color", "black");
            var post = $http({
                method: "POST",
                url: "/WebService.asmx/EditGrades",
                dataType: 'json',
                data: JSON.stringify({ name: JSON.stringify($scope.grade), assignmentId: $rootScope.assignmentId }),
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
            $scope.grade = angular.copy($scope.UseresBack);
            $("tbody td").css("color", "black");
        }

        $scope.$watch('grade', function (newVal, oldVal) {
            $(event.target).parent().css("color", "red");
        }, true);
    })
