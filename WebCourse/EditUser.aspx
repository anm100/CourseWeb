<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"   enableEventValidation="false" CodeFile="EditUser.aspx.cs" Inherits="js_EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
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
                                ID
                                <span runat="server" ng-show="sortType == 'ID' && !sortReverse" class="fa fa-caret-down"></span>
                                <span runat="server" ng-show="sortType == 'ID' && sortReverse" class="fa fa-caret-up"></span>
                            </a>
                        </td>
                        <td>
                            <a runat="server" href="#" ng-click="sortType = 'Firstname'; sortReverse = !sortReverse">
                                Firstname
                                <span runat="server" ng-show="sortType == 'Firstname' && !sortReverse" class="fa fa-caret-down"></span>
                                <span runat="server" ng-show="sortType == 'Firstname' && sortReverse" class="fa fa-caret-up"></span>
                            </a>
                        </td>
                        <td>
                            <a runat="server" href="#" ng-click="sortType = 'Lastname'; sortReverse = !sortReverse">
                                Lastname
                                <span runat="server" ng-show="sortType == 'Lastname' && !sortReverse" class="fa fa-caret-down"></span>
                                <span runat="server" ng-show="sortType == 'Lastname' && sortReverse" class="fa fa-caret-up"></span>
                            </a>
                        </td>
                        <td>
                            <a runat="server" href="#" ng-click="sortType = 'Email'; sortReverse = !sortReverse">
                                Email
                                <span runat="server" ng-show="sortType == 'Email' && !sortReverse" class="fa fa-caret-down"></span>
                                <span runat="server" ng-show="sortType == 'Email' && sortReverse" class="fa fa-caret-up"></span>
                            </a>
                        </td>
                        <td>
                            <a runat="server" href="#" ng-click="sortType = 'password'; sortReverse = !sortReverse">
                                password
                                <span runat="server" ng-show="sortType == 'password' && !sortReverse" class="fa fa-caret-down"></span>
                                <span runat="server" ng-show="sortType == 'password' && sortReverse" class="fa fa-caret-up"></span>
                            </a>
                        </td>
                        <td>
                            <a runat="server" href="#" ng-click="sortType = 'role'; sortReverse = !sortReverse">
                                role
                                <span runat="server" ng-show="sortType == 'role' && !sortReverse" class="fa fa-caret-down"></span>
                                <span runat="server" ng-show="sortType == 'role' && sortReverse" class="fa fa-caret-up"></span>
                            </a>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr runat="server" ng-repeat="roll in Users | orderBy:sortType:sortReverse | filter: searchFish">
                        <td>
                            <span onclick="EditMode(this,1)">{{roll.ID}}</span>
                            <input runat="server" ng-model="roll.ID" type="number"
                                   style="display:none" onblur="EditMode(this, 0)" />
                        </td>
                        <td>
                            <span onclick="EditMode(this,1)">{{roll.Firstname}}</span>
                            <input runat="server" ng-model="roll.Firstname" type="text"
                                   onchange="$(this).parent().css('color','red')"
                                   style="display:none" onblur="EditMode(this, 0)" />
                        </td>
                        <td>
                            <span onclick="EditMode(this,1)">{{roll.Lastname}}</span>
                            <input runat="server" ng-model="roll.Lastname" type="text"
                                   onchange="$(this).parent().css('color','red')"
                                   style="display:none" onblur="EditMode(this, 0)" />
                        </td>
                        <td>
                            <span onclick="EditMode(this,1)">{{roll.Email}}</span>
                            <input runat="server" ng-model="roll.Email" type="text"
                                   style="display:none" onblur="EditMode(this, 0)" />
                        </td>
                        <td>
                            <span onclick="EditMode(this,1)">{{roll.password}}</span>
                            <input  runat="server" ng-model="roll.password" type="text"
                                   onchange="$(this).parent().css('color','red')"
                                   style="display:none" onblur="EditMode(this, 0)" />
                        </td>
                        <td>
                            <span onclick="EditMode(this,1)">{{roll.role}}</span>
                            <input runat="server" ng-model="roll.role" type="text"
                                   onchange="$(this).parent().css('color','red')"
                                   style="display:none" onblur="EditMode(this, 0)" />
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

