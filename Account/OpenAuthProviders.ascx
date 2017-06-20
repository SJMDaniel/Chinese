<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OpenAuthProviders.ascx.cs" Inherits="OpenAuthProviders" %>

<div id="socialLoginList">
    <h4>Log in using other services</h4>
    <hr />
    <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>
            <p>
                <button type="submit" class="btn btn-default" name="provider" value="<%#: Item %>"
                    title="Use your<%#: Item %> account to login。">
                    <%#: Item %>
                </button>
            </p>
        </ItemTemplate>
        <EmptyDataTemplate>
            <div>
                <p>There is no external authentication service configured. Please refer to the<a href="http://go.microsoft.com/fwlink/?LinkId=252803">this article</a>，then learn more about how to set this page to support logging in through external services.</p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
</div>