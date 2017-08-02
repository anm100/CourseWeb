<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="addNewAssignment.aspx.cs" Inherits="addNewAssignment" %>
       <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            add new assignment
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-desktop"></i>  <a href="#/">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-desktop"></i> Add new
                            </li>
                        </ol>
                    </div>
                </div>
<div class="row">
     <Label ID="Label2" class="col-xs-12" runat="server" Text="Label"> Assignment name:</Label>
      <div runat="server" class="col-xs-6" style="padding-bottom:10px;">
        <input  ID="tbCourseID" runat="server" Class="form-control" ng-model="courseNameAssig" placeholder="Assignment name:">
      </div>
</div>
<div class="row">

         <Label ID="Label1" class="col-xs-12" runat="server" Text="Label"> submition date </Label>
      <div class="col-xs-6">
        <input pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])
            " ID="tbCourseName" runat="server" Class="form-control" ng-model="assignmentdate" placeholder="YYYY-MM-DD">
       </div>
    </div>
      <label class="col-xs-11">assignment type</label>
                <div class="col-xs-11">
                 <div>
                        <select ng-model="selectedtype" 
                                ng-options="product as product.label for product in products">           
                        </select>
                        <div  />

<div class="row" style="padding-top:30px;padding-left:30px;">    <Button class="btn-primary" ID="addCourse" runat="server"  ng-click="AddAssign()"> add assignment </Button></div>



