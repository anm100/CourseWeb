<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="EditUser1.aspx.cs" Inherits="EditUser" %>

           

        <div class="container main-content">
               <div class="row" >
            <div class="col-md-8"> 
             
				<div class="col-md-12" >
                  <div  runat="server" class="frame-table"  ng-controller="showUsers" >
        <h3> Edit users</h3>
                    <div runat="server" class="form-group">
                <div class="input-group">
                    <div class="input-group-addon" "><i class="fa fa-search"></i></div>
                    <input runat="server" type="text" class="form-control"  placeholder="user" ng-model="search"/>
                </div>
            </div>
        <div class="table-responsive ">
            <table class="table table-hove table-bordered table-responsive">
                <thead>
                    <tr>
                        <td>
                            #
                        </td>
                        <td>
                           Name
                        </td>
                          <td>
                              Email
                        </td>
                       <td>
                              Role
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr runat="server" ng-repeat="roll in students.json |filter:search"
                        ng-style="{
                        'background-color':$index==selectedIndex ? 'lightgray':''}"
                        ng-click="selectPerson(roll,$index)">
                            <td>
                            {{$index}}
                            </td>
                        <td>
                            {{roll.Firstname +" "+ roll.Lastname}}
                        </td>
                            <td>
                            {{roll.Email}}
                        </td>
                        <td>
                            {{roll.Role}}
                        </td>
                       
                    </tr>
                </tbody>
            </table>
      </div>

        </div>
                    </div>
                
            </div>
            <div class="col-md-4" ng-controller="editUsers">
                <br />
                <br />
                <br />
                <div class="panel panel-default">
				<div class="panel-heading" >Details</div >
				<div class="panel-body" >

					<dl >
						<dt >ID</dt >
						<dd ><input runat="server" ng-model="selectedPerson.UserId"/></dd >
						<dt >Firstname</dt >
						<dd > <input runat="server" ng-model="selectedPerson.Firstname"/></dd >
						<dt >Lastname</dt >
						<dd ><input runat="server" ng-model="selectedPerson.Lastname"/></dd >
						<dt >Email</dt >
						<dd ><input runat="server" ng-model="selectedPerson.Email"/></dd >
						<dt >Password</dt >
						<dd ><input runat="server" ng-model="selectedPerson.Password"/></dd >
						<dt >Role</dt >
						<dd ><input runat="server" ng-model="selectedPerson.Role"/></dd >
					</dl >
            <div style="text-align:left;padding-top:10px">
                <button runat="server" ng-click="save()">Save</button>
            <button runat="server" ng-click="reset()">Reset</button></div>
            </div>
            </div>
                </div>

       </div>

    </div>


