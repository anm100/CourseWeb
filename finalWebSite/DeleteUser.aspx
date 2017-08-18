<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="DeleteUser.aspx.cs" Inherits="DeleteUser" %>
          <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Delete user 
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-desktop"></i>  <a href="#/">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-desktop"></i> Delete user 
                            </li>
                        </ol>
                    </div>
                </div>
<form class="form-signin" name="loginForm">       
  <div>
            <label class="col-xs-11 col-md-1">User ID :</label>
           <div class="form-group col-md-8 col-xs-11" ng-class="{'has-error': loginForm.userid.$invalid && loginForm.userid.$dirty, 'has-success': loginForm.userid.$valid }">
             <input type="text" pattern="[0-9]{9}"class="form-control" placeholder="ID" name="userid" ng-model="userid" ng-minLength="9" required/>
            <p class="alert alert-danger" ng-if="loginForm.userid.$invalid && loginForm.userid.$dirty">enter 9 numbers</p>
            </div>
         <Button type="submit" class="btn btn-lg btn-primary btn-block" ID="addCourse" runat="server"  ng-disabled="loginForm.$invalid" ng-click="deleteUser()"> delete user </Button>
               
   </div>
   </form>

      