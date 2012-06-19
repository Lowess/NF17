<fieldset class="clear">
	<legend>Votre Panier</legend>

	<?php
		if(!empty($tab)){
	?>
	<table border=1 id="table">
		<tr>
			<th>Nom</th>
			<th>Date de Peremption</th>
			<th>Prix de base</th>
			<th>Categorie</th>
			<th>Barème promo</th>
			<th>Rayon d'appartenance</th>
			<th>Quantité</th>
			
			<th colspan="3">Actions</th>
		</tr>
		<?php
			foreach($tab as $t){
				echo"<tr>";
					echo"<td>$t->nom</td>";
					echo"<td>$t->datePeremption</td>";
					echo"<td>$t->prixDeBase</td>";
					echo"<td>$t->categorie</td>";
					echo"<td>$t->baremePromo</td>";
					echo"<td>$t->idRayon</td>";
					echo"<td>$t->stock</td>";
					
					echo"<td><a href='?module=Panier&action=inc&id={$t->id}'><img src='template/addfile.png' title='Ajouter un Produit'/></a></td>";
					echo"<td><a href='?module=Panier&action=dec&id={$t->id}'><img src='template/moins.png' title='Ajouter un Produit'/></a></td>";
					echo"<td><a href='?module=Panier&action=supprimer&id={$t->id}'><img src='template/delete.png' title='Supprimer ce Produit'/></a></td>";
				echo"</tr>";
			}
		}
		else{
			echo"Aucun produit trouvé<br /><br />";
			echo"<a href='index.php'><img src='template/retour.png'/> Retour au magazin </a>";
		}
				
		?>
	</table>
	<a href='?module=Panier&action=valide'>Valider votre commande <img src='template/next.png' title='Valider votre commande'/></a>

</fieldset>

