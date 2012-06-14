<fieldset>
	<legend>Critères de recherche</legend>
		<form action='?module=Produit&action=recherche' id="recherche" method='post' class='form_recherche'>
		<p>
			<label>Nom</label>
			<input name='nom' type='text'>
		</p>
		
		<!-- Selection de l'année -->
		<p>
			<label>Date de peremption</label>
			<select name='rech_publication'>		
				<?php
				echo"<option value='' selected='selected'>----</option>";
				$mois_translate=array(1=>"Janvier",2=>"Fevrier",3=>"Mars",4=>"Avril",5=>"Mai",6=>"Juin",7=>"Juillet",8=>"Août",9=>"Septembre",10=>"Octobre",11=>"Novembre",12=>"Decembre");
				
				foreach($TabPublication as $t=>$a)
				{
					$mois=$a[mois];
					echo"<option value='$a[mois]:$a[anne]'>$mois_translate[$mois] $a[anne]</option>";
				}
				?>
			</select>
		</p>    
		<p class="endform">
			<input type="hidden" value=1 name="rech_etat">
			<input type="reset" value="Réinitialiser" class="btn">
			<input type="submit" value="Rechercher" class="btn">
		</p>
		</form>
</fieldset>

