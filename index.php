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
        <!--
        <div class="row justify-content-center">
        -->
        <div class="row justify-content-right">
            <div id="tresc" class="col-md-9">
                <div id="navi" class="container">
                <!--navibar-->
                  <div clas="row">
                      <div class="col">
                          <br>
                          <ol class="breadcrumb">
                            <li class="breadcrumb-item active">Strona główna</li>
                          </ol>
                        </div>
                  </div>
                </div>
                <br>
                <?php
                if(isset($_SESSION['tmplogged']) and $_SESSION['tmplogged'] == 1){ ?>
                    <div class="alert alert-success" role="alert">Udało Ci się zalogować!</div>
                    <?php
                    $_SESSION['tmplogged'] = 0;
                  }
                  /*
                if(isset($_SESSION['tmplogout']) and $_SESSION['tmplogout'] == 1){ ?>
                    <div class="alert alert-success" role="alert">Udało Ci się wylogować!</div>
                    <?php
                    $_SESSION['tmplogout'] = 0;
                  }
                  */
                     ?>

                     <?php
                     /*
                     if(isset($_SESSION['uid'])){
                     $usr = $_SESSION['uid'];
                     echo "$usr";

                   }
                   */?>
                   <p class="h2">Witaj MountLoversie</p>
                   <br>
                   <blockquote class="blockquote">
                   <p class="m-b-0">Jeśli chcesz być na bieżąco z eventami związanymi z turystyką górską to dobrze trafiłeś!
                   </p>
                   </blockquote>
            <img src="images/pic2.jpg" class="img-fluid">
            <p id="headertext" class="h1"><br>
            <?php
            echo 'MOUNTLOVE';
            ?>
            </p>
            <br>
            <a href="javascript:scroll(0,0);">Wróć na górę strony</a>
            <br>

        </div>
        <?php
          include_once 'core/menu.php';
         ?>
        </div>

    </div>
</body>

</html>
