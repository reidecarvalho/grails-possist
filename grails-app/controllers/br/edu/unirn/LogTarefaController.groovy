package br.edu.unirn

class LogTarefaController {

    static scaffold = LogTarefa

    def save(){
        params << request.JSON

        LogTarefa logTarefa = new LogTarefa()
        bindData(logTarefa, params)


        logTarefa.tarefa.statusTarefa = logTarefa.statusTarefa
        logTarefa.tarefa.porcentagem = logTarefa.porcentagem

        if(!logTarefa.save(flush: true)){
            logTarefa.errors.each {println it}
            render status: 500
            return
        }

        render status: 200
    }
}
