package br.edu.unirn

import grails.converters.JSON

class AutenticacaoController {

    def index(){

    }

    def login() {
        Usuario usuario = Usuario.findByEmailAndSenha(params.email, "md5:"+params.senha?.encodeAsMD5())
        if(!usuario){
            flash.error = "Usuario nao encontrado!"
            render(view: "index")
            return
        }

        session.usuario = usuario
        redirect(controller: "index")
    }

    def logout(){
        session.invalidate()
        redirect(actionName:"index")
    }

    def getCurrentUser() {
        render ([
                id: session.usuario.id,
                email: session.usuario.email
        ] as JSON)
    }
}
