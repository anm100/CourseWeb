<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mycourses.aspx.cs" Inherits="mycourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
    <body>
        
          <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            My Courses
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-desktop"></i>  <a href="#/">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-desktop"></i> My Courses
                            </li>

                        </ol>
                    </div>
                </div>
    <div>
    </div>
     
  <div  ng-repeat="roll in courses.json | orderBy:sortType:sortReverse | filter: searchFish">
                <div class="panel panel-info">
                            <div class="panel-heading">
                              <a href="#Assignment?id={{roll.CourseID}}&course={{roll.CourseName}}">  <h3 class="panel-title">{{roll.CourseName}}-{{roll.CourseID}}</h3></a>
                            </div>
                            <div class="panel-body">
                            </div>
                      <li><a href="#/showStudentsInCourse?courseId={{roll.CourseID}}"><i class="fa fa-fw fa-edit"></i> show students </a>     </li>
                        </div>
            </div>
</body>
</html>
