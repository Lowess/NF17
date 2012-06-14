<fieldset>
	<legend>Liste des rayons</legend>

	<table border=1>
		<tr>
			<th>Themes</th>
		</tr>
		<?php
			foreach($tab as $t){
				echo"<tr><td>$t->theme</td></tr>";
			}
		?>
	</table>
</fieldset>

<fieldset style='clear:left'>
	<legend>Liste des produits par rayon</legend>

	<?php
		foreach($tab2 as $rayon => $r){
			echo "<fieldset style='clear:left'>";
			echo"<legend>Rayon: $rayon</legend>";
				if(!empty($r)){
					echo"<table border=1>";
						echo"<tr>
							<th>Id</th>
							<th>Nom</th>
							<th>Date de Peremption</th>
							<th>Prix de base</th>
							<th>Stock</th>
							<th>Categorie</th>
							<th>Barème promo</th>
						</tr>";
						foreach($r as $produit => $p){
							echo"<tr>";
									echo"<td>$p->id</td>";
									echo"<td>$p->nom</td>";
									echo"<td>$p->datePeremption</td>";
									echo"<td>$p->prixDeBase</td>";
									echo"<td>$p->stock</td>";
									echo"<td>$p->categorie</td>";
									echo"<td>$p->baremePromo</td>";
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
