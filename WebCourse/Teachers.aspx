<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Teachers.aspx.cs" Inherits="Teachers"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div  runat="server" class="frame-table"  ng-app="myAPP" ng-controller="MyController2" >
        <h3> Teachers</h3>
        <form name="myForm  col-sm-8" >
            <div runat="server" class="form-group">
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-search"></i></div>
                    <input runat="server" type="text" class="col-sm-3" placeholder="Search" ng-model="searchFish"/>
                </div>
            </div>
        </form>
        <div class="table-responsive col-sm-8">
            <table class="table table-hove">
                <thead>
                    <tr>
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
                    </tr>
                </thead>
                <tbody>
                    <tr runat="server" ng-repeat="roll in Users | orderBy:sortType:sortReverse | filter: searchFish">

                        <td>
                            <span onclick="EditMode(this,1)">{{roll.Firstname}}</span>
                        </td>
                        <td>
                            <span onclick="EditMode(this,1)">{{roll.Lastname}}</span>
                        </td>
                        <td>
                              <span onclick="EditMode(this,1)">{{roll.Email}}</span>
                        </td>
                    </tr>
                </tbody>
            </table>
           </div>
    </div>  
</asp:Content>

