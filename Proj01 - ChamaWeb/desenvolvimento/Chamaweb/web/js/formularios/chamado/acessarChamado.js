$( () => {

    let obs = $('#divObs');
    let obsTxt = $('#observacoesAvaliacao');


    $('.btnAval').change(function()  {
        if($(this).val() != 'true') {
            obs.show();
            obsTxt.prop('required', true);
        } else {
            obs.hide();
            obsTxt.prop('required', false);
        }
    });

});