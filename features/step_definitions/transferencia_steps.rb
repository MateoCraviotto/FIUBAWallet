
Dado('existe un usuario con el nombre {string} con saldo {float}') do |nombre, saldo|
  request_body = { nombre: nombre, email: nombre+'@test.com' }.to_json
  respuesta = JSON.parse(Faraday.post('/usuarios', request_body, { 'Content-Type' => 'application/json' }).body)
  @otro_usuario = RepositorioUsuarios.new.find(respuesta['id'])
  @otro_usuario.cargar_saldo(saldo)
  @otro_usuario_tid = respuesta['telegram_id']
end

Dado('que soy un usuario registrado y poseo saldo {float}') do |saldo|
  request_body = { nombre: 'nombre', email: 'mail@test.com' }.to_json
  respuesta = JSON.parse(Faraday.post('/usuarios', request_body, { 'Content-Type' => 'application/json' }).body)
  @usuario = RepositorioUsuarios.new.find(respuesta['id'])
  @usuario.cargar_saldo(saldo)
  @usuario_tid = respuesta['telegram_id']
end

Entonces('el saldo del usuario al que le transferi es de {int}') do |saldo_esperado|
  saldo = JSON.parse(Faraday.get('/saldo',{ usuario: @otro_usuario_tid } ).body)['saldo']
  expect(saldo).to eq saldo_esperado
end

When('quiero transferir {float} al usuario registrado {string}') do |saldo, nombre|
  request_body = { id: @usuario.id, saldo: saldo, usuario_objetivo: nombre }.to_json
  Faraday.post('/transferir', request_body, { 'Content-Type' => 'application/json' })
end

Entonces('mi saldo pasa a ser {int}') do |saldo_esperado|
  saldo = JSON.parse(Faraday.get('/saldo',{ usuario: @usuario_tid } ).body)['saldo']
  expect(saldo).to eq saldo_esperado
end
