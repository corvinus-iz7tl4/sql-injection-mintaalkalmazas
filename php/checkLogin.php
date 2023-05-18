<?php
if (isset($_POST["submit"])) {
    require_once("connect.php");
    $email = $_POST["email"];
    $password = $_POST["password"];

    mysqli_set_charset($kapcsolat, "utf-8");

    $query = "SELECT * FROM paciens WHERE email='$email' AND jelszo='$password'";
    $result = mysqli_query($kapcsolat, $query);

    $getName = "SELECT * FROM paciens WHERE email='$email' AND jelszo='$password' LIMIT 1";
    $getNameResult = mysqli_query($kapcsolat, $getName);
    $paciens = mysqli_fetch_assoc($getNameResult);

    /*  print ($query);
    print "<pre>";
    print_r($result);
    print "</pre>"; */

    if (mysqli_num_rows($result) >= 1) {
        session_start();
        $_SESSION['paciens_nev'] = $paciens["nev"];
        $_SESSION['paciens_szul_ido'] = $paciens["szul_ido"];
        $_SESSION['paciens_szemelyi'] = $paciens["szemelyi"];
        $_SESSION['paciens_tajSzam'] = $paciens["tajSzam"];

        $orvosID = $paciens['orvosID'];
        $queryOrvos = "SELECT * FROM orvos WHERE id=orvosID";
        $resultOrvos = mysqli_query($kapcsolat, $queryOrvos);
        $orvos = mysqli_fetch_assoc($resultOrvos);

        if (mysqli_num_rows($resultOrvos) > 0) {
            $_SESSION['orvos_nev'] = $orvos["nev"];
            $_SESSION['orvos_szak'] = $orvos["szakkepzes"];
            $_SESSION['orvos_pecset'] = $orvos["pecsetszam"];
            $_SESSION['orvos_telefon'] = $orvos["telefonszam"];
        } else {
            $_SESSION['orvos_nev'] = 'nincs adat';
            $_SESSION['orvos_szak'] = 'nincs adat';
            $_SESSION['orvos_pecset'] = 'nincs adat';
            $_SESSION['orvos_telefon'] = 'nincs adat';
        }

        $gyogyszerID = $paciens['gyogyszerID'];
        $queryGyogyszer = "SELECT * FROM gyogyszer WHERE id=gyogyszerID";
        $resultGyogyszer = mysqli_query($kapcsolat, $queryGyogyszer);
        $gyogyszer = mysqli_fetch_assoc($resultGyogyszer);

        if (mysqli_num_rows($resultGyogyszer) > 0) {
            $_SESSION['gyogyszer_nev'] = $gyogyszer["nev"];
            $_SESSION['gyogyszer_adagolas'] = $gyogyszer["adagolas"];
            $_SESSION['gyogyszer_venas'] = $gyogyszer["venykotelezett-e"];
            $_SESSION['gyogyszer_betegseg'] = $gyogyszer["betegseg"];
        } else {
            $_SESSION['gyogyszer_nev'] = 'nincs adat';
            $_SESSION['gyogyszer_adagolas'] = 'nincs adat';
            $_SESSION['gyogyszer_venas'] = 'nincs adat';
            $_SESSION['gyogyszer_betegseg'] = 'nincs adat';
        }

        $vizsgalatID = $paciens['vizsgalatID'];
        $queryVizsgalat = "SELECT * FROM vizsgalatok WHERE id=vizsgalatID";
        $resultVizsgalat = mysqli_query($kapcsolat, $queryVizsgalat);
        $vizsgalatok = mysqli_fetch_assoc($resultVizsgalat);

        if (mysqli_num_rows($resultVizsgalat) > 0) {
            $_SESSION['vizsgalat_nev'] = $vizsgalatok["nev"];
            $_SESSION['vizsgalat_datum'] = $vizsgalatok["datum"];
            $_SESSION['vizsgalat_eredmeny'] = $vizsgalatok["eredmeny"];
        } else {
            $_SESSION['vizsgalat_nev'] = 'nincs adat';
            $_SESSION['vizsgalat_datum'] = 'nincs adat';
            $_SESSION['vizsgalat_eredmeny'] = 'nincs adat';
        }

        $_SESSION['loggedin'] = true;
        header('Location: dashboard.php');
        exit;
    } else {
        header('Location: login.php?nomatch=true');
        exit;
    }
} else {
    header('Location: login.php');
    exit;
}

mysqli_close($kapcsolat);
