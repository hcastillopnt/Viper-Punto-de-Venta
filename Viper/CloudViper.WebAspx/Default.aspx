<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CloudViper.WebAspx.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Sistema de Punto de Venta Viper-OwalTek Innovation Solutions</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500" />
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="stylesheet" href="Content/font-awesome.min.css" />
    <link rel="stylesheet" href="Content/form-elements.css" />
    <link rel="stylesheet" href="Content/style.css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>

<body>
    <!-- Top content -->
    <div class="top-content">

        <div class="inner-bg">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3>Sistema de Punto de Venta para Farmacias VIPER</h3>
                                <p>Ingrese su usuario y contraseña para iniciar:</p>
                            </div>
                            <div class="form-top-right">
                                <asp:Image ID="imgLogotipo" runat="server" ImageUrl="~/images/application_icon.ico" />
                            </div>
                        </div>
                        <div class="form-bottom">
                            <form role="form" runat="server" method="post" class="login-form">
                                <div class="form-group">
                                    <label class="sr-only" for="form-username">Username</label>
                                    <input type="text" name="form-username" placeholder="Username..." class="form-username form-control" id="form-username" />
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-password">Password</label>
                                    <input type="password" name="form-password" placeholder="Password..." class="form-password form-control" id="form-password" />
                                </div>
                                <button type="submit" class="btn-info">Iniciar Sesion</button>
                            </form>
                        </div>
                        <div class="panel-footer">
                            <h6>
                                <asp:Image ID="imgLogotipoConsultoria" runat="server" 
                                    ImageUrl="~/images/OwalTek.jpg" Width="40px" Height="25px" />
                                OwalTek Consultoria Informatica | <span class="hidden-xs">Sistema </span>Viper Versión 1.0
                            </h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Javascript -->
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.backstretch.min.js"></script>
    <script src="Scripts/scripts.js"></script>

    <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

</body>
</html>
