from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def inicio():
    return {
        "mensagem": "API BookingHub funcionando"
    }

@app.get("/voos/disponiveis")
def voos_disponiveis():
    return {
        "status": "Endpoint de voos disponíveis funcionando"
    }

@app.get("/hoteis/disponiveis")
def hoteis_disponiveis():
    return {
        "status": "Endpoint de hotéis disponíveis funcionando"
    }
@app.get("/voos/disponiveis")
def voos_disponiveis():

    return {
        "status":"Endpoint de voos disponíveis funcionando"
    }


@app.get("/hoteis/disponiveis")
def hoteis_disponiveis():

    return {
        "status":"Endpoint de hotéis disponíveis funcionando"
    }
@app.get("/clientes/{id}/reservas")
def reservas_cliente(id: int):

    return {
        "cliente_id": id,
        "mensagem":"Consulta de reservas funcionando"
    }