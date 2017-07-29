<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mycourses.aspx.cs" Inherits="mycourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .icon {
            height: 92px;
            width: 83px;
        }
    </style>
</head>
    <div>
    show courses
    </div>
  <div  ng-repeat="roll in courses.json | orderBy:sortType:sortReverse | filter: searchFish">
                <div class="oneButtonArea">
                <div class="oneButtonIcon"">
                    <div class="oneIcon"><img src="Images/icon1.png" class="icon" /></div>
                <div ><a href="#Assignment?id={{roll.Id}}">
                <span>{{roll.Id}}</span>-name:  <span>{{roll.year}}</span>- semseter: <span>{{roll.semester}}</span><br/></a>
                           
                       </div>                </div>    
            </div>
                     
          </div>

</body>
</html>
