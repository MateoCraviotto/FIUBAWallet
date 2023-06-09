
Dado('que soy un usuario con saldo "{int}"') do |saldo|
  request_body = { nombre: 'Juan', email: 'juan@test.com', telegram_id: 1, telegram_username: 'juan' }.to_json
  respuesta = JSON.parse(
    Faraday.post('/usuarios', request_body, { 'Content-Type' => 'application/json' }).body
  )
  @usuario = RepositorioUsuarios.new.find(respuesta['id'])
  @usuario.cargar_saldo(saldo)
end

Cuando('quiero cargar saldo "{int}"') do |saldo|
  request_body = { telegram_id: @usuario.telegram_id, saldo: saldo }.to_json
  @resultado_carga = Faraday.post('/saldo', request_body, { 'Content-Type' => 'application/json' })
end

Entonces('mi saldo pasa a ser "{int}"') do |saldo_esperado|
  @saldo = JSON.parse(Faraday.get('/saldo',{ usuario: @usuario.telegram_id } ).body)['saldo']
  expect(@saldo).to eq saldo_esperado
end

Cuando('quiero cargar un saldo de "{int}" siendo usuario no registrado') do |saldo|
  request_body = { telegram_id: 0, saldo: saldo }.to_json
  @resultado_carga = Faraday.post('/saldo', request_body, { 'Content-Type' => 'application/json' })
end

Entonces(/^veo que no puedo cargar$/) do
  expect(@resultado_carga.status).to eq 400
end
