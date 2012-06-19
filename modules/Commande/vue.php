<?php 	include('recherche.php'); ?>
<fieldset class="clear">
	<legend>Liste des commandes</legend>

	<!--<a href="?module=Commande&action=ajout">Ajouter un nouveau Commande</a>-->
	<?php
		if(!empty($tab)){
	?>
	<table border=1 id="table">
		<tr>
			<th>
				<a href='?module=Commande&action=trie&champ=idPanier&type=DESC#table'><img src='template/rsorta.png' /></a> 
					Id Panier    
				<a href='?module=Commande&action=trie&champ=idPanier&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=Commande&action=trie&champ=dateValidation&type=DESC#table'><img src='template/rsorta.png' /></a> 
					Date de validation 
				<a href='?module=Commande&action=trie&champ=dateValidation&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=Commande&action=trie&champ=etatCmd&type=DESC#table'><img src='template/rsorta.png' /></a> 
					Etat de la commande 
				<a href='?module=Commande&action=trie&champ=etatCmd&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=Commande&action=trie&champ=heureLivraison&type=DESC#table'><img src='template/rsorta.png' /></a> 
					Heure de livraison
				<a href='?module=Commande&action=trie&champ=heureLivraison&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=Commande&action=trie&champ=lieuLivraison&type=DESC#table'><img src='template/rsorta.png' /></a> 
					Lieu de livraison
				<a href='?module=Commande&action=trie&champ=lieuLivraison&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
			<th>
				<a href='?module=Commande&action=trie&champ=idTournee&type=DESC#table'><img src='template/rsorta.png' /></a> 
					N° Tournée
				<a href='?module=Commande&action=trie&champ=idTournee&type=ASC#table'><img src='template/sorta.png' /></a>
			</th>
			<th colspan="4">Actions</th>
		</tr>
		<?php
			foreach($tab as $t){
				echo"<tr>";
					echo"<td>$t->idPanier</td>";
					echo"<td>$t->dateValidation</td>";
					echo"<td>$t->etatCmd</td>";
					echo"<td>$t->heureLivraison</td>";
					echo"<td>$t->lieuLivraison</td>";
					echo"<td>$t->idTournee</td>";
					echo"<td><a href='?module=Commande&action=vueLivreurs&id={$t->idTournee}'><img src='template/information.png' title='Informations sur les livreurs de cette tournée'/></a></td>";
					echo"<td><a href='?module=Commande&action=vueProduits&id={$t->idPanier}'><img src='template/oeil.png' title='Visualiser les produits de cette commande'/></a></td>";
					//echo"<td><a href='?module=Commande&action=ajout'><img src='template/addfile.png' title='Ajouter une Commande'/></a></td>";
					echo"<td><a href='?module=Commande&action=editer&id={$t->idPanier}'><img src='template/edit.png' title='Editer cette Commande'/></a></td>";
					echo"<td><a href='?module=Commande&action=supprimer&id={$t->idPanier}'><img src='template/delete.png' title='Supprimer cette Commande'/></a></td>";
				echo"</tr>";
			}
		}
		else{
			echo"Aucun Commande trouvé<br /><br />";
		}
				
		?>
	</table>
</fieldset>
