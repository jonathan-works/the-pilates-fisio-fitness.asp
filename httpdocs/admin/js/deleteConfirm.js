// JavaScript Document

function confirmBox(link_delete) {
    $("#delete-confirm").html("Deseja realmente deletar esse registro e todos os horários relacionados a ele?");

    // Define the Dialog and its properties.
    $("#delete-confirm").dialog({
        resizable: false,
        modal: true,
        title: "Confirmar Exclusão",
        height: 250,
        width: 400,
        buttons: {
            "Sim": function () {
                $(this).dialog('close');
                callback(true, link_delete);
            },
                "Não": function () {
                $(this).dialog('close');
                callback(false, link_delete);
            }
        }
    });
}


function callback(value,link_delete) {
    if (value) {       
		window.location = link_delete;
    } else {
        
    }
}