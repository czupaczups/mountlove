<?php
session_start();
?>
<html>
<!--
    <head>
-->
<?php include_once 'core/head.php'; ?>
</head>

<body>
    <?php include_once 'core/header.php'; ?>
    <!-- sekcja header -->

    <?php
      if(1==1){
      include_once 'core/userpanel.php';
    }
    ?>
    <!--sekcja main-->
    <div id="main" class="container">
        <div class="row justify-content-right">
            <div id="tresc" class="col-md-12">
                <div id="navi" class="container">
                <!--navibar-->
                  <div clas="row">
                      <div class="col">
                          <br>
                          <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.php">Strona główna</a></li>
                            <li class="breadcrumb-item active">Panel Użytkownika</li>
                          </ol>
                        </div>
                  </div>
                </div>
                <br>
                <h3> Panel Użytkownika</h3><br>
                <?php
                if(isset($_SESSION['uid']) and $_SESSION['uid'] == 2){
                  ?>
                  <a href="changename.php"><button type="button" class="btn btn-dark">Zmień dane personalne</button></a>
                  <br><br>
                  <a href="changeemail.php"><button type="button" class="btn btn-dark">Zmień adres e-mail</button></a>
                  <br><br>
                  <a href="changepass.php"><button type="button" class="btn btn-dark">Zmień hasło</button></a>
                  <br><br>
                  <a href="addevent.php"><button type="button" class="btn btn-dark">Dodaj event do bazy</button></a>
                  <?php
                }else{
                  ?>
                  <div class="alert alert-danger" role="alert">Nie jesteś zarejestrowanym użytkownikiem, więc nie powinno Cię tu być!</div>
                  <?php
                }
                  ?>

            <br>
            <a href="javascript:scroll(0,0);">Wróć na górę strony</a>
            <br>

        </div>
        </div>

    </div>
</body>

</html>
