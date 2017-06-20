<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
    <div class="jumbotron">
        <h1>Chinese  Learning</h1>
        <p class="lead">Learning Chinese has become a popular phenomenon.Chinese is an interesting and meaningful language.
            This website provides free Chinese learning method, more excellent content, please pay attention!</p>
        <p><a href="Default.aspx" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Basic Chinese</h2>
            <p>
                In this section,you can learn the basics of learning Chinese,
                such as popular words, proverbs, pinyin, grammar, etc.
            </p>
            <p>
                <a class="btn btn-default" href="BasicChinese.aspx">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Chinese Reading</h2>
            <p>Extensive Reading</p>
            <p> Ancient Chinese Poetry</p>
            <p> Bilingual News</p>
            <p> Chinese Short Story</p>
            <p>
                <a class="btn btn-default" href="ChineseReading.aspx">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Chinese Culture</h2>
            <p>
                Including Chinese traditional festival,Chinese kung fu,Chinese food menu and so on.It's very interesting!
            </p>
            <p>
                <a class="btn btn-default" href="ChineseCulture.aspx">Learn more &raquo;</a>
            </p>
        </div>
    </div>
        <div class="row">
        <div class="col-md-4">
            <h2>Spoken Chinese</h2>
            <p>
                In this section,you can learn the basics of learning Chinese,
                such as popular words, proverbs, pinyin, grammar, etc.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Films and Songs</h2>
            <p>Extensive Reading</p>
            <p> Ancient Chinese Poetry</p>
            <p> Bilingual News</p>
            <p> Chinese Short Story</p>
            <p>
                <a class="btn btn-default" href="Films and Songs.aspx">Learn more &raquo;</a>
            </p>
        </div>
        
    </div>
</asp:Content>
