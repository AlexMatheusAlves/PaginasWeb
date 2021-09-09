<jsp:include page="head.jsp" />  
<% String pag = "agendamento"; %>
<div class="mt-4">
    <p>Deseja agendar uma consulta? Entre em contato via (xx)xxxx-xxxx ou preencha seus dados clicando no botão "Solicitar contato". Entraremos em contato com você!</p>
</div> 
<a type="button" class="btn-info btn-sm ml-3" href="<%= pag %>.jsp?funcao=agendar">Solicitar contato</a>


<!--Ajax para inserir dados-->

<!-- Modal -->

<div class="modal" tabindex="-1" id="modalDados">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Solicitação de Agendamento</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>
            </div>
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
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary">Salvar e Enviar</button>
            </div>
        </div>
    </div>
</div>



<jsp:include page="finish.jsp" /> 
<%  if (request.getParameter(
            "funcao") != null && request.getParameter("funcao").equals("agendar")) {
        out.print("<script>$('#modalDados').modal('show');</script>");
    }
%>