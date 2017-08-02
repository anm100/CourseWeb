<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="DeleteUser.aspx.cs" Inherits="DeleteUser" %>

<Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server"  ng-app="myApp"  ng-controller="MyController" ng-submit="deleteUser()">
     <div class="container" >
        <div class="form-horizontal">
            <h2>Delete User</h2>
            <hr />
            <div class="form-group" >
                <Label ID="Label1" runat="server" CssClass="col-md-2 control-label">User ID</Label>
                <div class="col-md-3">
                 <input ID="tdUSerID" CssClass="form-control" runat="server" ng-model="userid" required="required">
            <div>

            </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <Button runat="server" ID="btdelete" class="btn btn-default"  type="submit" text="delete" />
                </div>
            </div>
        </div>
         </div>
        </form>

      