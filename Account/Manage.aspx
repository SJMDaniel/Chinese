<%@ Page Title="Manage Accounts" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Account_Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>

    </div>

    <div class="row">
        <div class="col-md-12">
            <section id="passwordForm">
                <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
                    <p>
                        You don't have a local password for this site.
                        Please add the local password so that you can log in without an external login name。
                    </p>
                    <div class="form-horizontal">
                        <h4>Set the password form</h4>
                        <hr />
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-2 control-label">Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="password" TextMode="Password"  CssClass="form-control"  />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                    CssClass="text-danger" ErrorMessage="The password field is a mandatory field."
                                    Display="Dynamic" ValidationGroup="SetPassword" />
                                <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                                    CssClass="text-danger" SetFocusOnError="true" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password"  CssClass="form-control"  />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The Confirm password field is a mandatory field"
                                    ValidationGroup="SetPassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password does not match the confirmation password."
                                    ValidationGroup="SetPassword" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" Text="Set Password" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn btn-default" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                    <p>You use the <strong><%: User.Identity.GetUserName() %></strong> this identity。</p>
                    <div class="form-horizontal">
                        <h4>“Change Password”Form</h4>
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <div class="form-group">
                            <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" CssClass="col-md-2 control-label">Current Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                    CssClass="text-danger" ErrorMessage="The Current password field is a mandatory field"
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">New Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                    CssClass="text-danger" ErrorMessage="The New password field is a mandatory field"
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 control-label">Confirm New Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="“The ConfirmNewpassword field is a mandatory field。"
                                    ValidationGroup="ChangePassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password does not match the confirmation password。"
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" Text="ChangePassword" OnClick="ChangePassword_Click" CssClass="btn btn-default" ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>
            </section>

            <section id="externalLoginsForm">

                <asp:ListView runat="server"
                    ItemType="Microsoft.AspNet.Identity.UserLoginInfo"
                    SelectMethod="GetLogins" DeleteMethod="RemoveLogin" DataKeyNames="LoginProvider,ProviderKey">

                    <LayoutTemplate>
                        <h4>Registered login name</h4>
                        <table class="table">
                            <tbody>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </tbody>
                        </table>

                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#: Item.LoginProvider %></td>
                            <td>
                                <asp:Button runat="server" Text="Delete" CommandName="Delete" CausesValidation="false"
                                    ToolTip='<%# "Remove this from your account " + Item.LoginProvider + " login name" %>'
                                    Visible="<%# CanRemoveExternalLogins %>" CssClass="btn btn-default" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>

                <uc:openauthproviders runat="server" returnurl="~/Account/Manage" />
            </section>

        </div>
    </div>

</asp:Content>
