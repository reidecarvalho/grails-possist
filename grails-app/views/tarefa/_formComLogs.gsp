<%@ page import="br.edu.unirn.tipos.StatusTarefa" %>
<div class="form-group">
    <label for="titulo" class="col-sm-2 control-label">Titulo</label>
    <div class="col-sm-10">
        <g:textField name="titulo" class="form-control" v-model="tarefa.titulo" :disabled="true"/>
    </div>
</div>
<div class="form-group">
    <label for="texto" class="col-sm-2 control-label">Texto</label>
    <div class="col-sm-10">
        <g:textArea name="texto" class="form-control" v-model="tarefa.texto" :disabled="true"/>
    </div>
</div>
<div class="form-group">
    <label for="usuarioAbertura" class="col-sm-2 control-label">Usuario Abertura</label>
    <div class="col-sm-10">
        <g:select name="usuarioAbertura" class="form-control" v-model="tarefa.usuarioAbertura" noSelection="['':'-- Selecione --']"
                  from="${br.edu.unirn.Usuario.list()}" optionValue="email" optionKey="id" :disabled="true"/>
    </div>
</div>
<div class="form-group">
    <label for="usuarioResponsavel" class="col-sm-2 control-label">Usuario Responsavel</label>
    <div class="col-sm-10">
        <g:select name="usuarioResponsavel" class="form-control" v-model="tarefa.usuarioResponsavel" noSelection="['':'-- Selecione --']"
                  from="${br.edu.unirn.Usuario.list()}" optionValue="email" optionKey="id" :disabled="true"/>
    </div>
</div>
<div class="form-group">
    <label for="dataLimite" class="col-sm-2 control-label">Data Limite</label>
    <div class="col-sm-10">
        <g:textField name="dataLimite" class="form-control" placeholder="__/__/__" v-model="tarefa.dataLimite" :disabled="true"/>
    </div>
</div>
<div class="form-group">
    <label for="tipoTarefa" class="col-sm-2 control-label">Tipo Tarefa</label>
    <div class="col-sm-10">
        <g:select name="tipoTarefa" class="form-control" v-model="tarefa.tipoTarefa" noSelection="['':'-- Selecione --']"
                  from="${br.edu.unirn.TipoTarefa.list()}" optionValue="descricao" optionKey="id" :disabled="true"/>
    </div>
</div>
<div class="form-group">
    <label for="statusTarefa" class="col-sm-2 control-label">Status Tarefa</label>
    <div class="col-sm-10">
        <g:select name="statusTarefa" class="form-control" v-model="tarefa.statusTarefa" noSelection="['':'-- Selecione --']"
                  from="${br.edu.unirn.tipos.StatusTarefa.values()}" optionValue="descricao" keys="${br.edu.unirn.tipos.StatusTarefa?.values()*.name()}"
                  :disabled="true"/>
    </div>
</div>
<div class="form-group">
    <label for="porcentagem" class="col-sm-2 control-label">Porcentagem</label>
    <div class="col-sm-10">
        <g:field type="number" name="porcentagem" class="form-control" v-model="tarefa.porcentagem" :disabled="true"/>
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-heading">Logs da Tarefa</div>
    <div class="panel-body">
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Data</th>
                            <th>Usuario Log</th>
                            <th>Texto</th>
                            <th>Status</th>
                            <th>%</th>
                        </tr>
                    </thead>
                    <tbody>
                    <tr v-if="loading">
                        <td colspan="7">Carregando....</td>
                    </tr>
                    <tr v-for="logTarefa in tarefa.logTarefas" :key="logTarefa.id">
                        <td>{{logTarefa.dateCreated}}</td>
                        <td>{{logTarefa.usuarioLog}}</td>
                        <td>{{logTarefa.texto}}</td>
                        <td>{{logTarefa.statusTarefa}}</td>
                        <td>{{logTarefa.porcentagem}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>