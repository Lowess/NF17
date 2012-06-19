<?php 	include('recherche.php'); ?>
<fieldset class="clear">
	<legend>Liste des clients</legend>

	<!--<a href="?module=StatistiqueClient&action=ajout">Ajouter un nouveau produit</a>-->
	<?php
		if(!empty($tab)){
	?>
	<table border=1>
		<tr>
			<th>
				<a href='?module=StatistiqueClient&action=trie&champ=login&type=DESC'><img src='template/rsorta.png' /></a> 
					Login 
				<a href='?module=StatistiqueClient&action=trie&champ=login&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=StatistiqueClient&action=trie&champ=nom&type=DESC'><img src='template/rsorta.png' /></a> 
					Nom 
				<a href='?module=StatistiqueClient&action=trie&champ=nom&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=StatistiqueClient&action=trie&champ=prenom&type=DESC'><img src='template/rsorta.png' /></a> 
					Prenom 
				<a href='?module=StatistiqueClient&action=trie&champ=prenom&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=StatistiqueClient&action=trie&champ=adresse&type=DESC'><img src='template/rsorta.png' /></a> 
					Adresse
				<a href='?module=StatistiqueClient&action=trie&champ=adresse&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=StatistiqueClient&action=trie&champ=age&type=DESC'><img src='template/rsorta.png' /></a> 
					Age 
				<a href='?module=StatistiqueClient&action=trie&champ=age&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=StatistiqueClient&action=trie&champ=pointfidelite&type=DESC'><img src='template/rsorta.png' /></a> 
					Point de Fidelite 
				<a href='?module=StatistiqueClient&action=trie&champ=pointfidelite&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=StatistiqueClient&action=trie&champ=nombredepanierachete&type=DESC'><img src='template/rsorta.png' /></a> 
					Nombre De Panier Acheté
				<a href='?module=StatistiqueClient&action=trie&champ=nombredepanierachete&type=ASC'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=StatistiqueClient&action=trie&champ=prixmoyenpanier&type=DESC'><img src='template/rsorta.png' /></a> 
					Prix du panier moyen.
				<a href='?module=StatistiqueClient&action=trie&champ=prixmoyenpanier&type=ASC'><img src='template/sorta.png' /></a>
			</th>
		</tr>
		<?php
			foreach($tab as $t){
				echo"<tr>";
					echo"<td>$t->login</td>";
					echo"<td>$t->nom</td>";
					echo"<td>$t->prenom</td>";
					echo"<td>$t->adresse</td>";
					echo"<td>$t->age</td>";
					echo"<td>$t->pointfidelite</td>";
					echo"<td>$t->nombredepanierachete</td>";
					echo"<td>$t->prixmoyenpanier</td>";
				echo"</tr>";
			}
		}
		else{
			echo"Aucun produit trouvé<br /><br />";
		}
				
		?>
	</table>
</fieldset>
