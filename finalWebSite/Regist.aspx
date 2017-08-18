<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Regist.aspx.cs" Inherits="Regist" EnableEventValidation="false" %>
          <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Add user 
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-desktop"></i>  <a href="#/">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-desktop"></i> Add user 
                            </li>
                        </ol>
                    </div>
                </div>
            <div>
   <form class="form-signin" name="loginForm">       
    <div>
             <label class="col-xs-11">ID :</label>
           <div class="form-group" ng-class="{'has-error': loginForm.userid.$invalid && loginForm.userid.$dirty, 'has-success': loginForm.userid.$valid }">
             <input type="text" pattern="[0-9]{9}"class="form-control" placeholder="ID" name="userid" ng-model="userID" ng-minLength="9" required/>
            <p class="alert alert-danger" ng-if="loginForm.userid.$invalid && loginForm.userid.$dirty">enter 9 numbers</p>
            </div>

                <label class="col-xs-11">Email :</label>
         <div class="form-group" ng-class="{'has-error': loginForm.email.$invalid && loginForm.email.$dirty, 'has-success': loginForm.email.$valid }">
             <input type="email" class="form-control" placeholder="Email" name="email" ng-model="Email"  required/>
            <p class="alert alert-danger" ng-if="loginForm.email.$invalid && loginForm.email.$dirty">example@example.com</p>
         </div>
                
                   <div class="form-group" ng-class="{'has-error': loginForm.password.$invalid && loginForm.password.$dirty, 'has-success': loginForm.password.$valid}">
                     <input type="password" class="form-control" placeholder="Password" name="password" ng-model="Password" ng-minLength="4" required/>
                     <div class="alert alert-danger" ng-if="loginForm.password.$invalid && loginForm.password.$dirty">Please Enter at least 4 characters</div>
                </div>
                  <label class="col-xs-11">Confirm password</label>
                  <div class="form-group" ng-class="{'has-error': loginForm.passowrd2.$invalid && loginForm.passowrd2.$dirty, 'has-success': loginForm.passowrd2.$valid }">
                    <input ID="tbCPass" name="passowrd2" runat="server" Class="form-control" placeholder="Confirm Password" type="Password" ng-minLength="4" required>

                </div>       
                <label class="col-xs-11">First Name : </label>
                <div class="form-group" ng-class="{'has-error': loginForm.fname.$invalid && loginForm.fname.$dirty, 'has-success': loginForm.fname.$valid }">
                  <input name="fname" ID="tbfirstname" runat="server" Class="form-control" ng-model="Firstname" placeholder="Firstname" required>
                </div>

                <label class="col-xs-11">LastName</label>
                <div class="form-group" ng-class="{'has-error': loginForm.lname.$invalid && loginForm.lname.$dirty, 'has-success': loginForm.lname.$valid }">
                    <input name="lname" ID="tbLastName" runat="server" Class="form-control" ng-model="Lastname" placeholder="LastName" required>

                </div>
                <div class="row">
                <label class="col-xs-11">Role</label>
                <div style="padding-bottom:20px;" class="col-xs-11">
                        <select ng-model="seletedRole" 
                                ng-options="product as product.label for product in products">           
                        </select>
                        </div>
                 <Button class="btn btn-lg btn-primary btn-block" ng-disabled="loginForm.$invalid || loginForm.password.$invalid" ID="addCourse" runat="server"  ng-click="Regist()" type="submit"> add user </Button>
 </div>         
        </form>
            </div>


