Dado('que soy un usuario no registrado') do
  RepositorioUsuarios.new.delete_all
end

Cuando('quiero registrarme con el mail {string} y el nombre {string}') do |mail, nombre|
  request_body = { nombre: nombre, email: mail, id: 1, telegram_username: 'user' }.to_json
  @response = Faraday.post(get_url_for('/usuarios'), request_body, { 'Content-Type' => 'application/json' })
end

Entonces('veo que se crea correctamente el usuario') do
	expect(@response.status).to be 201
end

Y('tiene un id único') do
  response_parseado = JSON.parse(@response.body)
  id = response_parseado['id']
  expect(id.to_i).to be > 0
end

Y('tiene {string} como nombre') do |nombre_esperado|
  response_parseado = JSON.parse(@response.body)
  nombre = response_parseado['nombre']
  expect(nombre).to eq nombre_esperado
end

Y('tiene {string} como mail') do |mail_esperado|
  response_parseado = JSON.parse(@response.body)
  email = response_parseado['email']
  expect(email).to eq mail_esperado
end

Dado('existe un usuario con el mail {string}') do |mail|
  request_body = { nombre: 'nombre', email: mail, telegram_username: 'user' }.to_json
  Faraday.post(get_url_for('/usuarios'), request_body, { 'Content-Type' => 'application/json' })
end

Entonces('no se crea el usuario') do
  expect(@response.status).to be 409
end
