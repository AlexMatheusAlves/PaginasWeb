<jsp:include page="head.jsp" />  
<% String pag = "agendamentos";%>
<div class="mt-4">
    <p>Deseja agendar uma consulta? Entre em contato via (xx)xxxx-xxxx ou preencha seus dados clicando no botão "Solicitar contato" para que possamos saber de seu interesse.</p>
</div> 
<a type="button" class="btn-info btn-sm ml-3" href="<%= pag%>.jsp?funcao=agendar" id="modalDados ">Solicitar contato</a>



<!-- Modal -->

<div class="modal" tabindex="-1" id="modalDados">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Dados para solicitar agendamento</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>
            </div>
            <form method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">E-mail</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="seuemail@example.com">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Nome</label>
                        <input type="text" class="form-control" id="nome" name="nome" placeholder="Digite seu Nome">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Exame</label>
                        <input type="text" class="form-control" id="exame" name="exame" placeholder="Digite o tipo de consulta">
                    </div>
                    <div class="mb-2">
                        <label for="exampleFormControlInput1" class="form-label">Telefone</label>
                        <input type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" maxlength="14" class="form-control" id="telefone" name="telefone" placeholder="(xx)xxxxx-xxxx">
                    </div>
                    <div align="center" id="mensagem">

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-fechar" data-bs-dismiss="modal" name="fechar" id="btn-fechar">Fechar</button>
                    <button type="button" class="btn btn-primary btn-salvar" name="salvar" id="btn-salvar">Salvar e Enviar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="finish.jsp" /> 
<%  if (request.getParameter(
            "funcao") != null && request.getParameter("funcao").equals("agendar")) {
        out.print("<script>$('#modalDados').modal('show');</script>");
    }
%>

<!--Ajax para inserir dados-->
<script text="text/javascript">
    $(document).ready(function () {
        var pag = "<%= pag%>";
        $('#btn-salvar').click(function (event) {
            event.preventDefault();
            $.ajax({
                url: pag + "/inserir.jsp",
                method: "post",
                data: $('form').serialize(),
                dataType: "text",
                success: function(mensagem) {
                    $('#mensagem').removeClass()

                    if (mensagem == "Envio realizado, aguarde contato.") {
                        $('#mensagem').addClass('text-success')
                        $('#nome').val('')
                        $('#btn-fechar').click();
                    } else {
                        $('#mensagem').addClass('text-danger')
                    }
                    $('#mensagem').text(mensagem)
                },
            })
        })
    })

</script>


