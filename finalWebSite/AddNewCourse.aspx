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
<div class="row">
     <Label ID="Label2" class="col-xs-12" runat="server" Text="Label"> Course ID:</Label>
      <div runat="server" class="col-xs-6" style="padding-bottom:10px;">
        <input  ID="tbCourseID" runat="server" Class="form-control" ng-model="courseID" placeholder="Course ID">
      </div>
</div>
<div class="row">

         <Label ID="Label1" class="col-xs-12" runat="server" Text="Label"> Course Name :</Label>
      <div class="col-xs-6">
        <input ID="tbCourseName" runat="server" Class="form-control" ng-model="courseName" placeholder="Course Name">
       </div>
    </div>

<div ng-controller="addstudentController" class="row" style="padding-top:30px;padding-left:30px;">    <Button class="btn-primary" ID="addCourse" runat="server"  ng-click="AddCourse()"> add course </Button></div>


