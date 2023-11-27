$(document).ready(function(){
    $('#bnt_auth').on('click', function () {
        let user = $("#email").val();
        let pass = $("#password").val();

        $.ajax({
            type: "POST",
            url: "login.php",
            dataType: "json",
            data: {
                user: user,
                pass: pass
            },
            success: function (response) {
                if (response.success) {
                    // Redireciona para a página desejada em caso de sucesso
                    window.location.href = "telaprincipal.php";
                }
            },
            error: function (xhr, textStatus, errorThrown) {
                // Exibe mensagens de erro no console em caso de falha na requisição
                alert(xhr.responseJSON.message);
            }
        });
    });

    $('#btn_cadastrarQuarto').on('click', function () {
        let id_quarto = $("#numero").val();
        let capacidade = $("#capacidade").val();
        let tipo_cama = $("#tipo_cama").val();
        let tipo_disponibilidade = $("#tipo_disponibilidade").val();
        let preco = $("#preco_quarto").val();

        if(tipo_disponibilidade == 'disponivel'){
            tipo_disponibilidade = 1;
        }else{
            tipo_disponibilidade = 0;
        }
        
        console.log(id_quarto);
        console.log(capacidade);
        console.log(tipo_cama);
        console.log(tipo_disponibilidade);
        console.log(preco);
        $.ajax({
            type: "POST",
            url: "adicionarquartos.php",
            dataType: "json",
            data: {
                id_quarto: id_quarto,
                capacidade: capacidade,
                tipo_cama: tipo_cama,
                tipo_disponibilidade: tipo_disponibilidade,
                preco: preco
            },
            success: function (response) {
                if (response.success) {
                    // Redireciona para a página desejada em caso de sucesso
                    window.location.href = "adicionarquartos.php";
                }
            },
            error: function (xhr, textStatus, errorThrown) {
                // Exibe mensagens de erro no console em caso de falha na requisição
                alert(xhr.responseText);
            }
        });
    });


    $('#btnExcluir').on('click', function () {
        alert($('#btnExcluir').attr("name"));
    });
    

});