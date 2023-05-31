#Chama o bundler com gem pg
require 'bundler/setup' 
Bundler.require(:default)
# config pra conectar com o caralho do banco
    db_config = {
    dbname: 'postgres',
    user: 'postgres',
    password: 'password',
    port: 5432,
    host: 'localhost'
    }
# Definindo o arquivo e o intervalo de tempo
    arquivo = 'backup.tar'
    intervalo = 10
# Loop que reptere a cada fodendo intervalo
    loop do
        begin
            # ainda não tenho certeza do que isso faz
            conn = PG.connect(db_config)
            # faz a conexão, mas nn defini local do arquivo ent ele faz na pasta mesmo 
            comando_de_backup = "pg_dump --dbname=postgresql://postgres:password@localhost:5432/postgres > #{arquivo}"
            system(comando_de_backup)
            # apenas uma log
            puts "#{db_config[:dbname]} criou"

        rescue PG::Error => e
            #literalmente uma log
            puts "log erro #{e.message}"
        end  
        # a mimir, segue o intervalo de tempo determinado
        sleep(intervalo)
    end

# O programa vai ser executado
# Fara um backup a cada 12 horas (supostamente)
# Perdi a folha do trabalho, não lembro como era pra documentar :)
# Imagina que faz isso todo dia o tempo todo no servidor pc do cliente
# ai ele faz um meio dia e outro meia noite (Não é pra ter ninguém usando o sistema)