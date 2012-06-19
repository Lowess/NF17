<fieldset>
	<legend>Formulaire de modification du bareme Promo</legend>
	
	<form enctype="multipart/form-data" action='?module=PointFidelite&action=valide' method='post' class='form_ajout'>
		
	    	<input type='hidden' id='id' name='id' value="<?php if(isset($p)) echo $p->id; ?>">

	    	<!-- <label>nom du produit</label> -->
	    	<input type='hidden' id='nom' name='nom' value="<?php if(isset($p)) echo $p->nom; ?>">

			<!-- <label>date de péremption (jj/mm/aaaa)</label> -->
			<input type='hidden' id='dateperemption' name='dateperemption' value="<?php if(isset($p)) echo $p->dateperemption; ?>">

			<!-- <label>prix de base</label> -->
			<input type='hidden' id='prixdebase' name='prixdebase' value="<?php if(isset($p)) echo $p->prixdebase; ?>">

			<!-- <label>stock</label> -->
			<input type='hidden' id='stock' name='stock' value="<?php if(isset($p)) echo $p->stock; ?>">

			<!-- <label>categorie</label> -->
			
			<label>point Fidelite</label>
			<input type='text' id='pointfidelite' name='pointfidelite' value="<?php echo Form::get('pointfidelite') ?>">
			<input type='hidden' id='baremepromo' name='baremepromo' value="<?php echo Form::get('baremepromo') ?>">
			
			<div class="endform">
				<a href="?module=PointFidelite" style="text-decoration:none"><input type='reset' value='Annuler' class='valider'></a>
				<input class='valider' type='submit' value='Valider'>
			</div>
	</form>
</fieldset>

