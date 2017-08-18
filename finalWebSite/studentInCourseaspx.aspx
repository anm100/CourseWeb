<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentInCourseaspx.aspx.cs" Inherits="studentInCourseaspx" %>
    <div>

      <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Students in course
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-desktop"></i>  <a href="#/">Home</a>
                            </li>
                             <li>
                                <i class="fa fa-desktop"></i>  <a href="#/Courses">My Courses</a>
                            </li>
                                                         <li>
                                <i class="fa fa-desktop"></i>  <a href="#/Courses">students in course</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-form"></i>    
                            </li>
                        </ol>
                    </div>
                </div>

    <div runat="server">
            <div runat="server"></div>
        <h3> Edit grades </h3>
        <form name="myForm" >
            <div runat="server" class="form-group">
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-search"></i></div>
                    <input runat="server" type="text" class="form-control" placeholder="Search" ng-model="searchFish"/>
                </div>
            </div>
        </form>
        <div class="table-responsive ">
            <table class="table table-hove">
                <thead>
                    <tr>
                       
                         <td>
                            <a runat="server"  ng-click="sortType = 'FirstName'; sortReverse = !sortReverse">
                                Firstname
                                <span runat="server" ng-show="sortType == 'FirstName' && !sortReverse" class="fa fa-caret-down"></span>
                                <span runat="server" ng-show="sortType == 'FirstName' && sortReverse" class="fa fa-caret-up"></span>
                            </a>
                        </td>
                                                <td>
                            <a runat="server"  ng-click="sortType = 'Lastname'; sortReverse = !sortReverse">
                               Lastname
                                <span runat="server" ng-show="sortType == 'Lastname' && !sortReverse" class="fa fa-caret-down"></span>
                                <span runat="server" ng-show="sortType == 'Lastname' && sortReverse" class="fa fa-caret-up"></span>
                            </a>
                        </td>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr runat="server" ng-repeat="roll in userInCourse.json | orderBy:sortType:sortReverse | filter: searchFish">
                             <td>
                            <span >{{roll.Lastname}}</span>
                        </td>
                        <td>
                           <span> <{{roll.FirstName}}</span>
                        </td>
                       
                    </tr>
                </tbody>
            </table>
    </div>
    

    </div>
        </div>