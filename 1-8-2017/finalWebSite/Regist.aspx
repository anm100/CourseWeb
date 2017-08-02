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
                <label class="col-xs-11">UserId</label>
                <div class="col-xs-12 col-md-6">
                    <input ID="tbUserId" runat="server" Class="form-control" pattern="[0-9]{9}" placeholder="UserId" ng-model="userID" ng-minLength="9" required="required"></input>
                    </div>
                <div class="col-xs-12 col-md-6"><p class="alert alert-danger" ng-if="loginForm.id.$invalid && loginForm.id.$dirty">enter 9 numbers</p></div>
                </div>
                <label class="col-xs-11">Email</label>
                <div class="col-xs-12 col-md-6">

                    <input ID="tbEmail" type="email" runat="server" Class="form-control" ng-model="Email" placeholder="Email" required="required">
                    </div>
                
                <label class="col-xs-12 col-md-12">
                    Password</label><div class="col-xs-6">
                    <input ID="tbPass" runat="server" Class="form-control" placeholder="Password" ng-model="Password" type="Password" required="required">

                </div>

                <label class="col-xs-11">Confirm Password</label>
                <div class="col-xs-6">
                    <input ID="tbCPass" runat="server" Class="form-control" placeholder="Confirm Password" type="Password" required="required">

                </div>

                <label class="col-xs-11">FirstName</label>
                <div class="col-xs-6">
                  <input ID="tbfirstname" runat="server" Class="form-control" ng-model="Firstname" placeholder="Firstname" required="required">

                </div>

                <label class="col-xs-11">LastName</label>
                <div class="col-xs-6">
                    <input ID="tbLastName" runat="server" Class="form-control" ng-model="Lastname" placeholder="LastName" required="required">

                </div>
                <label class="col-xs-11">Role</label>
                <div class="col-xs-11">
                 <div>
                        <select ng-model="seletedRole" 
                                ng-options="product as product.label for product in products">           
                        </select>
                        <div  />
                 <Button class="btn-primary " ID="addCourse" runat="server"  ng-click="Regist()"> add user </Button>

            </div>
        </div>

