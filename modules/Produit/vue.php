<h1>Liste des produits</h1>

<!--<a href="?module=Produit&action=ajout">Ajouter un nouveau produit</a>-->
<table border=1>
	<tr>
		<th>Id</th>
		<th>Nom</th>
		<th>Date de peremption</th>
		<th>Prix de base</th>
		<th>Stock</th>
		<th>Catégorie</th>
		<th>Barème promo</th>
		<th>Rayon d'appartenance</th>
		<th colspan="3">Actions</th>
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
				echo"<td><a href='?module=Produit&action=ajout'><img src='template/addfile.png'/></a></td>";
				echo"<td><a href='?module=Produit&action=editer&id={$t->id}'><img src='template/edit.png'/></a></td>";
				echo"<td><a href='?module=Produit&action=supprimer&id={$t->id}'><img src='template/delete.png'/></a></td>";
			echo"</tr>";
		}
	?>
</table>
