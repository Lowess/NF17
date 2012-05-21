<h1>Liste des rayons</h1>

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
