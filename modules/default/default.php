<!-- ICI J'UTILISE LE HTML!!! LE PHP N'EST UTILISÉ QUE POUR LES BOUCLES
L'INITIALISATION DE MES VARIABLES PHP SE FONT DANS LE MODULE! -->

<h1>Bienvenue sur la boutique</h1>

<fieldset>
	<legend>Liste des produits par rayon</legend>

	<?php
		foreach($tab2 as $rayon => $r){
			echo "<fieldset style='clear:left;'>";
			echo"<legend>Rayon: $rayon</legend>";
				if(!empty($r)){
					echo"<table border=1>";
						echo"<tr>
							<th>Id</th>
							<th>Nom</th>
							<th>Date de Peremption</th>
							<th>Prix de base</th>
							<th>Categorie</th>
							<th>Barème promo</th>
						</tr>";
						foreach($r as $produit => $p){
							echo"<tr>";
									echo"<td>$p->id</td>";
									echo"<td>$p->nom</td>";
									echo"<td>$p->datePeremption</td>";
									echo"<td>$p->prixDeBase</td>";
									echo"<td>$p->categorie</td>";
									echo"<td>$p->baremePromo</td>";
									echo"<td><a href='?module=default&action=ajout&id={$p->id}'><img src='template/panier.png' title='Ajouter au Panier'/></a></td>";
							echo"</tr>";
						}
					echo"</table>";
				}
				else
					echo "Aucun produit actuellement dans ce rayon";
			echo"</fieldset>";
			
		}
	?>
</fieldset>
