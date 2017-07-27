<%@ Page Title="" Language="C#" MasterPageFile="~/teacherMasterPage.master" AutoEventWireup="true" CodeFile="gradesLab.aspx.cs" Inherits="gradesLab" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div runat="server" ng-app="myAPP">
            <div runat="server" ng-controller="MyController"></div>
    <div  runat="server" class="frame-table"  ng-controller="MyController1" >
        <h3> Edit users</h3>
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
                            <a runat="server" href="#" ng-click="sortType = 'ID'; sortReverse = !sortReverse">
                                Student ID
                                <span runat="server" ng-show="sortType == 'ID' && !sortReverse" class="fa fa-caret-down"></span>
                                <span runat="server" ng-show="sortType == 'ID' && sortReverse" class="fa fa-caret-up"></span>
                            </a>
                        </td>
                        <td>
                            <a runat="server" href="#" ng-click="sortType = 'grade'; sortReverse = !sortReverse">
                               grade
                                <span runat="server" ng-show="sortType == 'grade' && !sortReverse" class="fa fa-caret-down"></span>
                                <span runat="server" ng-show="sortType == 'grade' && sortReverse" class="fa fa-caret-up"></span>
                            </a>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr runat="server" ng-repeat="roll in students.json | orderBy:sortType:sortReverse | filter: searchFish">
                        <td>
                            <span>{{roll.Id}}</span>
                            <input runat="server" ng-model="roll.Id" type="number"
                                   style="display:none" onblur="EditMode(this, 0)" />
                        </td>
                        <td>
                            <span onclick="EditMode(this,1)">{{roll.grade}}</span>
                            <input runat="server" ng-model="roll.grade" type="number"
                                   onchange="$(this).parent().css('color','red')"
                                   style="display:none" onblur="EditMode(this, 1)" />
                        </td>
                       
                    </tr>
                </tbody>
            </table>
        
      </div>
          <div style="text-align:center;padding-top:10px"><button runat="server" ng-click="save()">Save</button>
            <button runat="server" ng-click="reset()">Reset</button></div>
        </div>
    </div>
    <script>

        function EditMode(el, isEdit) {
            $("tbody td input").hide();
            $("tbody td span").show();
            if (isEdit) {
                $(el).hide();
                $(el).next().show();
            } else {
                $(el).hide();
                $(el).prev().show();
            }
        }
    </script>
</asp:Content>

