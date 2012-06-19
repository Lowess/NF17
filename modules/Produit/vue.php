<?php 	include('recherche.php'); ?>
<fieldset class="clear">
	<legend>Liste des produits</legend>

	<!--<a href="?module=Produit&action=ajout">Ajouter un nouveau produit</a>-->
	<?php
		if(!empty($tab)){
	?>
	<table border=1 id="table">
		<tr>
			<th>
				<a href='?module=Produit&action=trie&champ=id&type=DESC#table'><img src='template/rsorta.png' /></a> 
					Id 
				<a href='?module=Produit&action=trie&champ=id&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=Produit&action=trie&champ=nom&type=DESC#table'><img src='template/rsorta.png' /></a> 
					Nom 
				<a href='?module=Produit&action=trie&champ=nom&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=Produit&action=trie&champ=datePeremption&type=DESC#table'><img src='template/rsorta.png' /></a> 
					Date de Peremption 
				<a href='?module=Produit&action=trie&champ=datePeremption&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=Produit&action=trie&champ=prixDeBase&type=DESC#table'><img src='template/rsorta.png' /></a> 
					Prix de base 
				<a href='?module=Produit&action=trie&champ=prixDeBase&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=Produit&action=trie&champ=stock&type=DESC#table'><img src='template/rsorta.png' /></a> 
					Stock 
				<a href='?module=Produit&action=trie&champ=stock&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=Produit&action=trie&champ=categorie&type=DESC#table'><img src='template/rsorta.png' /></a> 
					Categorie 
				<a href='?module=Produit&action=trie&champ=categorie&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=Produit&action=trie&champ=baremePromo&type=DESC#table'><img src='template/rsorta.png' /></a> 
					Barème promo 
				<a href='?module=Produit&action=trie&champ=baremePromo&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=Produit&action=trie&champ=idRayon&type=DESC#table'><img src='template/rsorta.png' /></a> 
					Rayon d'appartenance 
				<a href='?module=Produit&action=trie&champ=idRayon&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
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
					echo"<td><a href='?module=Produit&action=ajout'><img src='template/addfile.png' title='Ajouter un Produit'/></a></td>";
					echo"<td><a href='?module=Produit&action=editer&id={$t->id}'><img src='template/edit.png' title='Editer ce Produit'/></a></td>";
					echo"<td><a href='?module=Produit&action=supprimer&id={$t->id}'><img src='template/delete.png' title='Supprimer ce Produit'/></a></td>";
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
