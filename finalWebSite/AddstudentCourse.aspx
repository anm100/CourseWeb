<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddstudentCourse.aspx.cs" Inherits="AddstudentCourse" %>

     <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Add student to course 
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-desktop"></i>  <a href="#/">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-desktop"></i>  Add student to course
                            </li>
                        </ol>
                    </div>
                </div>
<form class="form-signin" name="loginForm">       
  <div>
<div class="row">
     <Label ID="Label2" class="col-xs-6" runat="server" Text="Label"> Student id :</Label>
           <div class="form-group" ng-class="{'has-error': loginForm.userid.$invalid && loginForm.userid.$dirty, 'has-success': loginForm.userid.$valid }">
            <input type="text" pattern="[0-9]{9}"class="form-control" placeholder="ID" name="userid" ng-model="studentIdCourse" ng-minLength="9" required/>
            <p class="alert alert-danger" ng-if="loginForm.userid.$invalid && loginForm.userid.$dirty">enter 9 numbers</p>
          </div>
</div>

<div style="padding-bottom:30px;" class="row">
    <label class="col-md-2 col-xs-12" for="repeatSelect"> Choose course : </label>
    <select class="col-md-8 col-xs-12" name="repeatSelect" id="repeatSelect" ng-model="courseList.model">
      <option ng-repeat="option in courseList.availableOptions" value="{{option.CourseID}}">{{option.CourseName}}-{{option.CourseID}}</option>
    </select>
 </div>
    
         <Button type="submit" class="btn btn-lg btn-primary btn-block" ID="addCourse" runat="server"  ng-disabled="loginForm.$invalid" ng-click="AddStudentCourse()()"> add student </Button>
     </div>


    

