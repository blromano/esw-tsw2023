$( () => {
    let operacoes = [];

    $("#btnInserir").on("click", event => {
        let opTable = $("#opTable");
        let newOperacao = $("#newOperacao");
        const date = new Date();
        let day = date.getDate();
        let month = date.getMonth() + 1;
        let year = date.getFullYear();
        let currentDate = `${day}/${month}/${year}`;
        let currentDateSQL = `${year}-${month}-${day}`;


        opTable.append(
        `<tr>
        <td>${newOperacao.data("username")}</td>
        <td>${currentDate}</td>
        <td>${newOperacao.val()}</td>
        </tr>`);

        operacoes.push({
            usuario: newOperacao.data("username"),
            data: currentDateSQL,
            descricao: newOperacao.val()
        });

        $( "#hiddenOperacoes" ).val( JSON.stringify( operacoes ) );
        newOperacao.val("");
    });
});