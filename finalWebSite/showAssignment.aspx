<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showAssignment.aspx.cs" Inherits="showAssignment" %>

      <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            {{courseName}}
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-desktop"></i>  <a href="#/">Home</a>
                            </li>
                                 <li>
                                <i class="fa fa-desktop"></i>  <a href="#/Courses">My Courses</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-desktop"></i>  {{courseName}}
                            </li>

                   
                        </ol>
                                 <div style="float:Left;padding-left:50px; padding-bottom:30px;font-size:15px" id="showteacher" class="hidden">
                        <a href="#/AddAssignment"><i class="fa fa-fw fa-edit"></i> add Assigment </a>
                    </div>
                                

                    </div>
                </div>
              
        <div class="row">
                  <div class="panel panel-info col-md-6 col-xs-12 col-sm-6">
                            <div class="panel-heading">
                                <h3 class="panel-title text-center">Homeworkes list</h3>
                            </div>
                            <div class="panel-body">
                                 <div  ng-repeat="iroll in assign.jsonhmw | orderBy:sortType:sortReverse | filter: searchFish">
                                    <a href="#{{assign.path}}?name={{iroll.AssignmentId}}">{{iroll.assignment}}</a>
                                 </div>
                            </div>
                        </div>
                    
                       <div class="panel panel-info col-md-6 col-xs-12 col-sm-6">
                            <div class="panel-heading">
                                <h3 class="panel-title text-center">Labs list</h3>
                            </div>
                            <div class="panel-body">
                                 <div  ng-repeat="roll in assign.jsonLabs | orderBy:sortType:sortReverse | filter: searchFish">
                                    <a href="#{{assign.path}}?name={{roll.AssignmentId}}">{{roll.assignment}}</a>
                                 </div>
                            </div>
                        </div>
    
                </div>
           <script>
               var json = JSON.parse(JSON.parse(localStorage.getItem("user")));
               if (json.Role == 'Teacher') {
                   $("#showteacher").removeClass("hidden");
                
               }
           </script>            
                           
