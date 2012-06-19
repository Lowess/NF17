<fieldset>
	<legend>Formulaire d'ajout d'un rayon</legend>
	
	<form enctype="multipart/form-data" action='?module=Rayon&action=valide' method='post' class='form_ajout'>
		
	    	<input type='hidden' id='id' name='id' value="<?php if(isset($r)) echo $r->theme; ?>">

	    	<label>nom du rayon</label>
	    	<input type='text' id='theme' name='theme' value="<?php if(isset($r)) echo $r->theme; ?>">

			<div class="endform">
				<a href="?module=Produit" style="text-decoration:none"><input type='reset' value='Annuler' class='valider'></a>
				<input class='valider' type='submit' value='Valider'>
			</div>
	</form>
</fieldset>

