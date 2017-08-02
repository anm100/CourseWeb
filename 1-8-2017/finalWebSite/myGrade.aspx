<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myGrade.aspx.cs" Inherits="myGrade" %>
  <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            {assigment name}
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-desktop"></i>  <a href="#/">Home</a>
                            </li>
                             <li>
                                <i class="fa fa-desktop"></i>  <a href="#/Courses">My Courses</a>
                            </li>
                                                         <li>
                                <i class="fa fa-desktop"></i>  <a href="#/Courses">{course name}</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-form"></i>    {assigment name}
                            </li>
                        </ol>
                    </div>
                </div>
    <div class="container">
      <div class="col-md-10">
      <div class="panel panel-default">
				<div class="panel-heading" >grade:</div >
				<div class="panel-body" >
                   
					<dl runat="server" ng-repeat="roll in grade.json">
						<dt >Assignment name</dt >
						<dd >{{roll.AssignmentName}}</dd >
                       <dt >Submission date:</dt >
						<dd >{{roll.SubDate}}</dd >
						<dt >Grade:</dt >
						<dd >{{roll.Grade}}</dd >
					</dl >
                    </div>
          </div>
          </div>
        </div>

