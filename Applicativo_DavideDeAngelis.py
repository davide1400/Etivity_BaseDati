# import os
import time
import mysql.connector
import sqlalchemy

from sqlalchemy import Table, Column, Integer, String, MetaData, insert, ForeignKeyConstraint, ForeignKey

DBEngine = 'mysql+mysqlconnector://root:schicK14..@127.0.0.1/universita'
engine = sqlalchemy.create_engine(DBEngine, echo = False)
conn = mysql.connector.connect(host="127.0.0.1", user="root",passwd="schicK14..", database = "universita")



################# RIMUOVERE FOREIGN KEY corso_idFacolta ##############################

cursor = conn.cursor(buffered = True)

nomeFK = 'corso_idFacolta'

removeFK = '''
ALTER TABLE corso
DROP FOREIGN KEY corso_idFacolta
'''

cursor.execute(removeFK)

print(f'Foreign Key {nomeFK} eliminata con successo')

time.sleep(3)

print('\v')


################# DROP TABELLA FACOLTA ##############################

meta = MetaData()

facolta = Table( 'facolta', meta, Column ('idfacolta', Integer, primary_key = True, autoincrement = True), Column ('Nome', String(100)), Column('Sede', String(255)), )

meta.drop_all(engine, checkfirst=True)

print('Tabella "facolta" eliminata.')

time.sleep(3)

print('\v')

################# CREATE TABELLA FACOLTA ##############################

meta.create_all(engine)
print('Tabella facolta creata!')
time.sleep(3)
print('\v')

################# INSERT SU TABELLA FACOLTA ##############################


conninsert = engine.connect()

conninsert.execute(facolta.insert(), [
        {'Nome': 'Medicina', 'Sede': 'Via del Corso 123'},
        {'Nome': 'Ingegneria', 'Sede': 'Via Nazionale 45'},
        {'Nome': 'Giurisprudenza', 'Sede': 'Viale Trastevere 78'},
        {'Nome': 'Economia', 'Sede': 'Via Vittorio Veneto 12'},
        {'Nome': 'Architettura', 'Sede': 'Via dei Fori Imperiali 9'},
        {'Nome': 'Psicologia', 'Sede': 'Via Giulia 32'},
        {'Nome': 'Lettere', 'Sede': 'Via Appia Nuova 101'},
        {'Nome': 'Scienze Politiche', 'Sede': 'Via Ostiense 56'},
        {'Nome': 'Informatica', 'Sede': 'Via Tuscolana 204'},
        {'Nome': 'Matematica', 'Sede': 'Via Cola di Rienzo 88'},
        {'Nome': 'Fisica', 'Sede': 'Via della Conciliazione 7'},
        {'Nome': 'Chimica', 'Sede': 'Via Cavour 19'},
        {'Nome': 'Biologia', 'Sede': 'Via del Babuino 3'},
        {'Nome': 'Storia', 'Sede': 'Via Margutta 15'},
        {'Nome': 'Filosofia', 'Sede': 'Via del Tritone 65'}
    ])

conninsert.commit()


print('Inseriti dati in tabella "facolta".')

time.sleep(3)

print('\v')

########### SELECT FACOLTA ###########

connSelect = engine.connect()

selezione = facolta.select()

selezionex = "facolta.select()"

risultatoSelect = connSelect.execute(selezione)

riga = risultatoSelect.fetchall()

rigaex = "risultatoSelect.fetchall()"

print(riga)

print('\v')

time.sleep(1)

print(f'Risultato della query {selezionex} utilizzando {rigaex}')

time.sleep(3)

print('\v')

connSelect.commit()

################# AGGIUNGERE FOREIGN KEY corso_idFacolta ##############################

cursor = conn.cursor(buffered = True)

nomeFK = 'corso_idFacolta'

addFK = '''
ALTER TABLE corso
ADD CONSTRAINT corso_idFacolta
FOREIGN KEY (idFacolta) REFERENCES facolta(idfacolta);
'''

cursor.execute(addFK)

conn.commit()

print(f'Foreign Key {nomeFK} aggiunta con successo')

time.sleep(3)

print('\v')


########### DELETE RECORD 15 ###########

conn2 = engine.connect()

eliminaRecordFacolta = facolta.delete().where(facolta.c.idfacolta == 15)

conn2.execute(eliminaRecordFacolta)
conn2.commit()

print('Record eliminati' )

time.sleep(3)

print('\v')

########### INSERT RECORD 15 ###########

 
conn3 = engine.connect()

insertRecordFacolta = facolta.insert().values(idfacolta = '15', Nome = 'Filosofia')

conn3.execute(insertRecordFacolta)
conn3.commit()

print('Record inseriti' )

time.sleep(3)

print('\v')

########### UPDATE FACOLTA RECORD 15 ###########

conn4 = engine.connect()

updateRecordFacolta = facolta.update().values({facolta.c.Sede:'Via del Tritone 75'}).\
where(facolta.c.idfacolta == 15)


conn4.execute(updateRecordFacolta)
conn4.commit()

print('Record aggiornati correttamente' )

print('\v')






#cursor.close()


input('Premi qualsiasi tasto per uscire')

