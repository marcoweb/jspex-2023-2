<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ taglib uri="jakarta.tags.core" prefix="jc" %>
<%
    String tarefa = "";
    if(request.getParameter("tarefa") != null) {
        tarefa = request.getParameter("tarefa");
    }
    if(session.getAttribute("tarefas") == null){
        session.setAttribute("tarefas", tarefa);
    } else {
        String tarefas = session.getAttribute("tarefas").toString();
        tarefas += (tarefas != "") ? (";" + tarefa) : tarefa;
        session.setAttribute("tarefas", tarefas);
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Aplicação</title>
    </head>
    <body>
        <form action="index.jsp" method="post">
            <input type="text" name="tarefa" />
            <button type="submit">Salvar</button>
        </form>
        <jc:choose>
            <jc:when test="${empty tarefas}">
                <em>Sem Tarefas</em>
            </jc:when>
            <jc:otherwise>
                <ul>
                <jc:forTokens items="${tarefas}" delims=";" var="item">
                    <li>${item}</li>
                </jc:forTokens>
                </ul>
            </jc:otherwise>
        </jc:choose>
    </body>
</html>