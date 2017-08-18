<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="AddNewCourse.aspx.cs" Inherits="AddNewCourse" %>
          <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            New course
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-desktop"></i>  <a href="#/">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-desktop"></i> Add course
                            </li>
                        </ol>
                    </div>
                </div>
<form class="form-signin" name="loginForm">       
  <div>
        
        <div class="row">
          <Label ID="Label2" class="col-xs-12" runat="server" Text="Label"> Course ID:</Label>
           <div class="form-group" ng-class="{'has-error': loginForm.useridcourse.$invalid && loginForm.useridcourse.$dirty, 'has-success': loginForm.useridcourse.$valid }">
             <input type="text" pattern="[0-9]*" class="form-control" placeholder="courseID" name="useridcourse" ng-model="courseID" ng-minLength="4" required/>
            <p class="alert alert-danger" ng-if="loginForm.useridcourse.$invalid && loginForm.useridcourse.$dirty">enter at least 4 numbers</p>
            </div>
        </div>
<div class="row">

         <Label ID="Label1" class="col-xs-12" runat="server" Text="Label"> Course Name :</Label>
            <div class="form-group" ng-class="{'has-error': loginForm.coursename.$invalid && loginForm.coursename.$dirty, 'has-success': loginForm.userid.$valid }">
             <input type="text" class="form-control" placeholder="course name" name="coursename" ng-model="courseName" ng-minLength="4" required/>
            <p class="alert alert-danger" ng-if="lloginForm.coursename.$dirty"></p>
            </div>
    </div>
      
         <Button type="submit" class="btn btn-lg btn-primary btn-block" ID="addCourse" runat="server"  ng-disabled="loginForm.$invalid" ng-click="AddCourse()"> add course </Button>
    </div>
    </form>

