<br /><a href='?module=Commande#table'><img src='template/retour.png' /> Retour à la liste des commandes</a> 
	
<fieldset class="clear">
	<legend>Information sur les livreurs en charge de la tournée n°<?php echo $idTournee; ?> </legend>

	<?php
		if(!empty($tab)){
	?>
	<table border=1 id="table">
		<tr>
			<th colspan='2'>Nom des livreurs</th>
			<th>Nombre de livraison effectué</th>
			<!--<th colspan="3">Actions</th>-->
		</tr>
		<?php
			foreach($tab as $t){
				echo"<tr>";
					echo"<td><img src='template/livreur.png'/> </td>";
					echo"<td>$t->idLivreur</td>";
					echo"<td>$t->nbTourneeEffectue</td>";
				echo"</tr>";
			}
		}
		else{
			echo"Aucun produit trouvé<br /><br />";
			echo"<a href='?module=Produit&action=ajout'><img src='template/addfile.png'/> Ajouter un nouveau produit </a>";
		}
				
		?>
	</table>
</fieldset>

