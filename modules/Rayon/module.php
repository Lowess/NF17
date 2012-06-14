<?php

Header::set_title("Module: Rayon");

include(CLASSES."Rayon.class.php");

switch ( Form::get('action') ){	
	case 'valide':
		ajouter();break;
	case 'editer':
		editer();break;
	case 'supprimer':
		supprimer();break;
	default:
		afficher();break;
}



function afficher(){
	$tab=Rayon::Lister();
	
	include('vue.php');
}


function ajouter(){
	Site::debug("ajout");
}

function editer(){

}

function supprimer(){
	
}


?>

<?php 
function dom_to_array($root) 
{ 
    $result = array(); 

    if ($root->hasAttributes()) 
    { 
        $attrs = $root->attributes; 

        foreach ($attrs as $i => $attr) 
            $result[$attr->name] = $attr->value; 
    } 

    $children = $root->childNodes; 

    if ($children->length == 1) 
    { 
        $child = $children->item(0); 

        if ($child->nodeType == XML_TEXT_NODE) 
        { 
            $result['_value'] = $child->nodeValue; 

            if (count($result) == 1) 
                return $result['_value']; 
            else 
                return $result; 
        } 
    } 

    $group = array(); 

    for($i = 0; $i < $children->length; $i++) 
    { 
        $child = $children->item($i); 

        if (!isset($result[$child->nodeName])) 
            $result[$child->nodeName] = dom_to_array($child); 
        else 
        { 
            if (!isset($group[$child->nodeName])) 
            { 
                $tmp = $result[$child->nodeName]; 
                $result[$child->nodeName] = array($tmp); 
                $group[$child->nodeName] = 1; 
            } 

            $result[$child->nodeName][] = dom_to_array($child); 
        } 
    } 

    return $result; 
} 
?>
