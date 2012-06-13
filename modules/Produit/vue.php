<h1>Liste des produits</h1>

<a href="?module=Produit&action=ajout">Ajouter un nouveau produit</a>
<table border=1>
	<tr>
		<th>Id</th>
		<th>Nom</th>
		<th>Date de peremption</th>
		<th>Prix de base</th>
		<th>Stock</th>
		<th>Catégorie</th>
		<th>Barème promo</th>
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
			echo"</tr>";
		}
	?>
</table>
