<?php 	include('recherche.php'); ?>
<fieldset class="clear">
	<legend>Liste des produits</legend>

	<!--<a href="?module=PointFidelite&action=ajout">Ajouter un nouveau produit</a>-->
	<?php
		if(!empty($tab)){
	?>
	<table border=1>
		<tr>
			<th>
				<a href='?module=PointFidelite&action=trie&champ=id&type=DESC'><img src='template/rsorta.png' /></a> 
					Id 
				<a href='?module=PointFidelite&action=trie&champ=id&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=PointFidelite&action=trie&champ=nom&type=DESC'><img src='template/rsorta.png' /></a> 
					Nom 
				<a href='?module=PointFidelite&action=trie&champ=nom&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=PointFidelite&action=trie&champ=dateperemption&type=DESC'><img src='template/rsorta.png' /></a> 
					Date de Peremption 
				<a href='?module=PointFidelite&action=trie&champ=dateperemption&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=PointFidelite&action=trie&champ=prixdebase&type=DESC'><img src='template/rsorta.png' /></a> 
					Prix de base 
				<a href='?module=PointFidelite&action=trie&champ=prixdebase&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=PointFidelite&action=trie&champ=prixmoyen&type=DESC'><img src='template/rsorta.png' /></a> 
					Prix Moyen 
				<a href='?module=PointFidelite&action=trie&champ=prixmoyen&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=PointFidelite&action=trie&champ=stock&type=DESC'><img src='template/rsorta.png' /></a> 
					Stock 
				<a href='?module=PointFidelite&action=trie&champ=stock&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=PointFidelite&action=trie&champ=qtevendue&type=DESC'><img src='template/rsorta.png' /></a> 
					Quantite Vendue
				<a href='?module=PointFidelite&action=trie&champ=qtevendue&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=PointFidelite&action=trie&champ=categorie&type=DESC'><img src='template/rsorta.png' /></a> 
					Categorie 
				<a href='?module=PointFidelite&action=trie&champ=categorie&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=PointFidelite&action=trie&champ=baremepromo&type=DESC'><img src='template/rsorta.png' /></a> 
					Barème promo 
				<a href='?module=PointFidelite&action=trie&champ=baremepromo&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=PointFidelite&action=trie&champ=pointfidelite&type=DESC'><img src='template/rsorta.png' /></a> 
					Point Fidelité
				<a href='?module=PointFidelite&action=trie&champ=pointfidelite&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=PointFidelite&action=trie&champ=idrayon&type=DESC'><img src='template/rsorta.png' /></a> 
					Rayon d'appartenance 
				<a href='?module=PointFidelite&action=trie&champ=idrayon&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th colspan="3">Actions</th>
		</tr>
		<?php
			foreach($tab as $t){
				echo"<tr>";
					echo"<td>$t->id</td>";
					echo"<td>$t->nom</td>";
					echo"<td>$t->dateperemption</td>";
					echo"<td>$t->prixdebase</td>";
					echo"<td>$t->prixmoyen</td>";
					echo"<td>$t->stock</td>";
					echo"<td>$t->qtevendue</td>";
					echo"<td>$t->categorie</td>";
					echo"<td>$t->baremepromo</td>";
					echo"<td>$t->pointfidelite</td>";
					echo"<td>$t->idrayon</td>";
					echo"<td><a href='?module=PointFidelite&action=editer&id={$t->id}'><img src='template/edit.png'/></a></td>";
				echo"</tr>";
			}
		}
		else{
			echo"Aucun produit trouvé<br /><br />";
			echo"<a href='?module=PointFidelite&action=ajout'><img src='template/addfile.png'/> Ajouter un nouveau produit </a>";
		}
				
		?>
	</table>
</fieldset>
