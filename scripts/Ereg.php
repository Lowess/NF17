<?php
$ereg_text='#^([a-zA-Z(äâëêéèïîöôüû\-)?]?)+$#';
$ereg_pseudo='#^([a-zA-Z0-9(äâëêéèïîöôüû\-)?]?)+$#';
$ereg_longtext='#^[a-zA-Z0-9(äâëêéèïîöôüû\!\?\.\-\_\')?]($)?+(\s)?([a-zA-Z0-9(äâëêéèïîöôüû\!\?\.\-\_\')?(\s)?])?([a-zA-Z0-9(äâëêéèïîöôüû\!\?\.\-\_\')?]$)?#';
$ereg_sexe='#([M]|[F])#';
$ereg_naiss='#^[0-9]{4}(/|-)[0-9]{2}(/|-)[0-9]{2}$#';
$ereg_mdp='#.#';
$ereg_mail='#^[a-z0-9.-_]+@[a-z0-9(.\-_)?]{2,}\.[a-z]{2,6}$#';
$ereg_licence='#^[0-9]{8}$#';
$ereg_id='#^[0-9]+$#';
$ereg_contrat='#^[0-9]{1}+[a-c]{1}+(\-)+[0-9]{1}+[a-c]{1}+(\-)+[0-9]{1}+[a-c]{1}$#';
$ereg_url='#^(http://)|(www\.)+[a-zA-Z/\.-_&\?]{1,}$#';
$ereg_yt='#^(http://)|(www\.)+youtube[a-zA-Z/\.-_&\?]{1,}$#';
$ereg_pat='#^Pat le lego \#[0-9]{1,3}$#';
$ereg_escalademag='#^Escalade Mag \#[0-9]{1,3}$#';
$ereg_patBD='#^La vie au bout des paluches \#[0-9]{1,3}$#';
$ereg_kesqela='#^Kesqela ma degaine \#[0-9]{1,3}#';
?>
