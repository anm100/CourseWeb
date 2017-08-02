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
<div class="row">
     <Label ID="Label2" class="col-xs-12" runat="server" Text="Label"> Student id :</Label>
      <div runat="server" class="col-xs-6" style="padding-bottom:10px;">
        <input  ID="tbCourseID" runat="server" Class="form-control" ng-model="courseNameAssig" placeholder="ID 9 numbers">
      </div>
</div>
<div class="row">
          <label class="col-xs-11">choose course :</label>
                <div class="col-xs-11">
                 <div>
                        <select ng-model="selectedCourse" 
                                ng-options="product as product.label for product in products">           
                        </select>
                     </div>
                        </div  >
         
    </div>


<div class="row" style="padding-top:30px;padding-left:30px;">    <Button class="btn-primary" ID="addCourse" runat="server"  ng-click="AddAssign()"> add assignment </Button></div>