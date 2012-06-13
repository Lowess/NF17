<fieldset>
	<legend>Formulaire d'ajout d'un produit</legend>
	
	<form enctype="multipart/form-data" action='?module=Produit&action=valide' method='post' class='form_ajout'>
		
	    	<label>nom du produit</label>
	    	<input type='text' id='nom' name='nom' value="<?php echo Form::get('nom') ?>">

			<label>date de péremption (jj/mm/aaaa)</label>
			<input type='text' id='datePeremption' name='datePeremption' value="<?php echo Form::get('datePeremption') ?>">

			<label>prix de base</label>
			<input type='text' id='prixDeBase' name='prixDeBase' value="<?php echo Form::get('prixDeBase') ?>">

			<label>stock</label>
			<input type='text' id='stock' name='stock' value="<?php echo Form::get('stock') ?>">

			<label>categorie</label>
			<select id='categorie' name='categorie'>
				<option value='1'>Produits laitiers et similaires</option>
				<option value='2'>Matières grasses et huiles</option>
				<option value='3'>Glaces de consommation</option>
				<option value='4'>Fruits et légumes</option>
				<option value='5'>Confiserie</option>
				<option value='6'>Céréales et produits à base de céréales</option>
				<option value='7'>Produits de boulangerie</option>
				<option value='8'>Viande et produits carnés, volaille et gibier inclus</option>
				<option value='9'>Poisson et produits de la pêche</option>
				<option value='10'>Oeufs et produits à base d'oeufs</option>
				<option value='11'>Édulcorants</option>
				<option value='12'>Sels, épices, potages, sauces, salades</option>
				<option value='13'>Aliments destinés à une alimentation particulière</option>
				<option value='14'>Boissons</option>
				<option value='15'>Autres</option>
			</select>
			
			<label>bareme promo</label>
			<input type='text' id='baremePromo' name='baremePromo' value="<?php echo Form::get('baremePromo') ?>">

			<div class="endform">
				<a href="?module=Produit" style="text-decoration:none"><input type='reset' value='Annuler' class='valider'></a>
				<input class='valider' type='submit' value='Valider'>
			</div>
	</form>
</fieldset>

