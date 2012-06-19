<br /><a href='?module=Commande#table'><img src='template/retour.png' /> Retour à la liste des commandes</a> 
	
<fieldset class="clear">
	<legend>Liste des produits du panier n°<?php echo $idPanier; ?> </legend>

	<?php
		if(!empty($tab)){
	?>
	<table border=1 id="table">
		<tr>
			<th>Id</th>
			<th>Nom</th>
			<th>Date de Peremption</th>
			<th>Prix de base</th>
			<th>Quantité</th>
			<th>Categorie</th>
			<th>Barème promo</th>
			<th>Rayon d'appartenance</th>
			<!--<th colspan="3">Actions</th>-->
		</tr>
		<?php
			foreach($tab as $t){
				echo"<tr>";
					echo"<td>$t->id</td>";
					echo"<td>$t->nom</td>";
					echo"<td>$t->datePeremption</td>";
					echo"<td>$t->prixDeBase</td>";
					echo"<td>$t->stock</td>";
					echo"<td>$t->categorie</td>";
					echo"<td>$t->baremePromo</td>";
					echo"<td>$t->idRayon</td>";
					/*
					echo"<td><a href='?module=Produit&action=ajout'><img src='template/addfile.png' title='Ajouter un Produit'/></a></td>";
					echo"<td><a href='?module=Produit&action=editer&id={$t->id}'><img src='template/edit.png' title='Editer ce Produit'/></a></td>";
					echo"<td><a href='?module=Produit&action=supprimer&id={$t->id}'><img src='template/delete.png' title='Supprimer ce Produit'/></a></td>";
					*/
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

