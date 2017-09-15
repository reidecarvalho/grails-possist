var tarefa = new Vue({
    el: '#tarefa',
    data: {
        tarefas: [],
        tarefa: {},
        loading: false,
        logTarefa: {}
    },
    methods: {
        getTarefas: function(){
            this.loading = true;
            this.$http.get(window.baseUrl+"tarefa/list/").then(function(resp){
                this.tarefas = resp.data;
                this.loading = false;
            }, function(err){
                this.loading = false;
            })
        },
        novaTarefa: function(){
            this.$http.get(window.baseUrl+"autenticacao/getCurrentUser/").then(function(resp){
                var usuario = resp.data;
                this.tarefa = {};
                this.tarefa.dataLimite = moment().add(1, 'days').format('DD/MM/YYYY');
                this.tarefa.porcentagem = 0;

                this.tarefa.usuarioAbertura = usuario;

                $("#formTarefa").modal('show');
                this.loading = false;
            }, function(err){
                this.loading = false;
            })
        },
        salvarTarefa: function(){
            this.$http.post(window.baseUrl+"tarefa/save", this.tarefa).then(function(resp){
                this.getTarefas();
                $("#formTarefa").modal('hide');
                this.tarefa = {};
            }, function(error){
                console.info(error)
            })
        },
        editTarefa: function(tarefa){
            this.$http.get(window.baseUrl+"tarefa/show/"+tarefa.id).then(function(resp){
                this.tarefa = resp.data;
                $("#formTarefa").modal('show');
            }, function(resp){
            })
        },
        updateTarefa: function(){
            this.$http.put(window.baseUrl+"tarefa/update/"+this.tarefa.id, this.tarefa).then(function(resp){
                this.getTarefas();
                $("#formTarefa").modal('hide');
                this.tarefa = {};
            }, function(resp){
            })
        },
        detalheTarefa: function(tarefa){
            this.$http.get(window.baseUrl+"tarefa/detail/"+tarefa.id).then(function(resp){
                this.tarefa = resp.data;
                $("#formTarefaComLogs").modal('show');
            }, function(resp){
            })
        },
        novoLogTarefa: function(){
            this.logTarefa = {};
            this.logTarefa.tarefa = {};
            this.logTarefa.tarefa.id = this.tarefa.id;
            console.log("00:09 >>");
            console.log(this.logTarefa);
            $("#formTarefaComLogs").modal('hide');
            $("#formNovoLogTarefa").modal('show');
        },
        salvarLogTarefa: function(){
            this.$http.post(window.baseUrl+"logTarefa/save", this.logTarefa).then(function(resp){
                $("#formNovoLogTarefa").modal('hide');
                this.detalheTarefa(this.tarefa);
                this.logTarefa = {};
            }, function(error){
                console.info(error)
            })
        }
    },
    ready: function(){
        this.getTarefas();
    }
});