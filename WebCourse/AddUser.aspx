<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <!-----newTeacher---->   
     <div runat="server" class="container" ng-app="myAPP" ng-model="newUser" ng-controller="MyController">

    <h3 class="col-xs-11">Add New User</h3>
   
            
            <label class="col-xs-11">ID</label>
            <div class="col-xs-11">
            <asp:TextBox runat="server" ID="tbID" class="form-control " ng-model="ID" placeholder="ID" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="text-danger" ErrorMessage="The ID field is Required!" ControlToValidate="tbID"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="rvDigits" runat="server" ControlToValidate="tbID" ErrorMessage="Enter ID only till 9 digit" ValidationExpression="^[0-9]{0,9}$">
        </asp:RegularExpressionValidator>
        </div>
             <label class="col-xs-11">Firstname</label>
            <div class="col-xs-11">
            <asp:TextBox runat="server" ID="tbFname" class="form-control" ng-model="Firstname" placeholder="Firstname"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger" ErrorMessage="The Firstname field is Required!" ControlToValidate="tbFname"></asp:RequiredFieldValidator>
        </div>
            
         <label class="col-xs-11">Lastname</label>
            <div class="col-xs-11">
            <asp:TextBox runat="server" ID="tbLname" class="form-control" ng-model="Lastname" placeholder="Lastname"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="text-danger" ErrorMessage="The Lastname field is Required!" ControlToValidate="tbLname"></asp:RequiredFieldValidator>
                
        </div>
          <label class="col-xs-11">Email</label>
            <div class="col-xs-11">
            <asp:TextBox runat="server" ID="tbemail" class="form-control" ng-model="Email" placeholder="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="text-danger" ErrorMessage="The Lastname field is Required!" ControlToValidate="tbemail"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="validateEmail"    
              runat="server" ErrorMessage="Invalid email."
              ControlToValidate="tbemail" 
                CssClass="text-danger"
              ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
        </div>
            <label class="col-xs-11">Password</label>
            <div class="col-xs-11">
            <asp:TextBox runat="server" ID="tbpassword" class="form-control" ng-model="Password" placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="text-danger" ErrorMessage="The Lastname field is Required!" ControlToValidate="tbpassword"></asp:RequiredFieldValidator>


        </div>
  
            <label class="col-xs-11">Confirm Password</label>
            <div class="col-xs-11">
            <asp:TextBox runat="server" ID="tbCpass" class="form-control" placeholder="Comfirm Paswword"></asp:TextBox>
<asp:CompareValidator runat="server" id="cmpNumbers" controltovalidate="tbCpass" controltocompare="tbpassword" CssClass="text-danger    " operator="Equal" type="String" errormessage="password did't match" /><br />
        </div>
                    <label class="col-xs-11">Role</label>
            <div class="col-xs-11">
                <asp:DropDownList ID="drRole" runat="server" AppendDataBoundItems="True" ng-model="Role" class="form-control"  placeholder="Role" ToolTip="Role">
                        <asp:ListItem Text="Admin" Value="1" />
                         <asp:ListItem Text="Student" Value="2" />
                     <asp:ListItem Text="Teacher" Value="3" />
                </asp:DropDownList>
        </div>
               <div class="col-sm-8 space-vert col-xs-offset-2">
                   <asp:Button runat="server" ID="btRegist" class="btn btn-success" text="Regist"  OnClick="btRegist_Click"/>
                    <asp:Button runat="server" ID="btDelete" class="btn btn-warning" text="Delete"/>
           </div>
        <!-----newTeacher---->
            </div>
</asp:Content>

